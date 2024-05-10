create or alter proc TRX_Adjustment_GetDataDetail
(
	@DOCNUMBER nvarchar(20)
)
AS          
BEGIN
	BEGIN TRY
		SELECT A.*, COALESCE(B.Item_SKU, '') Item_SKU
		FROM POS_TrxAdjustment_Detail A
		INNER JOIN POS_TrxAdjustment_Header HDR ON A.DOCNUMBER=HDR.DOCNUMBER
		INNER JOIN POS_ItemVariant B ON A.Item_Number=B.Item_Number and A.LineItem_Option=B.LineItem_Option and HDR.Site_ID=B.Site_ID
		WHERE A.DOCNUMBER = @DOCNUMBER
		UNION
		SELECT A.*, COALESCE(B.Item_SKU, '') Item_SKU
		FROM POS_TrxAdjustment_Detail A
		INNER JOIN POS_TrxAdjustment_Header HDR ON A.DOCNUMBER=HDR.DOCNUMBER
		INNER JOIN POS_Item B ON A.Item_Number=B.Item_Number and HDR.Site_ID=B.Site_ID
		WHERE A.DOCNUMBER = @DOCNUMBER and A.Item_Number not in(select X.Item_Number from POS_ItemVariant X)
	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000),@ErrorSeverity INT,@ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState)
	END CATCH
END
GO
create or alter proc TRX_Adjustment_GetDataHeader
(
	@DOCNUMBER nvarchar(20)
)
AS          
BEGIN
	BEGIN TRY
		SELECT *
		FROM POS_TrxAdjustment_Header A
		WHERE A.DOCNUMBER = @DOCNUMBER
	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000),@ErrorSeverity INT,@ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState)
	END CATCH
END
GO
/*
exec TRX_Adjustment_GetDataHeader 'SA0001'
*/
create or alter proc TRX_Adjustment_GetDataList
(
	@Reason nvarchar(30),
	@Store_ID nvarchar(20),
	@Site_ID nvarchar(20)
)
AS          
BEGIN
	BEGIN TRY
		SELECT A.DOCNUMBER, A.DOCDATE, A.Reason, COALESCE(C.Store_Name, '') Store_Name, A.Site_ID, A.Site_Name, SUM(ISNULL(QTY, 0)) QUANTITY
		FROM POS_TrxAdjustment_Header A
		INNER JOIN (
			SELECT DOCNUMBER, 
			CASE
			WHEN LOWER(Reason) = 'inventory count' THEN ISNULL(Counted_Stock, 0)
			WHEN LOWER(Reason) = 'receive items' THEN ISNULL(Qty_Add_Stock, 0)
			ELSE ISNULL(Qty_Remove_Stock, 0) END QTY
			FROM POS_TrxAdjustment_Detail
		) B ON A.DOCNUMBER=B.DOCNUMBER
		left join POS_Set_Site C ON A.Site_ID=C.Site_ID
		WHERE 1=1 and
		(A.Reason = @Reason or @Reason = '') and
		(C.Store_ID = @Store_ID or @Store_ID = '') and
		(A.Site_ID = @Site_ID or @Site_ID = '')
		GROUP BY A.DOCNUMBER, A.DOCDATE, A.Reason, C.Store_Name, A.Site_ID, A.Site_Name
	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000),@ErrorSeverity INT,@ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState)
	END CATCH
END
GO
/*
exec TRX_Adjustment_GetDataList '', '', ''
*/
create or alter proc TRX_Adjustment_GetItemBySite
(
	@Item_Number nvarchar(20),
	@LineItem_Option numeric(19,5),
	@Site_ID nvarchar(20)
)
AS          
BEGIN
	BEGIN TRY
		SELECT *
		FROM(
			select Z.Item_Number, Z.Item_Description, Z.LineItem_Option, Z.Item_SKU, ISNULL(B.InStock, 0) InStock, ISNULL(B.Item_Cost, 0) Item_Cost
			from(
				SELECT DISTINCT A.Item_Number, 
				A.Item_Name + CASE
				WHEN COALESCE(B.Variant_Name, '') <> '' THEN ' (' + COALESCE(B.Variant_Name, '') + ')'
				ELSE '' END Item_Description, 
				ISNULL(B.LineItem_Option, 0) LineItem_Option, COALESCE(B.Item_SKU, '') Item_SKU
				FROM POS_Item A
				left join POS_ItemVariant B ON A.Item_Number=B.Item_Number
			) Z
			left join POS_ItemVariant B ON Z.Item_Number=B.Item_Number and Z.Item_SKU=B.Item_SKU
			where B.Site_ID=@Site_ID and (Z.Item_Number=@Item_Number or @Item_Number='') 
			and (Z.LineItem_Option in (@LineItem_Option) or @LineItem_Option=0)
			UNION
			select X.Item_Number, X.Item_Description, 0 LineItem_Option, X.Item_SKU, X.InStock, X.Item_Cost
			from POS_Item X
			where X.Site_ID=@Site_ID and (X.Item_Number=@Item_Number or @Item_Number='') and @LineItem_Option=0
			and X.Item_Number not in(select Item_Number from POS_ItemVariant)
		) A
		order by A.Item_SKU
	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000),@ErrorSeverity INT,@ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState)
	END CATCH
END
GO
/*
exec TRX_Adjustment_GetItemBySite '', 0, 'SITE0001'
exec TRX_Adjustment_GetItemBySite 'ITM0001', 1, 'SITE0001'
*//*
begin tran

declare @p9 dbo.TrxAdjDetailTYPE
insert into @p9 values('2024-01-27 09:46:54',N'Receive Items',10,N'ITM0001',N'tester',0.0,50.0,0.0,0.0,50.0,0.0,0.0)

exec TRX_Adjustment_Save @DOCNUMBER=N'',@DOCDATE='2024-01-27 09:46:54',@Site_ID=N'SITE0001',@Site_Name=N'SITE A',@Reason=N'Receive Items',@Total_Line_Item=1,@Notes=N'tester',@UserID=N'USER1',@TrxAdjDetailTYPE=@p9

rollback
*/
create or alter proc TRX_Adjustment_Save
(
	@DOCNUMBER nvarchar(20), 
	@DOCDATE DATETIME,
	@Site_ID nvarchar(20), 
	@Site_Name nvarchar(100), 
	@Reason nvarchar(30), 
	@Total_Line_Item int,
	@Notes nvarchar(500),
	@UserID nvarchar(20),
	@TrxAdjDetailTYPE TrxAdjDetailTYPE readonly
)
AS          
BEGIN
	BEGIN TRY
		IF LEN(RTRIM(@Reason)) = 0
		BEGIN
			RAISERROR('Please choose reason', 16, 1)
		END
		IF LEN(RTRIM(@Site_ID)) = 0
		BEGIN
			RAISERROR('Please choose site', 16, 1)
		END
		IF NOT EXISTS(SELECT * FROM @TrxAdjDetailTYPE)
		BEGIN
			RAISERROR('Please fill items', 16, 1)
		END
		IF EXISTS(SELECT * FROM POS_TrxAdjustment_Header WITH(NOLOCK) WHERE RTRIM(DOCNUMBER)=RTRIM(@DOCNUMBER))
		BEGIN
			UPDATE POS_TrxAdjustment_Header
			SET DOCDATE=@DOCDATE, Site_ID=@Site_ID, Site_Name=@Site_Name, Reason=@Reason, Total_Line_Item=@Total_Line_Item, Notes=@Notes,
			Modified_User=@UserID, Modified_Date=CAST(GETDATE() as date), Modified_time=CAST(GETDATE() as time)
			WHERE RTRIM(DOCNUMBER)=RTRIM(@DOCNUMBER)
		END
		ELSE
		BEGIN
			IF LEN(RTRIM(@DOCNUMBER)) = 0
			BEGIN
				declare @TEMPTABLE table(CurrentNumber varchar(20))
				INSERT INTO @TEMPTABLE(CurrentNumber)
				EXEC TRX_GenerateNumberPerDay_Master @DOCID=N'SA'

				SELECT TOP 1 @DOCNUMBER=CurrentNumber FROM @TEMPTABLE
			END
			INSERT INTO [POS_TrxAdjustment_Header]
			(DOCNUMBER, DOCDATE, Site_ID, Site_Name, Reason, Total_Line_Item, Notes, Created_User, Created_Date, Created_time, Modified_User, Modified_Date, Modified_time)
			VALUES
			(@DOCNUMBER, @DOCDATE, @Site_ID, @Site_Name, @Reason, @Total_Line_Item, @Notes, @UserID, CAST(GETDATE() as date), CAST(GETDATE() as time), '', '', '')
		END

		DELETE FROM POS_TrxAdjustment_Detail WHERE RTRIM(DOCNUMBER)=RTRIM(@DOCNUMBER)
			
		INSERT INTO POS_TrxAdjustment_Detail(DOCNUMBER, DOCDATE, Reason, Lineitmseq, Item_Number, LineItem_Option, Item_Description, Qty_Stock, Qty_Add_Stock, Qty_Remove_Stock, 
		Item_Cost, Qty_After_Stock, Expected_Stock, Counted_Stock, Created_User, Created_Date, Created_time, Modified_User, Modified_Date, Modified_time)
		SELECT @DOCNUMBER, DOCDATE, Reason, Lineitmseq, Item_Number, LineItem_Option, Item_Description, Qty_Stock, Qty_Add_Stock, Qty_Remove_Stock, 
		Item_Cost, Qty_After_Stock, Expected_Stock, Counted_Stock, @UserID, CAST(GETDATE() as date), CAST(GETDATE() as time), @UserID, CAST(GETDATE() as date), CAST(GETDATE() as time)
		FROM @TrxAdjDetailTYPE

		UPDATE A
		SET A.InStock=CASE
			WHEN LOWER(RTRIM(@Reason)) = 'inventory count' THEN ISNULL(B.Counted_Stock, 0)
			ELSE ISNULL(B.Qty_After_Stock, 0) END
		FROM POS_Item A
		INNER JOIN POS_TrxAdjustment_Detail B ON A.Item_Number=B.Item_Number
		WHERE RTRIM(B.DOCNUMBER)=RTRIM(@DOCNUMBER) and RTRIM(A.Site_ID)=RTRIM(@Site_ID)

		UPDATE A
		SET A.InStock=CASE
			WHEN LOWER(RTRIM(@Reason)) = 'inventory count' THEN ISNULL(B.Counted_Stock, 0)
			ELSE ISNULL(B.Qty_After_Stock, 0) END
		FROM POS_ItemVariant A
		INNER JOIN POS_TrxAdjustment_Detail B ON A.Item_Number=B.Item_Number and A.LineItem_Option=B.LineItem_Option
		WHERE RTRIM(B.DOCNUMBER)=RTRIM(@DOCNUMBER) and RTRIM(A.Site_ID)=RTRIM(@Site_ID)

		INSERT INTO POS_TrxAdjustment_HeaderHIST(DOCNUMBER, DOCDATE, Site_ID, Site_Name, Reason, Total_Line_Item, Notes, Created_User, Created_Date, Created_time)
		SELECT DOCNUMBER, DOCDATE, Site_ID, Site_Name, Reason, Total_Line_Item, Notes, @UserID, CAST(GETDATE() as date), CAST(GETDATE() as time)
		FROM POS_TrxAdjustment_Header
		WHERE RTRIM(DOCNUMBER)=RTRIM(@DOCNUMBER)

		INSERT INTO POS_TrxAdjustment_DetailHIST(DOCNUMBER, DOCDATE, Reason, Lineitmseq, Item_Number, LineItem_Option, Item_Description, Qty_Stock, 
		Qty_Add_Stock, Qty_Remove_Stock, Item_Cost, Qty_After_Stock, Expected_Stock, Counted_Stock, Created_User, Created_Date, Created_time)
		SELECT DOCNUMBER, DOCDATE, Reason, Lineitmseq, Item_Number, LineItem_Option, Item_Description, Qty_Stock, Qty_Add_Stock, Qty_Remove_Stock, Item_Cost, 
		Qty_After_Stock, Expected_Stock, Counted_Stock, @UserID, CAST(GETDATE() as date), CAST(GETDATE() as time)
		FROM POS_TrxAdjustment_Detail
		WHERE RTRIM(DOCNUMBER)=RTRIM(@DOCNUMBER)

		SELECT CODE='200', DOCNUMBER=@DOCNUMBER

	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000),@ErrorSeverity INT,@ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState)
	END CATCH
END
GO
IF EXISTS(SELECT * FROM SYSOBJECTS WHERE name='TRX_GenerateNumberPerDay_Master')
	DROP PROC TRX_GenerateNumberPerDay_Master
GO
CREATE proc [dbo].[TRX_GenerateNumberPerDay_Master]  
(  
 @DOCID NVARCHAR(30)
)  
AS BEGIN
	BEGIN TRY
		declare @IDMAX INT = 0, @p15 nvarchar(255)=''
		DECLARE @DocNo varchar(max)=''
		DECLARE @CURRENTDATE DATETIME = CAST(GETDATE() as DATE)
		DECLARE @LineItem int = 10

		IF RTRIM(COALESCE(@DOCID, '')) = ''
		BEGIN
			RAISERROR('Document ID not found.', 16, 1)
		END

		IF NOT EXISTS(select DocumentID from POS_RunningNumber where DocumentID=@DOCID and CAST(CurrentDate as DATE)=CAST(@CURRENTDATE as DATE))
		BEGIN
			SET @IDMAX = @IDMAX + 1
			SET @DocNo = @DOCID + '-' + FORMAT(@CURRENTDATE, 'dd-MM-yyyy') + '-' + REPLICATE('0', 3 - LEN(@IDMAX)) + CONVERT(nvarchar(68), @IDMAX)
		END
		ELSE
		BEGIN
			SELECT top 1 @IDMAX=ISNULL(cast(REPLACE(CurrentNumber,@DOCID + '-' + FORMAT(@CURRENTDATE, 'dd-MM-yyyy') + '-','') as INT), 0)
			FROM POS_RunningNumber 
			WHERE DocumentID=@DOCID

			SET @IDMAX = @IDMAX + 1

			SET @DocNo = @DOCID + '-' + FORMAT(@CURRENTDATE, 'dd-MM-yyyy') + '-' + REPLICATE('0', 3 - LEN(@IDMAX)) + CONVERT(nvarchar(68), @IDMAX)
		END

		IF NOT EXISTS(select DocumentID from POS_RunningNumber where DocumentID=@DOCID)
		BEGIN
			INSERT INTO POS_RunningNumber(DocumentID, CurrentNumber, CurrentDate)
			select @DOCID, @DocNo, @CURRENTDATE
		END
		ELSE
		BEGIN
			UPDATE POS_RunningNumber
			SET CurrentNumber=@DocNo, CurrentDate=@CURRENTDATE
			WHERE DocumentID=@DOCID
		END

		IF NOT EXISTS(select DocumentID from POS_RunningNumber_History where DocumentID=@DOCID)
		BEGIN
			INSERT INTO POS_RunningNumber_History(DocumentID, LineItem, CurrentNumber, CurrentDate)
			select @DOCID, @LineItem, @DocNo, @CURRENTDATE
		END
		ELSE IF NOT EXISTS(select DocumentID from POS_RunningNumber_History where DocumentID=@DOCID and CAST(CurrentDate as DATE)=CAST(@CURRENTDATE as DATE))
		BEGIN
			SELECT @LineItem=ISNULL(MAX(LineItem), 0) + 10
			from POS_RunningNumber_History where DocumentID=@DOCID

			INSERT INTO POS_RunningNumber_History(DocumentID, LineItem, CurrentNumber, CurrentDate)
			select @DOCID, @LineItem, @DocNo, @CURRENTDATE
		END
		ELSE IF EXISTS(select DocumentID from POS_RunningNumber_History where DocumentID=@DOCID)
		BEGIN
			UPDATE POS_RunningNumber_History
			SET CurrentNumber=@DocNo
			WHERE DocumentID=@DOCID
		END

		select @DocNo as GENNUMBER
	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000)
		DECLARE @ErrorSeverity INT
		DECLARE @ErrorState INT

		SELECT @ErrorMessage = ERROR_MESSAGE(),
			   @ErrorSeverity = ERROR_SEVERITY(),
			   @ErrorState = ERROR_STATE()

		RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState)
		select @ErrorMessage as output
	END CATCH 
END  
GO
/*  
begin tran
exec TRX_GenerateNumberPerDay_Master @DOCID=N'INV'
select * from POS_RunningNumber
select * from POS_RunningNumber_History
exec TRX_GenerateNumberPerDay_Master @DOCID=N'INV'
rollback
*/
CREATE OR ALTER proc [dbo].[TRX_GenerateNumber_Master]  
(  
 @TABLE NVARCHAR(30),
 @FIELD NVARCHAR(30),
 @DOCID NVARCHAR(30)
)  
AS BEGIN
	BEGIN TRY
		DECLARE @QUERY VARCHAR(MAX) = ''  
 
		 IF @DOCID != ''
		 begin
			SET @QUERY = '
			IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N''[dbo].['+@TABLE+']'') AND type in (N''U''))
			BEGIN
				RAISERROR(''Ups, something went wrong.'', 16, 1)
			END
			ELSE IF NOT EXISTS (SELECT 1 FROM sys.schemas s
							JOIN sys.tables t ON s.schema_id = t.schema_id
							JOIN sys.columns c ON t.object_id = c.object_id
							WHERE s.name = N''dbo'' AND t.name = N'''+@TABLE+''' AND c.name = N'''+@FIELD+''')
			BEGIN
				RAISERROR(''Ups, cannot find new number.'', 16, 1)
			END'
			EXEC(@QUERY)

			SET @QUERY = 'declare @IDMAX INT = 0, @p15 nvarchar(255)='''', @NEWDOC nvarchar(30)='''+@DOCID+'''
			DECLARE @DocNo varchar(max)=''''

			SELECT top 1 @IDMAX= cast(REPLACE('+@FIELD+',@NEWDOC,'''') as INT)     
			FROM '+@TABLE+' 
			order by '+@FIELD+' DESC  
  
			SET @IDMAX= @IDMAX + 1

			IF @IDMAX = 9999
			BEGIN
				SET @IDMAX = 0
		
				SET @NEWDOC = @NEWDOC + ''2-''

				SELECT top 1 @IDMAX= cast(REPLACE('+@FIELD+',@NEWDOC,'''') as INT)     
				FROM '+@TABLE+'  
				order by '+@FIELD+' DESC  
  
				SET @IDMAX= @IDMAX + 1
			END

			SET @DocNo = @NEWDOC + REPLICATE(''0'', 6 - LEN(@IDMAX))+CONVERT(nvarchar(68), @IDMAX)
			select @DocNo as OUTPUT'
		 end

		 EXEC(@QUERY)
	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000)
		DECLARE @ErrorSeverity INT
		DECLARE @ErrorState INT

		SELECT @ErrorMessage = ERROR_MESSAGE(),
			   @ErrorSeverity = ERROR_SEVERITY(),
			   @ErrorState = ERROR_STATE()

		RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState)
		select @ErrorMessage as output
	END CATCH 
END  
GO
IF EXISTS(SELECT * FROM SYSOBJECTS WHERE name='TRX_GenerateNumber_Master')
	DROP PROC TRX_GenerateNumber_Master
GO
CREATE proc [dbo].[TRX_GenerateNumber_Master]  
(  
 @DOCID NVARCHAR(30)
)  
AS BEGIN
	BEGIN TRY
		declare @IDMAX INT = 0, @p15 nvarchar(255)=''
		DECLARE @DocNo varchar(max)=''
		DECLARE @CURRENTDATE DATETIME = CAST(GETDATE() as DATE)
		DECLARE @LineItem int = 10

		IF RTRIM(COALESCE(@DOCID, '')) = ''
		BEGIN
			RAISERROR('Document ID not found.', 16, 1)
		END

		IF NOT EXISTS(select DocumentID from POS_RunningNumber where DocumentID=@DOCID and CAST(CurrentDate as DATE)=CAST(@CURRENTDATE as DATE))
		BEGIN
			SET @IDMAX = @IDMAX + 1
			SET @DocNo = @DOCID + FORMAT(@CURRENTDATE, 'yyMMdd') + REPLICATE('0', 4 - LEN(@IDMAX))+CONVERT(nvarchar(68), @IDMAX)
		END
		ELSE
		BEGIN
			SELECT top 1 @IDMAX=ISNULL(cast(REPLACE(CurrentNumber,@DOCID+FORMAT(@CURRENTDATE, 'yyMMdd'),'') as INT), 0)
			FROM POS_RunningNumber 
			WHERE DocumentID=@DOCID

			SET @IDMAX = @IDMAX + 1

			SET @DocNo = @DOCID + FORMAT(@CURRENTDATE, 'yyMMdd') + REPLICATE('0', 4 - LEN(@IDMAX))+CONVERT(nvarchar(68), @IDMAX)
		END

		IF NOT EXISTS(select DocumentID from POS_RunningNumber where DocumentID=@DOCID)
		BEGIN
			INSERT INTO POS_RunningNumber(DocumentID, CurrentNumber, CurrentDate)
			select @DOCID, @DocNo, @CURRENTDATE
		END
		ELSE
		BEGIN
			UPDATE POS_RunningNumber
			SET CurrentNumber=@DocNo, CurrentDate=@CURRENTDATE
			WHERE DocumentID=@DOCID
		END

		IF NOT EXISTS(select DocumentID from POS_RunningNumber_History where DocumentID=@DOCID)
		BEGIN
			INSERT INTO POS_RunningNumber_History(DocumentID, LineItem, CurrentNumber, CurrentDate)
			select @DOCID, @LineItem, @DocNo, @CURRENTDATE
		END
		ELSE IF NOT EXISTS(select DocumentID from POS_RunningNumber_History where DocumentID=@DOCID and CAST(CurrentDate as DATE)=CAST(@CURRENTDATE as DATE))
		BEGIN
			SELECT @LineItem=ISNULL(MAX(LineItem), 0) + 10
			from POS_RunningNumber_History where DocumentID=@DOCID

			INSERT INTO POS_RunningNumber_History(DocumentID, LineItem, CurrentNumber, CurrentDate)
			select @DOCID, @LineItem, @DocNo, @CURRENTDATE
		END
		ELSE IF EXISTS(select DocumentID from POS_RunningNumber_History where DocumentID=@DOCID)
		BEGIN
			UPDATE POS_RunningNumber_History
			SET CurrentNumber=@DocNo
			WHERE DocumentID=@DOCID
		END

		select @DocNo as GENNUMBER
	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000)
		DECLARE @ErrorSeverity INT
		DECLARE @ErrorState INT

		SELECT @ErrorMessage = ERROR_MESSAGE(),
			   @ErrorSeverity = ERROR_SEVERITY(),
			   @ErrorState = ERROR_STATE()

		RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState)
		select @ErrorMessage as output
	END CATCH 
END  
GO
/*  
begin tran
exec TRX_GenerateNumber_Master @DOCID=N'INV'
select * from POS_RunningNumber
select * from POS_RunningNumber_History
rollback
*/
create or alter proc TRX_GetSummaryShift
(
	@Batch_ID nvarchar(20)
)
AS          
BEGIN
	BEGIN TRY
		SELECT Batch_ID, LastEdit_Date, LastEdit_time, Store_ID, POS_Device_ID, Opening_Date, Opening_time, Closing_Date, Closing_time, 
		Sum_Amount_Opening, Sum_Amount_Closing, Sum_Invoice_Posted, Sum_Tendered, Sum_Changes, Sum_Amount_Discount, Sum_Amount_Tax, 
		Sum_Invoice_Refund_Posted, Sum_Amount_PayOut, Sum_Amount_PayIn, Count_Customers, Status_Batch, Created_User, Created_Date, Created_time
		FROM POS_Summ_OpenCloseShift WITH(NOLOCK) 
		WHERE RTRIM(Batch_ID)=RTRIM(@Batch_ID)
	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000),@ErrorSeverity INT,@ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState)
	END CATCH
END
GO
create or alter proc TRX_InvCounts_GetCategory
AS          
BEGIN
	BEGIN TRY
		select Category_ID, Category_Name from POS_CategoryItem
		--where Category_ID in(select Category_ID from POS_Item where Site_ID=@Site_ID)
	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000),@ErrorSeverity INT,@ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState)
	END CATCH
END
GO
/*
exec TRX_InvCounts_GetCategory
*/
create or alter proc TRX_InvCounts_GetItemBySite
(
	@Item_Number nvarchar(20),
	@LineItem_Option numeric(19,5),
	@Site_ID nvarchar(20),
	@Category_ID nvarchar(MAX)
)
AS          
BEGIN
	BEGIN TRY
		SELECT *
		FROM(
			select Z.Item_Number, Z.Item_Description, Z.LineItem_Option, Z.Item_SKU, 
			CASE WHEN @Site_ID='' THEN 0 ELSE ISNULL(B.InStock, 0) END InStock, ISNULL(B.Item_Cost, 0) Item_Cost
			from(
				SELECT DISTINCT A.Item_Number, 
				A.Item_Name + CASE
				WHEN COALESCE(B.Variant_Name, '') <> '' THEN ' (' + COALESCE(B.Variant_Name, '') + ')'
				ELSE '' END Item_Description, 
				ISNULL(B.LineItem_Option, 0) LineItem_Option, COALESCE(B.Item_SKU, '') Item_SKU
				FROM POS_Item A
				left join POS_ItemVariant B ON A.Item_Number=B.Item_Number
				where A.Category_ID in(select value from STRING_SPLIT(@Category_ID, ',')) or @Category_ID=''
			) Z
			left join POS_ItemVariant B ON Z.Item_Number=B.Item_Number and Z.Item_SKU=B.Item_SKU
			where B.Site_ID=@Site_ID and (Z.Item_Number=@Item_Number or @Item_Number='') 
			and (Z.LineItem_Option in (@LineItem_Option) or @LineItem_Option=0)
			UNION
			select X.Item_Number, X.Item_Description, 0 LineItem_Option, X.Item_SKU, 
			CASE WHEN @Site_ID='' THEN 0 ELSE X.InStock END InStock, X.Item_Cost
			from POS_Item X
			where X.Site_ID=@Site_ID and (X.Item_Number=@Item_Number or @Item_Number='') and @LineItem_Option=0
			and X.Item_Number not in(select Item_Number from POS_ItemVariant) 
			and (X.Category_ID in(select value from STRING_SPLIT(@Category_ID, ',')) or @Category_ID='')
		) A
		order by A.Item_SKU
	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000),@ErrorSeverity INT,@ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState)
	END CATCH
END
GO
/*
exec TRX_InvCounts_GetItemBySite @Item_Number=N'',@LineItem_Option=0,@Site_ID=N'',@Category_ID=N''
exec TRX_InvCounts_GetItemBySite @Item_Number=N'',@LineItem_Option=0,@Site_ID=N'SITE0001',@Category_ID=N'CAT0001,CAT0002'
*//*
exec TRX_InvCount_GetDataDetail @DOCNUMBER=N'IVC-31-03-2024-001'
*/
create or alter proc TRX_InvCount_GetDataDetail
(
	@DOCNUMBER nvarchar(20)
)
AS          
BEGIN
	BEGIN TRY
		IF NOT EXISTS(SELECT * FROM POS_TrxInvCount_HeaderTEMP with (nolock) WHERE RTRIM(DOCNUMBER)=RTRIM(@DOCNUMBER))
		and NOT EXISTS(SELECT * FROM POS_TrxInvCount_HeaderPOST with (nolock) WHERE RTRIM(DOCNUMBER)=RTRIM(@DOCNUMBER))
		and LEN(COALESCE(@DOCNUMBER, '')) > 0
		BEGIN
			RAISERROR('Document number not found', 16, 1)
		END

		SELECT A.DOCNUMBER, A.DOCDATE, A.Lineitmseq, A.Item_Number, A.Item_Description, A.Item_SKU, A.Expected_Stock, A.Counted_Stock, A.Different_Stock, 
		A.Item_Cost, A.Item_Cost_Different, A.Created_User, A.Created_Date, A.Created_time, A.Modified_User, A.Modified_Date, A.Modified_time, 
		ISNULL(B.Total_Different_Stock, 0) Total_Different_Stock, ISNULL(B.Total_Item_Cost_Different, 0) Total_Item_Cost_Different, ISNULL(C.LineItem_Option, 0) LineItem_Option
		FROM POS_TrxInvCount_DetailTEMP A with (nolock)
		LEFT JOIN (
			select DOCNUMBER, SUM(Different_Stock) Total_Different_Stock, SUM(Item_Cost_Different) Total_Item_Cost_Different
			from POS_TrxInvCount_DetailTEMP with (nolock)
			GROUP BY DOCNUMBER
		) B ON A.DOCNUMBER=B.DOCNUMBER
		LEFT JOIN POS_ItemVariant C with (nolock) ON A.Item_Number=C.Item_Number and A.Item_SKU=C.Item_SKU
		WHERE RTRIM(A.DOCNUMBER)=RTRIM(@DOCNUMBER)
		UNION
		SELECT A.DOCNUMBER, A.DOCDATE, A.Lineitmseq, A.Item_Number, A.Item_Description, A.Item_SKU, A.Expected_Stock, A.Counted_Stock, A.Different_Stock, 
		A.Item_Cost, A.Item_Cost_Different, A.Created_User, A.Created_Date, A.Created_time, A.Modified_User, A.Modified_Date, A.Modified_time, 
		ISNULL(B.Total_Different_Stock, 0) Total_Different_Stock, ISNULL(B.Total_Item_Cost_Different, 0) Total_Item_Cost_Different, ISNULL(C.LineItem_Option, 0) LineItem_Option
		FROM POS_TrxInvCount_DetailPOST A with (nolock)
		LEFT JOIN (
			select DOCNUMBER, SUM(Different_Stock) Total_Different_Stock, SUM(Item_Cost_Different) Total_Item_Cost_Different
			from POS_TrxInvCount_DetailPOST with (nolock)
			GROUP BY DOCNUMBER
		) B ON A.DOCNUMBER=B.DOCNUMBER
		LEFT JOIN POS_ItemVariant C with (nolock) ON A.Item_Number=C.Item_Number and A.Item_SKU=C.Item_SKU
		WHERE RTRIM(A.DOCNUMBER)=RTRIM(@DOCNUMBER)
	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000),@ErrorSeverity INT,@ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState)
	END CATCH
END
GO
/*
exec TRX_InvCount_GetDataList @DOCNUMBER=N''
*/
create or alter proc TRX_InvCount_GetDataList
(
	@DOCNUMBER nvarchar(20),
	@Status int,
	@Site_ID nvarchar(20)
)
AS          
BEGIN
	BEGIN TRY
		IF NOT EXISTS(SELECT * FROM POS_TrxInvCount_HeaderTEMP WHERE RTRIM(DOCNUMBER)=RTRIM(@DOCNUMBER))
		and NOT EXISTS(SELECT * FROM POS_TrxInvCount_HeaderPOST WHERE RTRIM(DOCNUMBER)=RTRIM(@DOCNUMBER))
		and LEN(COALESCE(@DOCNUMBER, '')) > 0
		BEGIN
			RAISERROR('Document number not found', 16, 1)
		END

		SELECT DOCNUMBER, DOCDATE, Completed_Date, Site_ID, Site_Name, Type_Inventory_Count, Total_Line_Item, 
		Notes, [Status], CASE 
		WHEN [Status]=1 THEN 'Save' 
		WHEN [Status]=2 THEN 'In progress'
		WHEN [Status]=3 THEN 'Completed'
		ELSE '' END Status_Txt,
		Created_User, Created_Date, Created_time, Modified_User, Modified_Date, Modified_time
		FROM POS_TrxInvCount_HeaderTEMP 
		WHERE (RTRIM(DOCNUMBER)=RTRIM(@DOCNUMBER) or LEN(COALESCE(@DOCNUMBER, ''))=0)
		and ([Status]=@Status or @Status=0) and (Site_ID=@Site_ID or LEN(COALESCE(@Site_ID, ''))=0)
		UNION
		SELECT DOCNUMBER, DOCDATE, Completed_Date, Site_ID, Site_Name, Type_Inventory_Count, Total_Line_Item, 
		Notes, [Status], CASE 
		WHEN [Status]=1 THEN 'Save' 
		WHEN [Status]=2 THEN 'In progress'
		WHEN [Status]=3 THEN 'Completed'
		ELSE '' END Status_Txt,
		Created_User, Created_Date, Created_time, Modified_User, Modified_Date, Modified_time
		FROM POS_TrxInvCount_HeaderPOST 
		WHERE (RTRIM(DOCNUMBER)=RTRIM(@DOCNUMBER) or LEN(COALESCE(@DOCNUMBER, ''))=0)
		and ([Status]=@Status or @Status=0) and (Site_ID=@Site_ID or LEN(COALESCE(@Site_ID, ''))=0)
	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000),@ErrorSeverity INT,@ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState)
	END CATCH
END
GO
/*
begin tran

declare @p8 dbo.TrxInvCountTYPE
insert into @p8 values(10,N'ITM0003',N'SERAGAM SD (S / GS)',N'',100.0,0.0,0.0,0.0,0.0)
insert into @p8 values(20,N'ITM0003',N'SERAGAM SD (S / SUPER)',N'',100.0,0.0,0.0,0.0,0.0)

exec TRX_InvCount_Save @DOCNUMBER=N'',@Site_ID=N'SITE0002',@Site_Name=N'SITE B',@Type_Inventory_Count=1,@Notes=N'tester',@Status=1,@UserID=N'USER1',@TrxInvCountTYPE=@p8

rollback
*/
create or alter proc TRX_InvCount_Save
(
	@DOCNUMBER nvarchar(20), 
	@Site_ID nvarchar(20), 
	@Site_Name nvarchar(100), 
	@Type_Inventory_Count int,
	@Notes nvarchar(500), 
	@Status int,
	@InvCount int,
	@UserID nvarchar(20),
	@TrxInvCountTYPE TrxInvCountTYPE readonly
)
AS          
BEGIN
	BEGIN TRY
		IF LEN(RTRIM(@Site_ID)) = 0 and @Status = 3
		BEGIN
			RAISERROR('Please choose site', 16, 1)
		END
		IF NOT EXISTS(SELECT * FROM @TrxInvCountTYPE) and @Type_Inventory_Count=1
		BEGIN
			RAISERROR('Please fill items', 16, 1)
		END

		DECLARE @TrxInvCountTABLE table(Lineitmseq int, Item_Number nvarchar(20), Item_Description nvarchar(250), Item_SKU nvarchar(20), 
		Expected_Stock numeric(19,5), Counted_Stock numeric(19,5), Different_Stock numeric(19,5), Item_Cost numeric(19,5), Item_Cost_Different numeric(19,5))

		INSERT INTO @TrxInvCountTABLE(Lineitmseq, Item_Number, Item_Description, Item_SKU, Expected_Stock, Counted_Stock, Different_Stock, Item_Cost, Item_Cost_Different)
		select distinct Z.Lineitmseq, Z.Item_Number, Z.Item_Description, Z.Item_SKU, Z.Expected_Stock, Z.Counted_Stock, Z.Different_Stock, 
		CASE WHEN COALESCE(B.Item_SKU, '') <> '' THEN ISNULL(B.Item_Cost, 0) ELSE ISNULL(A.Item_Cost, 0) END, Z.Item_Cost_Different
		from @TrxInvCountTYPE Z
		left join POS_Item A ON Z.Item_Number=A.Item_Number
		left join POS_ItemVariant B ON Z.Item_Number=B.Item_Number and Z.Item_SKU=B.Item_SKU

		IF @InvCount=1
		BEGIN
			SELECT @Site_ID=Site_ID, @Site_Name=Site_Name, @Type_Inventory_Count=Type_Inventory_Count, @Notes=Notes 
			FROM POS_TrxInvCount_HeaderTEMP with (nolock)
			WHERE RTRIM(DOCNUMBER)=RTRIM(@DOCNUMBER)
		END

		IF @Type_Inventory_Count=2
		BEGIN
			DELETE FROM @TrxInvCountTABLE

			INSERT INTO @TrxInvCountTABLE(Lineitmseq, Item_Number, Item_Description, Item_SKU, Expected_Stock, Counted_Stock, Different_Stock, Item_Cost, Item_Cost_Different)
			SELECT ROW_NUMBER() OVER(ORDER BY Item_Number), Item_Number, Item_Description, Item_SKU, 0, 0, 0, Item_Cost, 0
			FROM(
				select Z.Item_Number, Z.Item_Description, Z.LineItem_Option, Z.Item_SKU, 
				CASE WHEN @Site_ID='' THEN 0 ELSE ISNULL(B.InStock, 0) END InStock, ISNULL(B.Item_Cost, 0) Item_Cost
				from(
					SELECT DISTINCT A.Item_Number, 
					A.Item_Name + CASE
					WHEN COALESCE(B.Variant_Name, '') <> '' THEN ' (' + COALESCE(B.Variant_Name, '') + ')'
					ELSE '' END Item_Description, 
					ISNULL(B.LineItem_Option, 0) LineItem_Option, COALESCE(B.Item_SKU, '') Item_SKU
					FROM POS_Item A with (nolock)
					left join POS_ItemVariant B with (nolock) ON A.Item_Number=B.Item_Number
				) Z
				left join POS_ItemVariant B ON Z.Item_Number=B.Item_Number and Z.Item_SKU=B.Item_SKU
				where B.Site_ID=@Site_ID
				UNION
				select X.Item_Number, X.Item_Description, 0 LineItem_Option, X.Item_SKU, 
				CASE WHEN @Site_ID='' THEN 0 ELSE X.InStock END InStock, X.Item_Cost
				from POS_Item X
				where X.Site_ID=@Site_ID and X.Item_Number not in(select Item_Number from POS_ItemVariant) 
			) A
			order by A.Item_SKU
		END
		DECLARE @DOCDATE DATETIME = CAST(GETDATE() as date), @Completed_Date DATETIME = '1900-01-01',
				@Total_Line_Item int=0
		
		SELECT @Total_Line_Item=COUNT(*) FROM @TrxInvCountTABLE

		IF @Status=3 BEGIN SET @Completed_Date = CAST(GETDATE() as date) END

		IF @Status < 3
		BEGIN
			IF EXISTS(SELECT * FROM POS_TrxInvCount_HeaderTEMP WITH(NOLOCK) WHERE RTRIM(DOCNUMBER)=RTRIM(@DOCNUMBER))
			BEGIN
				UPDATE POS_TrxInvCount_HeaderTEMP
				SET Completed_Date=CASE WHEN @Status=3 THEN @Completed_Date ELSE '' END, Site_ID=@Site_ID, Site_Name=@Site_Name, Type_Inventory_Count=@Type_Inventory_Count,
				Total_Line_Item=@Total_Line_Item, Notes=@Notes, [Status]=@Status, Modified_User=@UserID, Modified_Date=CAST(GETDATE() as date), Modified_time=CAST(GETDATE() as time)
				WHERE RTRIM(DOCNUMBER)=RTRIM(@DOCNUMBER)
			END
			ELSE IF LEN(RTRIM(@DOCNUMBER)) = 0
			BEGIN
				declare @I int=0
				declare @TEMPTABLE table(CurrentNumber varchar(20))
				WHILE @I < 1
				BEGIN
					DELETE FROM @TEMPTABLE
					INSERT INTO @TEMPTABLE(CurrentNumber)
					EXEC TRX_GenerateNumberPerDay_Master @DOCID=N'IVC'

					SELECT TOP 1 @DOCNUMBER=CurrentNumber, @I=1 FROM @TEMPTABLE

					IF EXISTS(SELECT * FROM POS_TrxInvCount_HeaderTEMP WITH(NOLOCK) WHERE RTRIM(DOCNUMBER)=RTRIM(@DOCNUMBER))
					or EXISTS(SELECT * FROM POS_TrxInvCount_HeaderPOST WITH(NOLOCK) WHERE RTRIM(DOCNUMBER)=RTRIM(@DOCNUMBER))
					BEGIN
						SET @I = 0
					END
				END

				INSERT INTO [POS_TrxInvCount_HeaderTEMP]
				(DOCNUMBER, DOCDATE, Completed_Date, Site_ID, Site_Name, Type_Inventory_Count, Total_Line_Item, 
				Notes, [Status], Created_User, Created_Date, Created_time, Modified_User, Modified_Date, Modified_time)
				VALUES
				(@DOCNUMBER, @DOCDATE, @Completed_Date, @Site_ID, @Site_Name, @Type_Inventory_Count, @Total_Line_Item, 
				@Notes, @Status, @UserID, CAST(GETDATE() as date), CAST(GETDATE() as time), '', '', '')
			END
		END

		DELETE FROM POS_TrxInvCount_DetailTEMP
		WHERE RTRIM(DOCNUMBER)=RTRIM(@DOCNUMBER) and Lineitmseq not in(select Lineitmseq from @TrxInvCountTABLE)
			
		MERGE POS_TrxInvCount_DetailTEMP AS A --TARGET
		USING (
			SELECT *
			FROM @TrxInvCountTABLE X 
		) AS B --SOURCE
		ON A.DOCNUMBER = @DOCNUMBER and A.Lineitmseq=B.Lineitmseq

		WHEN MATCHED THEN
		UPDATE 
		SET Item_Number=B.Item_Number, Item_Description=B.Item_Description, Item_SKU=B.Item_SKU, Expected_Stock=B.Expected_Stock, Counted_Stock=B.Counted_Stock, Different_Stock=B.Different_Stock, 
		Item_Cost=B.Item_Cost, Item_Cost_Different=B.Item_Cost_Different, Modified_User=@UserID, Modified_Date= cast(getdate() as date), Modified_time= cast(getdate() as time)

		WHEN NOT MATCHED BY TARGET THEN
		INSERT(DOCNUMBER, DOCDATE, Lineitmseq, Item_Number, Item_Description, Item_SKU, Expected_Stock, Counted_Stock, Different_Stock, 
		Item_Cost, Item_Cost_Different, Created_User, Created_Date, Created_time, Modified_User, Modified_Date, Modified_time)
		VALUES(@DOCNUMBER, @DOCDATE, B.Lineitmseq, B.Item_Number, B.Item_Description, B.Item_SKU, B.Expected_Stock, B.Counted_Stock, B.Different_Stock, 
		B.Item_Cost, B.Item_Cost_Different, @UserID, cast(getdate() as date), cast(getdate() as time), '','','' );
		
		INSERT INTO POS_TrxInvCount_HeaderHIST(DOCNUMBER, DOCDATE, Completed_Date, Site_ID, Site_Name, Type_Inventory_Count, Total_Line_Item, Notes, [Status], Created_User, Created_Date, Created_time)
		SELECT DOCNUMBER, DOCDATE, Completed_Date, Site_ID, Site_Name, Type_Inventory_Count, Total_Line_Item, Notes, @Status, Created_User, cast(getdate() as date), cast(getdate() as time)
		FROM POS_TrxInvCount_HeaderTEMP WHERE RTRIM(DOCNUMBER)=RTRIM(@DOCNUMBER)

		INSERT INTO POS_TrxInvCount_DetailHIST(DOCNUMBER, DOCDATE, Lineitmseq, Item_Number, Item_Description, Item_SKU, Expected_Stock, 
		Counted_Stock, Different_Stock, Item_Cost, Item_Cost_Different, Created_User, Created_Date, Created_time, Modified_User, Modified_Date, Modified_time)
		SELECT DOCNUMBER, DOCDATE, Lineitmseq, Item_Number, Item_Description, Item_SKU, Expected_Stock, Counted_Stock, Different_Stock, 
		Item_Cost, Item_Cost_Different, Created_User, cast(getdate() as date), cast(getdate() as time), Modified_User, cast(getdate() as date), cast(getdate() as time)
		FROM POS_TrxInvCount_DetailTEMP WHERE RTRIM(DOCNUMBER)=RTRIM(@DOCNUMBER)

		IF @Status=3
		BEGIN
			INSERT INTO POS_TrxInvCount_HeaderPOST(DOCNUMBER, DOCDATE, Completed_Date, Site_ID, Site_Name, Type_Inventory_Count, 
			Total_Line_Item, Notes, [Status], Created_User, Created_Date, Created_time, Modified_User, Modified_Date, Modified_time)
			SELECT DOCNUMBER, DOCDATE, cast(getdate() as date), Site_ID, Site_Name, Type_Inventory_Count, Total_Line_Item, 
			Notes, @Status, Created_User, cast(getdate() as date), cast(getdate() as time), Modified_User, cast(getdate() as date), cast(getdate() as time)
			FROM POS_TrxInvCount_HeaderTEMP WHERE RTRIM(DOCNUMBER)=RTRIM(@DOCNUMBER)

			INSERT INTO POS_TrxInvCount_DetailPOST(DOCNUMBER, DOCDATE, Lineitmseq, Item_Number, Item_Description, Item_SKU, Expected_Stock, 
			Counted_Stock, Different_Stock, Item_Cost, Item_Cost_Different, Created_User, Created_Date, Created_time, Modified_User, Modified_Date, Modified_time)
			SELECT DOCNUMBER, DOCDATE, Lineitmseq, Item_Number, Item_Description, Item_SKU, Expected_Stock, Counted_Stock, Different_Stock, 
			Item_Cost, Item_Cost_Different, Created_User, cast(getdate() as date), cast(getdate() as time), Modified_User, cast(getdate() as date), cast(getdate() as time)
			FROM POS_TrxInvCount_DetailTEMP WHERE RTRIM(DOCNUMBER)=RTRIM(@DOCNUMBER)
			
			DELETE FROM POS_TrxInvCount_HeaderTEMP WHERE RTRIM(DOCNUMBER)=RTRIM(@DOCNUMBER)
			DELETE FROM POS_TrxInvCount_DetailTEMP WHERE RTRIM(DOCNUMBER)=RTRIM(@DOCNUMBER)
		END

		SELECT CODE='200', DOCNUMBER=@DOCNUMBER

	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000),@ErrorSeverity INT,@ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState)
	END CATCH
END
GO
create or alter proc TRX_InvHistory_GetDataList
(
	@DateFrom datetime,
	@DateTo datetime,
	@Reason nvarchar(MAX),
	@Employee nvarchar(MAX),
	@Store_ID nvarchar(MAX),
	@Site_ID nvarchar(MAX),
	@SEARCH nvarchar(MAX)
)
AS          
BEGIN
	BEGIN TRY
		SELECT DISTINCT A.DOCNUMBER, A.DOCDATE, A.Item_Number, A.Item_Description, A.Site_ID, A.Site_Name, 
		A.Reason, A.Created_User, A.Created_Time, A.QTY_Adjustment, A.Qty_After_Stock, COALESCE(ACC.Business_Name, '') Username
		FROM(
			SELECT DISTINCT HDR.DOCNUMBER, HDR.DOCDATE, COALESCE(DTL.Item_Number, '') Item_Number, 
			COALESCE(DTL.Item_Description, '') Item_Description, HDR.Site_ID, HDR.Site_Name, HDR.Reason, HDR.Created_User, HDR.Created_Time,
			CASE
			WHEN LOWER(HDR.Reason) = 'inventory count' THEN ISNULL(DTL.Counted_Stock, 0)
			WHEN LOWER(HDR.Reason) = 'receive items' THEN ISNULL(DTL.Qty_Add_Stock, 0)
			ELSE ISNULL(DTL.Qty_Remove_Stock, 0) END QTY_Adjustment, ISNULL(DTL.Qty_After_Stock, 0) Qty_After_Stock
			FROM POS_TrxAdjustment_HeaderHIST HDR with(nolock)
			LEFT JOIN POS_TrxAdjustment_DetailHIST DTL with(nolock) ON HDR.DOCNUMBER=DTL.DOCNUMBER
			UNION
			SELECT DISTINCT HDR.DOCNUMBER, HDR.DOCDATE, COALESCE(DTL.Item_Number, '') Item_Number, COALESCE(DTL.Item_Description, '') Item_Description, HDR.DestSite_ID, HDR.DestSite_Name,
			'Transfer' Reason, HDR.Created_User, HDR.Created_Time, ISNULL(DTL.Qty_Transfer, 0) QTY_Adjustment, ISNULL(DTL.Dest_Stock, 0) Qty_After_Stock
			FROM POS_TrxItemTrf_HeaderHIST HDR with(nolock)
			LEFT JOIN POS_TrxItemTrf_DetailHIST DTL with(nolock) ON HDR.DOCNUMBER=DTL.DOCNUMBER
			UNION
			SELECT DISTINCT HDR.DOCNUMBER, HDR.DOCDATE, COALESCE(DTL.Item_Number, '') Item_Number, 
			COALESCE(DTL.Item_Description, '') Item_Description, HDR.Site_ID, HDR.Site_Name, 
			'Counted' Reason, HDR.Created_User, HDR.Created_Time, ISNULL(DTL.Counted_Stock, 0) QTY_Adjustment, ISNULL(DTL.Different_Stock, 0) Qty_After_Stock
			FROM POS_TrxInvCount_HeaderHIST HDR with(nolock)
			LEFT JOIN POS_TrxInvCount_DetailHIST DTL with(nolock) ON HDR.DOCNUMBER=DTL.DOCNUMBER
			UNION
			SELECT DISTINCT HDR.DOCNUMBER, HDR.DOCDATE, COALESCE(DTL.Item_Number, '') Item_Number, COALESCE(DTL.Item_Description, '') Item_Description,
			HDR.Site_ID, COALESCE(ST.Site_Name, '') Site_Name, 'Sale' Reason, HDR.Created_User, HDR.Created_Time, ISNULL(DTL.Quantity, 0) QTY_Adjustment, ISNULL(ITM.InStock, 0) Qty_After_Stock
			FROM POS_TrxHeader_HIST HDR with(nolock)
			LEFT JOIN POS_TrxDetail_HIST DTL with(nolock) ON HDR.DOCNUMBER=DTL.DOCNUMBER
			LEFT JOIN POS_Set_Site ST with(nolock) ON HDR.Site_ID=ST.Site_ID
			LEFT JOIN POS_Item ITM with(nolock) ON DTL.Item_Number=ITM.Item_Number
			UNION
			SELECT DISTINCT RFN.REFUNDNUMBER, RFN.DOCDATE, COALESCE(DTL.Item_Number, '') Item_Number, COALESCE(DTL.Item_Description, '') Item_Description,
			RFN.Site_ID, COALESCE(ST.Site_Name, '') Site_Name, 'Refund' Reason, RFN.Created_User, HDR.Created_Time, ISNULL(DTL.Quantity, 0) QTY_Adjustment, ISNULL(ITM.InStock, 0) Qty_After_Stock
			FROM POS_TrxRefund_HIST RFN
			LEFT JOIN POS_TrxHeader_HIST HDR with(nolock) ON RFN.DOCNUMBER=HDR.DOCNUMBER
			LEFT JOIN POS_TrxDetail_HIST DTL with(nolock) ON HDR.DOCNUMBER=DTL.DOCNUMBER
			LEFT JOIN POS_Set_Site ST with(nolock) ON HDR.Site_ID=ST.Site_ID
			LEFT JOIN POS_Item ITM with(nolock) ON DTL.Item_Number=ITM.Item_Number
		) A
		LEFT JOIN POS_Account ACC with(nolock) ON A.Created_User=ACC.UserID
		WHERE CAST(A.DOCDATE as date) BETWEEN CAST(@DateFrom as date) AND CAST(@DateTo as date)
		AND A.Item_Description like '%'+@SEARCH+'%'
		AND A.Reason in(select value from STRING_SPLIT(@Reason, ','))
		--AND A.Created_User in(select value from STRING_SPLIT(@Employee, ','))
		--AND A.Store_ID in(select value from STRING_SPLIT(@Store_ID, ','))
		AND A.Site_ID in(select value from STRING_SPLIT(@Site_ID, ','))
	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000),@ErrorSeverity INT,@ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState)
	END CATCH
END
GO
/*
exec TRX_InvHistory_GetDataList '2024-03-01', '2024-03-30', '', '', '', '', ''
exec TRX_InvHistory_GetDataList @DateFrom='2024-03-01 00:00:00',@DateTo='2024-03-31 00:00:00',@Reason=N'Sale,Refund,Receive items,Counted,Transfer,Inventory count,Damage,Loss',
@Employee=N'EMP0001',@Store_ID=N'STR0001',@Site_ID=N'SITE0001,SITE0002,SITE0003',@SEARCH=N''
*/
create or alter proc TRX_ReportsCategory_GetDataList
(
	@DateFrom datetime,
	@DateTo datetime,
	@FilterTime int=0,
	@TimeFrom datetime,
	@TimeTo datetime
)
AS          
BEGIN
	BEGIN TRY
		SELECT COALESCE(ITM.Category_ID, '') Category_ID, COALESCE(CAT.Category_Name, '') Category_Name, ISNULL(COUNT(DTL.Item_Number), 0) Item_Sold, 
		ISNULL(SUM(DTL.Item_Price), 0) Net_Sales, ISNULL(SUM(DTL.Item_Cost), 0) CostOfGoods, ISNULL(SUM(DTL.Item_Price), 0) - ISNULL(SUM(DTL.Item_Cost), 0) GrossProfit
		FROM POS_TrxHeader_HIST HDR with (nolock)
		LEFT JOIN POS_TrxDetail_HIST DTL with (nolock) ON HDR.DOCNUMBER=DTL.DOCNUMBER
		LEFT JOIN POS_Item ITM with (nolock) ON DTL.Item_Number=ITM.Item_Number
		LEFT JOIN POS_CategoryItem CAT with (nolock) on ITM.Category_ID=CAT.Category_ID
		WHERE HDR.DOCNUMBER not in(SELECT DISTINCT HDR.DOCNUMBER FROM POS_TrxRefund_HIST HDR with (nolock))
		AND (HDR.Created_Date BETWEEN CAST(@DateFrom as date) and CAST(@DateTo as date)
		OR HDR.Modified_Date BETWEEN CAST(@DateFrom as date) and CAST(@DateTo as date))
		AND ((CAST(HDR.Created_time as time) > CAST(@TimeFrom as time) and CAST(HDR.Created_time as time) < CAST(@TimeTo as time)) OR @FilterTime=0)
		GROUP BY ITM.Category_ID, CAT.Category_Name
	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000),@ErrorSeverity INT,@ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState)
	END CATCH
END
GO
/*
exec TRX_ReportsCategory_GetDataList '2024-03-01', '2024-03-30', 0, '', ''
*/
create or alter proc TRX_ReportsDiscount_GetDataList
(
	@DateFrom datetime,
	@DateTo datetime,
	@FilterTime int=0,
	@TimeFrom datetime,
	@TimeTo datetime
)
AS          
BEGIN
	BEGIN TRY
		SELECT DISTINCT HDR.Discount_ID, COALESCE(DIS.Discount_Name, '') Discount_Name, HDR.Discount_Amount, COUNT(HDR.DOCNUMBER) Disc_Applied
		FROM POS_TrxHeader_HIST HDR with (nolock)
		LEFT JOIN POS_Discount DIS with (nolock) ON HDR.Discount_ID=DIS.Discount_ID
		WHERE HDR.DOCNUMBER not in(SELECT DISTINCT HDR.DOCNUMBER FROM POS_TrxRefund_HIST HDR with (nolock))
		AND (HDR.Created_Date BETWEEN CAST(@DateFrom as date) and CAST(@DateTo as date)
		OR HDR.Modified_Date BETWEEN CAST(@DateFrom as date) and CAST(@DateTo as date))
		AND ((CAST(HDR.Created_time as time) > CAST(@TimeFrom as time) and CAST(HDR.Created_time as time) < CAST(@TimeTo as time)) OR @FilterTime=0)
		GROUP BY HDR.Discount_ID, DIS.Discount_Name, HDR.Discount_Amount
	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000),@ErrorSeverity INT,@ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState)
	END CATCH
END
GO
/*
exec TRX_ReportsDiscount_GetDataList '2024-03-01', '2024-03-30', 0, '', ''
*/
create or alter proc TRX_ReportsPayTypes_GetDataList
(
	@DateFrom datetime,
	@DateTo datetime,
	@FilterTime int=0,
	@TimeFrom datetime,
	@TimeTo datetime
)
AS          
BEGIN
	BEGIN TRY
		SELECT PAY.Payment_ID, PAY.Payment_Type, ISNULL(TRX.Payment_TRX, 0) Payment_TRX, ISNULL(TRX.Payment_Amount, 0) Payment_Amount,
		ISNULL(REF.Payment_REF, 0) Payment_REF, ISNULL(REF.Payment_Refund, 0) Payment_Refund, ISNULL(TRX.Payment_Amount, 0) - ISNULL(REF.Payment_Refund, 0) Net_Amount
		FROM POS_Set_PayTypes PAY with (nolock)
		LEFT JOIN (
			SELECT COUNT(X.DOCNUMBER) Payment_TRX, SUM(X.SUBTOTAL) Payment_Amount, X.Payment_ID
			FROM POS_TrxPayTypes_HIST X with (nolock)
			WHERE DOCNUMBER not in(select Y.DOCNUMBER from POS_TrxRefund_HIST Y with (nolock))
			AND DOCNUMBER in(select Y.DOCNUMBER from POS_TrxHeader_HIST Y with (nolock))
			AND (X.Created_Date BETWEEN CAST(@DateFrom as date) and CAST(@DateTo as date)
			OR X.Modified_Date BETWEEN CAST(@DateFrom as date) and CAST(@DateTo as date))
			AND ((CAST(X.Created_time as time) > CAST(@TimeFrom as time) and CAST(X.Created_time as time) < CAST(@TimeTo as time)) OR @FilterTime=0)
			GROUP BY X.Payment_ID
		) TRX ON TRX.Payment_ID=PAY.Payment_ID
		LEFT JOIN (
			SELECT COUNT(X.DOCNUMBER) Payment_REF, SUM(X.SUBTOTAL) Payment_Refund, X.Payment_ID
			FROM POS_TrxPayTypes_HIST X with (nolock)
			WHERE DOCNUMBER in(select Y.DOCNUMBER from POS_TrxRefund_HIST Y with (nolock))
			AND DOCNUMBER in(select Y.DOCNUMBER from POS_TrxHeader_HIST Y with (nolock))
			AND (X.Created_Date BETWEEN CAST(@DateFrom as date) and CAST(@DateTo as date)
			OR X.Modified_Date BETWEEN CAST(@DateFrom as date) and CAST(@DateTo as date))
			AND ((CAST(X.Created_time as time) > CAST(@TimeFrom as time) and CAST(X.Created_time as time) < CAST(@TimeTo as time)) OR @FilterTime=0)
			GROUP BY X.Payment_ID
		) REF ON TRX.Payment_ID=PAY.Payment_ID
		ORDER BY PAY.Payment_Type
	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000),@ErrorSeverity INT,@ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState)
	END CATCH
END
GO
/*
exec TRX_ReportsPayTypes_GetDataList '2024-03-01', '2024-03-30', 0, '', ''
*/
create or alter proc TRX_SaveCashManagement
(
	@Batch_ID nvarchar(20),
	@Type_CashManagement nvarchar(20),
	@Amount numeric(19, 5),
	@Notes nvarchar(200),
	@POS_ID nvarchar(20),
	@UserID nvarchar(20)
)
AS          
BEGIN
	BEGIN TRY
		IF EXISTS(SELECT * FROM POS_CashManagement WITH(NOLOCK) WHERE RTRIM(Batch_ID)=RTRIM(@Batch_ID))
		BEGIN
			UPDATE POS_CashManagement
			SET Type_CashManagement=@Type_CashManagement, Amount=@Amount, Notes=@Notes, POS_ID=@POS_ID, 
			Created_User=@UserID, Created_Date=CAST(GETDATE() as date), Created_time=CAST(GETDATE() as time)
			WHERE RTRIM(Batch_ID)=RTRIM(@Batch_ID)
		END
		ELSE
		BEGIN
			IF LEN(RTRIM(@Batch_ID)) = 0
			BEGIN
				declare @p varchar(30)
				EXEC Web_Generate_NumberMaster @TABLE=N'POS_CashManagement', @FIELD=N'Batch_ID', @DOCID=N'BCH', @NEWNUMBER=@p output
				SET @Batch_ID=@p
			END
			INSERT INTO [POS_CashManagement]
			(Batch_ID, Type_CashManagement, Amount, Notes, POS_ID, Created_User, Created_Date, Created_time)
			VALUES
			(@Batch_ID, @Type_CashManagement, @Amount, @Notes, @POS_ID, @UserID, CAST(GETDATE() as date), CAST(GETDATE() as time))
		END
			
		SELECT CODE='200', Batch_ID=@Batch_ID

	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000),@ErrorSeverity INT,@ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState)
	END CATCH
END
GO
create or alter proc TRX_SaveCloseShift
(
	@Batch_ID nvarchar(20),
	@Lineitmseq int,
	@Payment_ID nvarchar(20),
	@Payment_Type nvarchar(20),
	@Amount_Opening numeric(19, 5),
	@UserID nvarchar(20)
)
AS          
BEGIN
	BEGIN TRY
		IF EXISTS(SELECT * FROM POS_CloseShift WITH(NOLOCK) WHERE RTRIM(Batch_ID)=RTRIM(@Batch_ID))
		BEGIN
			UPDATE POS_CloseShift
			SET Lineitmseq=@Lineitmseq, Payment_ID=@Payment_ID, Payment_Type=@Payment_Type, Amount_Opening=@Amount_Opening,
			Modified_User=@UserID, Modified_Date=CAST(GETDATE() as datetime)
			WHERE RTRIM(Batch_ID)=RTRIM(@Batch_ID)
		END
		ELSE
		BEGIN
			IF LEN(RTRIM(@Batch_ID)) = 0
			BEGIN
				declare @p varchar(30)
				EXEC Web_Generate_NumberMaster @TABLE=N'POS_CloseShift', @FIELD=N'Batch_ID', @DOCID=N'SHF', @NEWNUMBER=@p output
				SET @Batch_ID=@p
			END
			INSERT INTO [POS_CloseShift]
			(Batch_ID, Lineitmseq, Payment_ID, Payment_Type, Amount_Opening, Created_User, Created_Date, Modified_User, Modified_Date)
			VALUES
			(@Batch_ID, @Lineitmseq, @Payment_ID, @Payment_Type, @Amount_Opening, @UserID, CAST(GETDATE() as datetime), '', '')
		END
			
		SELECT CODE='200', Batch_ID=@Batch_ID

	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000),@ErrorSeverity INT,@ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState)
	END CATCH
END
GO
create or alter proc TRX_SaveOpenShift
(
	@Batch_ID nvarchar(20),
	@Lineitmseq int,
	@Payment_ID nvarchar(20),
	@Payment_Type nvarchar(20),
	@Amount_Opening numeric(19, 5),
	@UserID nvarchar(20)
)
AS          
BEGIN
	BEGIN TRY
		IF EXISTS(SELECT * FROM POS_OpenShift WITH(NOLOCK) WHERE RTRIM(Batch_ID)=RTRIM(@Batch_ID))
		BEGIN
			UPDATE POS_OpenShift
			SET Lineitmseq=@Lineitmseq, Payment_ID=@Payment_ID, Payment_Type=@Payment_Type, Amount_Opening=@Amount_Opening,
			Modified_User=@UserID, Modified_Date=CAST(GETDATE() as datetime)
			WHERE RTRIM(Batch_ID)=RTRIM(@Batch_ID)
		END
		ELSE
		BEGIN
			IF LEN(RTRIM(@Batch_ID)) = 0
			BEGIN
				declare @p varchar(30)
				EXEC Web_Generate_NumberMaster @TABLE=N'POS_OpenShift', @FIELD=N'Batch_ID', @DOCID=N'SHF', @NEWNUMBER=@p output
				SET @Batch_ID=@p
			END
			INSERT INTO [POS_OpenShift]
			(Batch_ID, Lineitmseq, Payment_ID, Payment_Type, Amount_Opening, Created_User, Created_Date, Modified_User, Modified_Date)
			VALUES
			(@Batch_ID, @Lineitmseq, @Payment_ID, @Payment_Type, @Amount_Opening, @UserID, CAST(GETDATE() as datetime), '', '')
		END
			
		SELECT CODE='200', Batch_ID=@Batch_ID

	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000),@ErrorSeverity INT,@ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState)
	END CATCH
END
GO
create or alter proc TRX_SaveSetupPrinter
(
	@PrinterID nvarchar(20), 
	@PrinterName nvarchar(20), 
	@Printer_Checkbox1 int,
	@Printer_Checkbox2 int,
	@Printer_Checkbox3 int,
	@UserID nvarchar(20)
)
AS          
BEGIN
	BEGIN TRY
		IF LEN(RTRIM(@PrinterName)) = 0
		BEGIN
			RAISERROR('Please fill printer name', 16, 1)
		END
		IF EXISTS(SELECT * FROM POS_PrinterSetup WITH(NOLOCK) WHERE RTRIM(PrinterID)=RTRIM(@PrinterID))
		BEGIN
			UPDATE POS_PrinterSetup
			SET PrinterName=@PrinterName, Printer_Checkbox1=@Printer_Checkbox1, Printer_Checkbox2=@Printer_Checkbox2, Printer_Checkbox3=@Printer_Checkbox3,
			Modified_User=@UserID, Modified_Date=CAST(GETDATE() as date), Modified_time=CAST(GETDATE() as time)
			WHERE RTRIM(PrinterID)=RTRIM(@PrinterID)
		END
		ELSE
		BEGIN
			IF LEN(RTRIM(@PrinterID)) = 0
			BEGIN
				declare @p varchar(30)
				EXEC Web_Generate_NumberMaster @TABLE=N'POS_PrinterSetup', @FIELD=N'PrinterID', @DOCID=N'PRT', @NEWNUMBER=@p output
				SET @PrinterID=@p
			END
			INSERT INTO [POS_PrinterSetup]
			(PrinterID, PrinterName, Printer_Checkbox1, Printer_Checkbox2, Printer_Checkbox3, Created_User, Created_Date, Created_time, Modified_User, Modified_Date, Modified_time)
			VALUES
			(@PrinterID, @PrinterName, @Printer_Checkbox1, @Printer_Checkbox2, @Printer_Checkbox3, @UserID, CAST(GETDATE() as date), CAST(GETDATE() as time), '', '', '')
		END
			
		SELECT CODE='200', PrinterID=@PrinterID

	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000),@ErrorSeverity INT,@ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState)
	END CATCH
END
GO
create or alter proc TRX_SaveSummaryShift
(
	@Batch_ID nvarchar(20),
	@Store_ID nvarchar(20),
	@POS_Device_ID nvarchar(20),
	@Opening_Date datetime,
	@Opening_time datetime,
	@Closing_Date datetime,
	@Closing_time datetime,
	@Sum_Amount_Opening numeric(19, 5),
	@Sum_Amount_Closing numeric(19, 5),
	@Sum_Invoice_Posted numeric(19, 5),
	@Sum_Tendered numeric(19, 5),
	@Sum_Changes numeric(19, 5),
	@Sum_Amount_Discount numeric(19, 5),
	@Sum_Amount_Tax numeric(19, 5),
	@Sum_Invoice_Refund_Posted numeric(19, 5),
	@Sum_Amount_PayOut numeric(19, 5),
	@Sum_Amount_PayIn numeric(19, 5),
	@Count_Customers int,
	@Status_Batch int,
	@UserID nvarchar(20)
)
AS          
BEGIN
	BEGIN TRY
		IF EXISTS(SELECT * FROM POS_Summ_OpenCloseShift WITH(NOLOCK) WHERE RTRIM(Batch_ID)=RTRIM(@Batch_ID))
		BEGIN
			UPDATE POS_Summ_OpenCloseShift
			SET LastEdit_Date=CAST(GETDATE() as date), LastEdit_time=CAST(GETDATE() as time), Store_ID=@Store_ID, POS_Device_ID=@POS_Device_ID, 
			Opening_Date=@Opening_Date, Opening_time=@Opening_time, Closing_Date=@Closing_Date, Closing_time=@Closing_time, Sum_Amount_Opening=@Sum_Amount_Opening, 
			Sum_Amount_Closing=@Sum_Amount_Closing, Sum_Invoice_Posted=@Sum_Invoice_Posted, Sum_Tendered=@Sum_Tendered, Sum_Changes=@Sum_Changes, 
			Sum_Amount_Discount=@Sum_Amount_Discount, Sum_Amount_Tax=@Sum_Amount_Tax, Sum_Invoice_Refund_Posted=@Sum_Invoice_Refund_Posted, Sum_Amount_PayOut=@Sum_Amount_PayOut, 
			Sum_Amount_PayIn=@Sum_Amount_PayIn, Count_Customers=@Count_Customers, Status_Batch=@Status_Batch
			WHERE RTRIM(Batch_ID)=RTRIM(@Batch_ID)
		END
		ELSE
		BEGIN
			INSERT INTO [POS_Summ_OpenCloseShift]
			(Batch_ID, LastEdit_Date, LastEdit_time, Store_ID, POS_Device_ID, Opening_Date, Opening_time, Closing_Date, Closing_time, Sum_Amount_Opening, 
			Sum_Amount_Closing, Sum_Invoice_Posted, Sum_Tendered, Sum_Changes, Sum_Amount_Discount, Sum_Amount_Tax, Sum_Invoice_Refund_Posted, Sum_Amount_PayOut, 
			Sum_Amount_PayIn, Count_Customers, Status_Batch, Created_User, Created_Date, Created_time)
			VALUES
			(@Batch_ID, CAST(GETDATE() as date), CAST(GETDATE() as time), @Store_ID, @POS_Device_ID, @Opening_Date, @Opening_time, @Closing_Date, @Closing_time, @Sum_Amount_Opening, 
			@Sum_Amount_Closing, @Sum_Invoice_Posted, @Sum_Tendered, @Sum_Changes, @Sum_Amount_Discount, @Sum_Amount_Tax, @Sum_Invoice_Refund_Posted, @Sum_Amount_PayOut, 
			@Sum_Amount_PayIn, @Count_Customers, @Status_Batch, @UserID, CAST(GETDATE() as date), CAST(GETDATE() as time))
		END
	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000),@ErrorSeverity INT,@ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState)
	END CATCH
END
GO
create or alter proc TRX_SaveTrx_POST
(
	@DOCNUMBER nvarchar(20),
	@SyncStatus int,
	@UserID nvarchar(20)
)
AS
BEGIN
	BEGIN TRY
		IF NOT EXISTS(SELECT * FROM POS_TrxHeader_TEMP WITH(NOLOCK) WHERE RTRIM(DOCNUMBER)=RTRIM(@DOCNUMBER))
		BEGIN
			RAISERROR('Something error when save data', 16, 1)
		END
		IF (SELECT ISNULL(A.InStock - B.Quantity, 0) FROM POS_Item A
			INNER JOIN POS_TrxDetail_TEMP B ON A.Item_Number=B.Item_Number
			WHERE RTRIM(B.DOCNUMBER)=RTRIM(@DOCNUMBER)) < 0
		BEGIN
			RAISERROR('Not enough quantity', 16, 1)
		END
		-- Header
		INSERT INTO [POS_TrxHeader_POST]
		(DOCNUMBER, DOCTYPE, DOCDATE, Store_ID, Site_ID, SalesType_ID, CustName, Total_Line_Item, ORIGTOTAL, SUBTOTAL, Tax_Amount, Discount_ID, Discount_Amount, Amount_Tendered, 
		Change_Amount, Batch_ID, POS_Device_ID, POS_Version, SyncStatus, Created_User, Created_Date, Created_time, Modified_User, Modified_Date, Modified_time)
		SELECT DOCNUMBER, DOCTYPE, DOCDATE, Store_ID, Site_ID, SalesType_ID, CustName, Total_Line_Item, ORIGTOTAL, SUBTOTAL, Tax_Amount, Discount_ID, Discount_Amount, Amount_Tendered, 
		Change_Amount, Batch_ID, POS_Device_ID, POS_Version, @SyncStatus, @UserID, CAST(GETDATE() as date), CAST(GETDATE() as time), '', '', ''
		FROM POS_TrxHeader_TEMP A
		WHERE RTRIM(A.DOCNUMBER)=RTRIM(@DOCNUMBER)

		INSERT INTO [POS_TrxHeader_HIST]
		(DOCNUMBER, DOCTYPE, DOCDATE, Store_ID, Site_ID, SalesType_ID, CustName, Total_Line_Item, ORIGTOTAL, SUBTOTAL, Tax_Amount, Discount_ID, Discount_Amount, Amount_Tendered, 
		Change_Amount, Batch_ID, POS_Device_ID, POS_Version, SyncStatus, Created_User, Created_Date, Created_time, Modified_User, Modified_Date, Modified_time)
		SELECT DOCNUMBER, DOCTYPE, DOCDATE, Store_ID, Site_ID, SalesType_ID, CustName, Total_Line_Item, ORIGTOTAL, SUBTOTAL, Tax_Amount, Discount_ID, Discount_Amount, Amount_Tendered, 
		Change_Amount, Batch_ID, POS_Device_ID, POS_Version, @SyncStatus, @UserID, CAST(GETDATE() as date), CAST(GETDATE() as time), '', '', ''
		FROM POS_TrxHeader_TEMP A
		WHERE RTRIM(A.DOCNUMBER)=RTRIM(@DOCNUMBER)
		-- Detail
		INSERT INTO POS_TrxDetail_POST(DOCNUMBER, DOCTYPE, DOCDATE, Lineitmseq, Item_Number, Item_Description, Quantity, UofM, Item_Price, Item_Cost, Store_ID, Site_ID, 
		SalesType_ID, Discount_ID, Discount_Amount, Notes, POS_Device_ID, POS_Version, Created_User, Created_Date, Created_time, Modified_User, Modified_Date, Modified_time)
		SELECT DOCNUMBER, DOCTYPE, DOCDATE, Lineitmseq, Item_Number, Item_Description, Quantity, UofM, Item_Price, Item_Cost, Store_ID, Site_ID, 
		SalesType_ID, Discount_ID, Discount_Amount, Notes, POS_Device_ID, POS_Version, @UserID, CAST(GETDATE() as date), CAST(GETDATE() as time), '', '', ''
		FROM POS_TrxDetail_TEMP
		WHERE RTRIM(DOCNUMBER)=RTRIM(@DOCNUMBER)

		INSERT INTO POS_TrxDetail_HIST(DOCNUMBER, DOCTYPE, DOCDATE, Lineitmseq, Item_Number, Item_Description, Quantity, UofM, Item_Price, Item_Cost, Store_ID, Site_ID, 
		SalesType_ID, Discount_ID, Discount_Amount, Notes, POS_Device_ID, POS_Version, Created_User, Created_Date, Created_time, Modified_User, Modified_Date, Modified_time)
		SELECT DOCNUMBER, DOCTYPE, DOCDATE, Lineitmseq, Item_Number, Item_Description, Quantity, UofM, Item_Price, Item_Cost, Store_ID, Site_ID, 
		SalesType_ID, Discount_ID, Discount_Amount, Notes, POS_Device_ID, POS_Version, @UserID, CAST(GETDATE() as date), CAST(GETDATE() as time), '', '', ''
		FROM POS_TrxDetail_TEMP
		WHERE RTRIM(DOCNUMBER)=RTRIM(@DOCNUMBER)
		-- payment type
		INSERT INTO POS_TrxPayTypes_POST(DOCNUMBER, DOCTYPE, DOCDATE, Lnitmseq, Payment_ID, Payment_Type, ORIGTOTAL, SUBTOTAL, Amount_Tendered, 
		Change_Amount, Store_ID, POS_Device_ID, POS_Version, Created_User, Created_Date, Created_time, Modified_User, Modified_Date, Modified_time)
		SELECT DOCNUMBER, DOCTYPE, DOCDATE, Lnitmseq, Payment_ID, Payment_Type, ORIGTOTAL, SUBTOTAL, Amount_Tendered, 
		Change_Amount, Store_ID, POS_Device_ID, POS_Version, @UserID, CAST(GETDATE() as date), CAST(GETDATE() as time), '', '', ''
		FROM POS_TrxPayTypes_TEMP
		WHERE RTRIM(DOCNUMBER)=RTRIM(@DOCNUMBER)
		
		INSERT INTO POS_TrxPayTypes_HIST(DOCNUMBER, DOCTYPE, DOCDATE, Lnitmseq, Payment_ID, Payment_Type, ORIGTOTAL, SUBTOTAL, Amount_Tendered, 
		Change_Amount, Store_ID, POS_Device_ID, POS_Version, Created_User, Created_Date, Created_time, Modified_User, Modified_Date, Modified_time)
		SELECT DOCNUMBER, DOCTYPE, DOCDATE, Lnitmseq, Payment_ID, Payment_Type, ORIGTOTAL, SUBTOTAL, Amount_Tendered, 
		Change_Amount, Store_ID, POS_Device_ID, POS_Version, @UserID, CAST(GETDATE() as date), CAST(GETDATE() as time), '', '', ''
		FROM POS_TrxPayTypes_TEMP
		WHERE RTRIM(DOCNUMBER)=RTRIM(@DOCNUMBER)

		UPDATE A
		SET A.InStock=(A.InStock - B.Quantity)
		FROM POS_Item A
		INNER JOIN POS_TrxDetail_TEMP B ON A.Item_Number=B.Item_Number
		WHERE RTRIM(B.DOCNUMBER)=RTRIM(@DOCNUMBER)


		DELETE FROM POS_TrxHeader_TEMP WHERE RTRIM(DOCNUMBER)=RTRIM(@DOCNUMBER)
		DELETE FROM POS_TrxDetail_TEMP WHERE RTRIM(DOCNUMBER)=RTRIM(@DOCNUMBER)
		DELETE FROM POS_TrxPayTypes_TEMP WHERE RTRIM(DOCNUMBER)=RTRIM(@DOCNUMBER)
			
		SELECT CODE='200', DOCNUMBER=@DOCNUMBER

	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000),@ErrorSeverity INT,@ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState)
	END CATCH
END
GO
create or alter proc TRX_SaveTrx_TEMP
(
	@DOCNUMBER nvarchar(20),
	@DOCTYPE int,
	@DOCDATE DATETIME,
	@Store_ID nvarchar(20),
	@Site_ID nvarchar(20),
	@SalesType_ID nvarchar(20),
	@CustName nvarchar(200),
	@Total_Line_Item int,
	@ORIGTOTAL numeric(19,5),
	@SUBTOTAL numeric(19,5),
	@Tax_Amount numeric(19,5),
	@Discount_ID nvarchar(20),
	@Discount_Amount numeric(19,5),
	@Amount_Tendered numeric(19,5),
	@Change_Amount numeric(19,5),
	@Batch_ID nvarchar(20),
	@Payment_ID nvarchar(20),
	@Payment_Type nvarchar(20),
	@Lnitmseq int,
	@POS_Device_ID nvarchar(20),
	@POS_Version nvarchar(20),
	@SyncStatus int,
	@UserID nvarchar(20),
	@TrxDetailTYPE TrxDetailTYPE readonly
)
AS
BEGIN
	BEGIN TRY
		IF LEN(RTRIM(@Batch_ID)) = 0
		BEGIN
			RAISERROR('Batch_ID not found', 16, 1)
		END
		IF EXISTS(SELECT * FROM POS_TrxHeader_TEMP WITH(NOLOCK) WHERE RTRIM(DOCNUMBER)=RTRIM(@DOCNUMBER))
		BEGIN
			UPDATE POS_TrxHeader_TEMP
			SET DOCTYPE=@DOCTYPE, DOCDATE=@DOCDATE, Store_ID=@Store_ID, Site_ID=@Site_ID, SalesType_ID=@SalesType_ID, CustName=@CustName, Total_Line_Item=@Total_Line_Item, ORIGTOTAL=@ORIGTOTAL, SUBTOTAL=@SUBTOTAL, 
			Tax_Amount=@Tax_Amount, Discount_ID=@Discount_ID, Discount_Amount=@Discount_Amount, Amount_Tendered=@Amount_Tendered, Change_Amount=@Change_Amount, Batch_ID=@Batch_ID, 
			POS_Device_ID=@POS_Device_ID, POS_Version=@POS_Version, SyncStatus=@SyncStatus, Modified_User=@UserID, Modified_Date=CAST(GETDATE() as date), Modified_time=CAST(GETDATE() as time)
			WHERE RTRIM(DOCNUMBER)=RTRIM(@DOCNUMBER)
		END
		ELSE
		BEGIN
			IF LEN(RTRIM(@DOCNUMBER)) = 0
			BEGIN
				declare @p varchar(30)
				EXEC Web_Generate_NumberMaster @TABLE=N'POS_TrxHeader_POST', @FIELD=N'DOCNUMBER', @DOCID=N'PRT', @NEWNUMBER=@p output
				SET @DOCNUMBER=@p
			END
			INSERT INTO [POS_TrxHeader_TEMP]
			(DOCNUMBER, DOCTYPE, DOCDATE, Store_ID, Site_ID, SalesType_ID, CustName, Total_Line_Item, ORIGTOTAL, SUBTOTAL, Tax_Amount, Discount_ID, Discount_Amount, Amount_Tendered, 
			Change_Amount, Batch_ID, POS_Device_ID, POS_Version, SyncStatus, Created_User, Created_Date, Created_time, Modified_User, Modified_Date, Modified_time)
			VALUES
			(@DOCNUMBER, @DOCTYPE, @DOCDATE, @Store_ID, @Site_ID, @SalesType_ID, @CustName, @Total_Line_Item, @ORIGTOTAL, @SUBTOTAL, @Tax_Amount, @Discount_ID, @Discount_Amount, @Amount_Tendered, 
			@Change_Amount, @Batch_ID, @POS_Device_ID, @POS_Version, @SyncStatus, @UserID, CAST(GETDATE() as date), CAST(GETDATE() as time), '', '', '')
		END

		DELETE FROM POS_TrxDetail_TEMP
		WHERE RTRIM(DOCNUMBER)=RTRIM(@DOCNUMBER)

		INSERT INTO POS_TrxDetail_TEMP(DOCNUMBER, DOCTYPE, DOCDATE, Lineitmseq, Item_Number, Item_Description, Quantity, UofM, Item_Price, Item_Cost, Store_ID, Site_ID, 
		SalesType_ID, Discount_ID, Discount_Amount, Notes, POS_Device_ID, POS_Version, Created_User, Created_Date, Created_time, Modified_User, Modified_Date, Modified_time)
		SELECT DOCNUMBER, DOCTYPE, DOCDATE, Lineitmseq, Item_Number, Item_Description, Quantity, UofM, Item_Price, Item_Cost, Store_ID, Site_ID, 
		SalesType_ID, Discount_ID, Discount_Amount, Notes, POS_Device_ID, POS_Version, @UserID, CAST(GETDATE() as date), CAST(GETDATE() as time), '', '', ''
		FROM @TrxDetailTYPE
		WHERE RTRIM(DOCNUMBER)=RTRIM(@DOCNUMBER)

		INSERT INTO POS_TrxPayTypes_TEMP(DOCNUMBER, DOCTYPE, DOCDATE, Lnitmseq, Payment_ID, Payment_Type, ORIGTOTAL, SUBTOTAL, Amount_Tendered, 
		Change_Amount, Store_ID, POS_Device_ID, POS_Version, Created_User, Created_Date, Created_time, Modified_User, Modified_Date, Modified_time)
		VALUES
		(@DOCNUMBER, @DOCTYPE, @DOCDATE, @Lnitmseq, @Payment_ID, @Payment_Type, @ORIGTOTAL, @SUBTOTAL, @Amount_Tendered, 
		@Change_Amount, @Store_ID, @POS_Device_ID, @POS_Version, @UserID, CAST(GETDATE() as date), CAST(GETDATE() as time), '', '', '')

		EXEC TRX_SaveTrx_POST @DOCNUMBER=@DOCNUMBER, @SyncStatus=@SyncStatus, @UserID=@UserID
			
		SELECT CODE='200', DOCNUMBER=@DOCNUMBER

	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000),@ErrorSeverity INT,@ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState)
	END CATCH
END
GO
create or alter proc TRX_TrfItem_GetDataTransfer
(
@Status int,
@SourceSite_ID nvarchar(20),
@DestSite_ID nvarchar(20)
)
AS          
BEGIN
	BEGIN TRY
		select *
		from(
			select A.DOCNUMBER, A.DOCDATE DOCDATE, '1900-01-01' DATERECEIVED, A.SourceSite_ID, A.SourceSite_Name, 
			A.DestSite_ID, A.DestSite_Name, A.[Status], ISNULL(B.Qty_Transfer, 0) Qty_Transfer
			from POS_TrxItemTrf_HeaderTEMP A
			left join (
				select DOCNUMBER, SUM(ISNULL(Qty_Transfer, 0)) Qty_Transfer
				from POS_TrxItemTrf_DetailTEMP
				group by DOCNUMBER
			) B ON A.DOCNUMBER=B.DOCNUMBER
			where A.[Status]=@Status or @Status=0
			UNION
			select A.DOCNUMBER, A.DOCDATE DOCDATE, Modified_Date DATERECEIVED, A.SourceSite_ID, A.SourceSite_Name, 
			A.DestSite_ID, A.DestSite_Name, A.[Status], ISNULL(B.Qty_Transfer, 0) Qty_Transfer
			from POS_TrxItemTrf_HeaderPOST A
			left join (
				select DOCNUMBER, SUM(ISNULL(Qty_Transfer, 0)) Qty_Transfer
				from POS_TrxItemTrf_DetailPOST
				group by DOCNUMBER
			) B ON A.DOCNUMBER=B.DOCNUMBER
			where A.[Status]=@Status or @Status=0
		) X
		where (X.SourceSite_ID=@SourceSite_ID or @SourceSite_ID='')
		and (X.DestSite_ID=@DestSite_ID or @DestSite_ID='')
	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000),@ErrorSeverity INT,@ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState)
	END CATCH
END
GO
/*
exec TRX_TrfItem_GetDataTransfer 0, '', ''
*/
create or alter proc TRX_TrfItem_GetDataTransferDTL
(
@DOCNUMBER nvarchar(20)
)
AS          
BEGIN
	BEGIN TRY
		select *
		from(
			select A.DOCNUMBER, A.DOCDATE, A.Lineitmseq, A.Item_Number, A.Item_Description, 
			ISNULL(B.LineItem_Option, 0) LineItem_Option, A.Item_SKU, A.Source_Stock, A.Dest_Stock, A.Qty_Transfer
			from POS_TrxItemTrf_DetailTEMP A
			inner join POS_TrxItemTrf_HeaderTEMP HDR ON A.DOCNUMBER=HDR.DOCNUMBER
			left join POS_ItemVariant B ON A.Item_Number=B.Item_Number and A.Item_SKU=B.Item_SKU and HDR.SourceSite_ID=B.Site_ID
			where A.DOCNUMBER=@DOCNUMBER
			UNION
			select A.DOCNUMBER, A.DOCDATE, A.Lineitmseq, A.Item_Number, A.Item_Description, 
			ISNULL(B.LineItem_Option, 0) LineItem_Option, A.Item_SKU, A.Source_Stock, A.Dest_Stock, A.Qty_Transfer
			from POS_TrxItemTrf_DetailPOST A
			inner join POS_TrxItemTrf_HeaderPOST HDR ON A.DOCNUMBER=HDR.DOCNUMBER
			left join POS_ItemVariant B ON A.Item_Number=B.Item_Number and A.Item_SKU=B.Item_SKU and HDR.SourceSite_ID=B.Site_ID
			where A.DOCNUMBER=@DOCNUMBER
		) X
	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000),@ErrorSeverity INT,@ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState)
	END CATCH
END
GO
/*
exec TRX_TrfItem_GetDataTransferDTL 'TRF0001'
*/
create or alter proc TRX_TrfItem_GetDataTransferHDR
(
@DOCNUMBER nvarchar(20)
)
AS          
BEGIN
	BEGIN TRY
		select X.*, COALESCE(Z.Role_Name, '') Role_Name
		from(
			select DOCNUMBER, DOCDATE, SourceSite_ID, SourceSite_Name, DestSite_ID, DestSite_Name, Total_Line_Item, Notes, [Status], 
			CASE
			WHEN COALESCE(Modified_User, '') = '' THEN Created_User
			WHEN COALESCE(Modified_User, '') <> '' THEN Modified_User
			ELSE '' END Modified_User
			from POS_TrxItemTrf_HeaderTEMP A
			where A.DOCNUMBER=@DOCNUMBER
			UNION
			select DOCNUMBER, Modified_Date DOCDATE, SourceSite_ID, SourceSite_Name, DestSite_ID, DestSite_Name, Total_Line_Item, Notes, [Status], 
			CASE
			WHEN COALESCE(Modified_User, '') = '' THEN Created_User
			WHEN COALESCE(Modified_User, '') <> '' THEN Modified_User
			ELSE '' END Modified_User
			from POS_TrxItemTrf_HeaderPOST A
			where A.DOCNUMBER=@DOCNUMBER
		) X
		left join POS_Account XY ON X.Modified_User=XY.UserID
		left join POS_Employee Y ON XY.EmailAddress=Y.Email
		left join POS_EmployeeRole Z ON Y.Role_ID=Z.Role_ID
	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000),@ErrorSeverity INT,@ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState)
	END CATCH
END
GO
/*
exec TRX_TrfItem_GetDataTransferHDR 'TRF0001'
*/
create or alter proc TRX_TrfItem_GetItemBySite
(
	@Item_Number nvarchar(20),
	@LineItem_Option numeric(19,5),
	@SourceSite_ID nvarchar(20),
	@DestSite_ID nvarchar(20)
)
AS          
BEGIN
	BEGIN TRY
		SELECT *
		FROM(
			select Z.Item_Number, Z.Item_Description, Z.LineItem_Option, Z.Item_SKU, ISNULL(B.InStock, 0) SourceStock, 
			ISNULL(C.InStock, 0) DestinationStock--, ISNULL(B.Item_Cost, 0) Item_Cost
			from(
				SELECT DISTINCT A.Item_Number, 
				A.Item_Name + CASE
				WHEN COALESCE(B.Variant_Name, '') <> '' THEN ' (' + COALESCE(B.Variant_Name, '') + ')'
				ELSE '' END Item_Description, 
				ISNULL(B.LineItem_Option, 0) LineItem_Option, COALESCE(B.Item_SKU, '') Item_SKU
				FROM POS_Item A
				left join POS_ItemVariant B ON A.Item_Number=B.Item_Number
			) Z
			left join POS_ItemVariant B ON Z.Item_Number=B.Item_Number and Z.Item_SKU=B.Item_SKU and B.Site_ID=@SourceSite_ID
			left join POS_ItemVariant C ON Z.Item_Number=C.Item_Number and Z.Item_SKU=C.Item_SKU and C.Site_ID=@DestSite_ID
			where (Z.Item_Number=@Item_Number or @Item_Number='') and (Z.LineItem_Option=@LineItem_Option or @LineItem_Option=0)
			and Z.Item_Number not in(select X.Item_Number from POS_Item X where X.Item_Number not in(select XY.Item_Number from POS_ItemVariant XY))
			UNION
			select X.Item_Number, X.Item_Description, 0 LineItem_Option, X.Item_SKU, ISNULL(Y.InStock, 0) SourceStock, 
			ISNULL(Z.InStock, 0) DestinationStock--, X.Item_Cost
			from POS_Item X
			left join POS_Item Y ON Y.Item_Number=X.Item_Number and Y.Item_SKU=X.Item_SKU and Y.Site_ID=@SourceSite_ID
			left join POS_Item Z ON Z.Item_Number=X.Item_Number and Z.Item_SKU=X.Item_SKU and Z.Site_ID=@DestSite_ID
			where (X.Item_Number=@Item_Number or @Item_Number='') and @LineItem_Option=0
			and X.Item_Number not in(select Item_Number from POS_ItemVariant)
		) A
		order by A.Item_SKU
	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000),@ErrorSeverity INT,@ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState)
	END CATCH
END
GO
/*
exec TRX_TrfItem_GetItemBySite '', ''
exec TRX_TrfItem_GetItemBySite 'SITE0001', 'SITE0002'
exec TRX_TrfItem_GetItemBySite @Item_Number=N'ITM0002',@LineItem_Option=0,@SourceSite_ID=N'SITE0001',@DestSite_ID=N'SITE0003'
*//*
begin tran

exec TRX_TrfItem_ReceiveDeleteItem @DOCNUMBER=N'TRF0004',@Status=2,@UserID=N'USER1'
select * from POS_ItemVariant
rollback
*/
create or alter proc TRX_TrfItem_ReceiveDeleteItem
(
	@DOCNUMBER nvarchar(20),
	@Status int,
	@UserID nvarchar(20)
)
AS          
BEGIN
	BEGIN TRY
		IF LEN(RTRIM(@DOCNUMBER)) = 0
		BEGIN
			RAISERROR('Document Number not found', 16, 1)
		END

		IF NOT EXISTS(SELECT * FROM POS_TrxItemTrf_HeaderTEMP WITH(NOLOCK) WHERE RTRIM(DOCNUMBER)=RTRIM(@DOCNUMBER))
		BEGIN
			RAISERROR('Document Number not exists', 16, 1)
		END

		IF @Status = 2
		BEGIN
			INSERT INTO POS_TrxItemTrf_HeaderPOST
			(DOCNUMBER, DOCDATE, SourceSite_ID, SourceSite_Name, DestSite_ID, DestSite_Name, Total_Line_Item, Notes, [Status], Created_User, Created_Date, Created_time, Modified_User, Modified_Date, Modified_time)
			SELECT DOCNUMBER, DOCDATE, SourceSite_ID, SourceSite_Name, DestSite_ID, DestSite_Name, Total_Line_Item, Notes, @Status, @UserID, CAST(GETDATE() as date), CAST(GETDATE() as time), @UserID, CAST(GETDATE() as date), CAST(GETDATE() as time)
			FROM POS_TrxItemTrf_HeaderTEMP WHERE RTRIM(DOCNUMBER)=RTRIM(@DOCNUMBER)
			
			INSERT INTO POS_TrxItemTrf_DetailPOST(DOCNUMBER, DOCDATE, Lineitmseq, Item_Number, Item_Description, Item_SKU, Source_Stock, Dest_Stock, Qty_Transfer, Created_User, Created_Date, Created_time, Modified_User, Modified_Date, Modified_time)
			SELECT DOCNUMBER, DOCDATE, Lineitmseq, Item_Number, Item_Description, Item_SKU, Source_Stock, Dest_Stock, Qty_Transfer, @UserID, CAST(GETDATE() as date), CAST(GETDATE() as time), @UserID, CAST(GETDATE() as date), CAST(GETDATE() as time)
			FROM POS_TrxItemTrf_DetailTEMP WHERE RTRIM(DOCNUMBER)=RTRIM(@DOCNUMBER)

			DECLARE @SourceSite_ID nvarchar(20)='', @DestSite_ID nvarchar(20)=''
			SELECT TOP 1 @SourceSite_ID=SourceSite_ID, @DestSite_ID=DestSite_ID
			FROM POS_TrxItemTrf_HeaderTEMP WHERE RTRIM(DOCNUMBER)=RTRIM(@DOCNUMBER)

			IF NOT EXISTS(SELECT * FROM POS_ItemVariant A 
						INNER JOIN POS_TrxItemTrf_DetailTEMP B ON A.Item_Number=B.Item_Number and A.Item_SKU=B.Item_SKU
						WHERE A.Site_ID=@DestSite_ID)
			BEGIN
				INSERT INTO POS_ItemVariant(Item_Number, Site_ID, LineItem_Option, CB_Available, Option_ID, Option_Name, LineItem_Variant, Variant_Name, 
				Item_Price, Item_Cost, InStock, LowStock, OptimalStock, Item_SKU, Item_Barcode, Created_User, Created_Date, Modified_User, Modified_Date)
				SELECT DISTINCT A.Item_Number, @DestSite_ID, A.LineItem_Option, A.CB_Available, A.Option_ID, A.Option_Name, A.LineItem_Variant, A.Variant_Name, 
				A.Item_Price, A.Item_Cost, 0, A.LowStock, A.OptimalStock, A.Item_SKU, A.Item_Barcode, @UserID, CAST(GETDATE() as date), @UserID, CAST(GETDATE() as date)
				FROM POS_ItemVariant A
				INNER JOIN POS_TrxItemTrf_DetailTEMP B ON A.Item_Number=B.Item_Number
				WHERE RTRIM(B.DOCNUMBER)=RTRIM(@DOCNUMBER)
			END

			UPDATE A
			SET A.InStock=A.InStock - ISNULL(B.Qty_Transfer, 0)
			FROM POS_ItemVariant A
			INNER JOIN POS_TrxItemTrf_DetailPOST B ON A.Item_Number=B.Item_Number and A.Item_SKU=B.Item_SKU --and A.Site_ID=B.Site_ID
			where A.Site_ID=@SourceSite_ID and RTRIM(B.DOCNUMBER)=RTRIM(@DOCNUMBER)

			UPDATE A
			SET A.InStock=A.InStock + ISNULL(B.Qty_Transfer, 0)
			FROM POS_ItemVariant A
			INNER JOIN POS_TrxItemTrf_DetailPOST B ON A.Item_Number=B.Item_Number and A.Item_SKU=B.Item_SKU --and A.Site_ID=B.Site_ID
			where A.Site_ID=@DestSite_ID and RTRIM(B.DOCNUMBER)=RTRIM(@DOCNUMBER)

			UPDATE A
			SET A.InStock=A.InStock - ISNULL(B.Qty_Transfer, 0)
			FROM POS_Item A
			INNER JOIN POS_TrxItemTrf_DetailPOST B ON A.Item_Number=B.Item_Number
			where A.Site_ID=@SourceSite_ID and RTRIM(B.DOCNUMBER)=RTRIM(@DOCNUMBER)
			
			UPDATE A
			SET A.InStock=A.InStock + ISNULL(B.Qty_Transfer, 0)
			FROM POS_Item A
			INNER JOIN POS_TrxItemTrf_DetailPOST B ON A.Item_Number=B.Item_Number
			where A.Site_ID=@DestSite_ID and RTRIM(B.DOCNUMBER)=RTRIM(@DOCNUMBER)

			INSERT INTO POS_ItemVariant_History(Item_Number, Site_ID, LineItem_Option, Line_Item, CB_Available, Option_ID, Option_Name, LineItem_Variant, Variant_Name, 
			Item_Price, Item_Cost, InStock, LowStock, OptimalStock, Item_SKU, Item_Barcode, Created_User, Created_Date)
			SELECT DISTINCT A.Item_Number, A.Site_ID, A.LineItem_Option, ISNULL(Y.Line_Item, 0), A.CB_Available, A.Option_ID, A.Option_Name, A.LineItem_Variant, A.Variant_Name, 
			A.Item_Price, A.Item_Cost, A.InStock, A.LowStock, A.OptimalStock, A.Item_SKU, A.Item_Barcode, @UserID, CAST(GETDATE() as date)
			FROM POS_ItemVariant A
			INNER JOIN POS_TrxItemTrf_DetailTEMP B ON A.Item_Number=B.Item_Number
			OUTER APPLY (
				SELECT ISNULL(MAX(Line_Item), 0) + 1 Line_Item
				FROM POS_ItemVariant_History X
				WHERE A.Item_Number=X.Item_Number and A.Site_ID=X.Site_ID and A.LineItem_Option=X.LineItem_Option
			) Y
			WHERE RTRIM(B.DOCNUMBER)=RTRIM(@DOCNUMBER) and A.Site_ID=@DestSite_ID
		END
			
		INSERT INTO POS_TrxItemTrf_HeaderHIST
		(DOCNUMBER, DOCDATE, SourceSite_ID, SourceSite_Name, DestSite_ID, DestSite_Name, Total_Line_Item, Notes, [Status], Created_User, Created_Date, Created_time)
		SELECT DOCNUMBER, DOCDATE, SourceSite_ID, SourceSite_Name, DestSite_ID, DestSite_Name, Total_Line_Item, Notes, @Status, @UserID, CAST(GETDATE() as date), CAST(GETDATE() as time)
		FROM POS_TrxItemTrf_HeaderTEMP WHERE RTRIM(DOCNUMBER)=RTRIM(@DOCNUMBER)
		
		INSERT INTO POS_TrxItemTrf_DetailHIST(DOCNUMBER, DOCDATE, Lineitmseq, Item_Number, Item_Description, Item_SKU, Source_Stock, Dest_Stock, Qty_Transfer, Created_User, Created_Date, Created_time)
		SELECT DOCNUMBER, DOCDATE, Lineitmseq, Item_Number, Item_Description, Item_SKU, Source_Stock, Dest_Stock, Qty_Transfer, @UserID, CAST(GETDATE() as date), CAST(GETDATE() as time)
		FROM POS_TrxItemTrf_DetailTEMP WHERE RTRIM(DOCNUMBER)=RTRIM(@DOCNUMBER)

		DELETE FROM POS_TrxItemTrf_HeaderTEMP WHERE RTRIM(DOCNUMBER)=RTRIM(@DOCNUMBER)
		DELETE FROM POS_TrxItemTrf_DetailTEMP WHERE RTRIM(DOCNUMBER)=RTRIM(@DOCNUMBER)

		SELECT CODE='200', DOCNUMBER=@DOCNUMBER

	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000),@ErrorSeverity INT,@ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState)
	END CATCH
END
GO
/*
begin tran

declare @p9 dbo.TrxItemTrfDetailTYPE
insert into @p9 values('2024-01-27 09:46:54',N'Receive Items',10,N'ITM0001',N'tester',0.0,50.0,0.0,0.0,50.0,0.0,0.0)

exec TRX_TrfItem_Save @DOCNUMBER=N'',@DOCDATE='2024-01-27 09:46:54',@Site_ID=N'SITE0001',@Site_Name=N'SITE A',@Reason=N'Receive Items',@Total_Line_Item=1,@Notes=N'tester',@UserID=N'USER1',@TrxAdjDetailTYPE=@p9

rollback
*/
create or alter proc TRX_TrfItem_SaveTemp
(
	@DOCNUMBER nvarchar(20), 
	@DOCDATE DATETIME,
	@SourceSite_ID nvarchar(20), 
	@SourceSite_Name nvarchar(100), 
	@DestSite_ID nvarchar(20), 
	@DestSite_Name nvarchar(100), 
	@Total_Line_Item int,
	@Notes nvarchar(500), 
	@Status int,
	@UserID nvarchar(20),
	@TrxItemTrfDetailTYPE TrxItemTrfDetailTYPE readonly
)
AS          
BEGIN
	BEGIN TRY
		IF LEN(RTRIM(@SourceSite_ID)) = 0
		BEGIN
			RAISERROR('Please choose source site', 16, 1)
		END
		IF LEN(RTRIM(@DestSite_ID)) = 0
		BEGIN
			RAISERROR('Please choose destination site', 16, 1)
		END
		IF NOT EXISTS(SELECT * FROM @TrxItemTrfDetailTYPE)
		BEGIN
			RAISERROR('Please fill items quantity', 16, 1)
		END
		IF EXISTS(SELECT * FROM POS_TrxItemTrf_HeaderTEMP WITH(NOLOCK) WHERE RTRIM(DOCNUMBER)=RTRIM(@DOCNUMBER))
		BEGIN
			UPDATE POS_TrxItemTrf_HeaderTEMP
			SET DOCDATE=@DOCDATE, SourceSite_ID=@SourceSite_ID, SourceSite_Name=@SourceSite_Name, DestSite_ID=@DestSite_ID, DestSite_Name=@DestSite_Name, 
			Total_Line_Item=@Total_Line_Item, Notes=@Notes, [Status]=@Status, Modified_User=@UserID, Modified_Date=CAST(GETDATE() as date), Modified_time=CAST(GETDATE() as time)
			WHERE RTRIM(DOCNUMBER)=RTRIM(@DOCNUMBER)
		END
		ELSE
		BEGIN
			IF LEN(RTRIM(@DOCNUMBER)) = 0
			BEGIN
				declare @TEMPTABLE table(CurrentNumber varchar(20))
				INSERT INTO @TEMPTABLE(CurrentNumber)
				EXEC TRX_GenerateNumberPerDay_Master @DOCID=N'TRF'

				SELECT TOP 1 @DOCNUMBER=CurrentNumber FROM @TEMPTABLE
			END
			--IF EXISTS(select DOCNUMBER from POS_TrxItemTrf_HeaderTEMP where DOCNUMBER=@DOCNUMBER)
			--BEGIN
			--	SET @DOCNUMBER=''
			--	declare @q varchar(30)
			--	EXEC Web_Generate_NumberMaster @TABLE=N'POS_TrxItemTrf_HeaderTEMP', @FIELD=N'DOCNUMBER', @DOCID=N'TRF', @NEWNUMBER=@q output
			--	SET @DOCNUMBER=@q
			--END
			INSERT INTO [POS_TrxItemTrf_HeaderTEMP]
			(DOCNUMBER, DOCDATE, SourceSite_ID, SourceSite_Name, DestSite_ID, DestSite_Name, Total_Line_Item, Notes, [Status], Created_User, Created_Date, Created_time, Modified_User, Modified_Date, Modified_time)
			VALUES
			(@DOCNUMBER, @DOCDATE, @SourceSite_ID, @SourceSite_Name, @DestSite_ID, @DestSite_Name, @Total_Line_Item, @Notes, @Status, @UserID, CAST(GETDATE() as date), CAST(GETDATE() as time), @UserID, CAST(GETDATE() as date), CAST(GETDATE() as time))
		END

		DELETE FROM POS_TrxItemTrf_DetailTEMP WHERE RTRIM(DOCNUMBER)=RTRIM(@DOCNUMBER)

		INSERT INTO POS_TrxItemTrf_DetailTEMP(DOCNUMBER, DOCDATE, Lineitmseq, Item_Number, Item_Description, Item_SKU, Source_Stock, Dest_Stock, Qty_Transfer, Created_User, Created_Date, Created_time, Modified_User, Modified_Date, Modified_time)
		SELECT @DOCNUMBER, DOCDATE, Lineitmseq, Item_Number, Item_Description, Item_SKU, Source_Stock, Dest_Stock, Qty_Transfer, @UserID, CAST(GETDATE() as date), CAST(GETDATE() as time), @UserID, CAST(GETDATE() as date), CAST(GETDATE() as time)
		FROM @TrxItemTrfDetailTYPE

		IF @Status = 2
		BEGIN
			INSERT INTO POS_TrxItemTrf_HeaderPOST
			(DOCNUMBER, DOCDATE, SourceSite_ID, SourceSite_Name, DestSite_ID, DestSite_Name, Total_Line_Item, Notes, [Status], Created_User, Created_Date, Created_time, Modified_User, Modified_Date, Modified_time)
			SELECT DOCNUMBER, DOCDATE, SourceSite_ID, SourceSite_Name, DestSite_ID, DestSite_Name, Total_Line_Item, Notes, [Status], @UserID, CAST(GETDATE() as date), CAST(GETDATE() as time), @UserID, CAST(GETDATE() as date), CAST(GETDATE() as time)
			FROM POS_TrxItemTrf_HeaderTEMP WHERE RTRIM(DOCNUMBER)=RTRIM(@DOCNUMBER)
			
			INSERT INTO POS_TrxItemTrf_DetailPOST(DOCNUMBER, DOCDATE, Lineitmseq, Item_Number, Item_Description, Item_SKU, Source_Stock, Dest_Stock, Qty_Transfer, Created_User, Created_Date, Created_time, Modified_User, Modified_Date, Modified_time)
			SELECT DOCNUMBER, DOCDATE, Lineitmseq, Item_Number, Item_Description, Item_SKU, Source_Stock, Dest_Stock, Qty_Transfer, @UserID, CAST(GETDATE() as date), CAST(GETDATE() as time), @UserID, CAST(GETDATE() as date), CAST(GETDATE() as time)
			FROM POS_TrxItemTrf_DetailTEMP WHERE RTRIM(DOCNUMBER)=RTRIM(@DOCNUMBER)

			IF NOT EXISTS(SELECT * FROM POS_ItemVariant A 
						INNER JOIN POS_TrxItemTrf_DetailTEMP B ON A.Item_Number=B.Item_Number and A.Item_SKU=B.Item_SKU
						WHERE A.Site_ID=@DestSite_ID)
			BEGIN
				INSERT INTO POS_ItemVariant(Item_Number, Site_ID, LineItem_Option, CB_Available, Option_ID, Option_Name, LineItem_Variant, Variant_Name, 
				Item_Price, Item_Cost, InStock, LowStock, OptimalStock, Item_SKU, Item_Barcode, Created_User, Created_Date, Modified_User, Modified_Date)
				SELECT DISTINCT A.Item_Number, @DestSite_ID, A.LineItem_Option, A.CB_Available, A.Option_ID, A.Option_Name, A.LineItem_Variant, A.Variant_Name, 
				A.Item_Price, A.Item_Cost, 0, A.LowStock, A.OptimalStock, A.Item_SKU, A.Item_Barcode, @UserID, CAST(GETDATE() as date), @UserID, CAST(GETDATE() as date)
				FROM POS_ItemVariant A
				INNER JOIN POS_TrxItemTrf_DetailTEMP B ON A.Item_Number=B.Item_Number
				WHERE RTRIM(B.DOCNUMBER)=RTRIM(@DOCNUMBER)
			END

			UPDATE A
			SET A.InStock=A.InStock - ISNULL(B.Qty_Transfer, 0)
			FROM POS_ItemVariant A
			INNER JOIN POS_TrxItemTrf_DetailPOST B ON A.Item_Number=B.Item_Number and A.Item_SKU=B.Item_SKU --and A.Site_ID=B.Site_ID
			where A.Site_ID=@SourceSite_ID and RTRIM(B.DOCNUMBER)=RTRIM(@DOCNUMBER)

			UPDATE A
			SET A.InStock=A.InStock + ISNULL(B.Qty_Transfer, 0)
			FROM POS_ItemVariant A
			INNER JOIN POS_TrxItemTrf_DetailPOST B ON A.Item_Number=B.Item_Number and A.Item_SKU=B.Item_SKU --and A.Site_ID=B.Site_ID
			where A.Site_ID=@DestSite_ID and RTRIM(B.DOCNUMBER)=RTRIM(@DOCNUMBER)

			UPDATE A
			SET A.InStock=A.InStock - ISNULL(B.Qty_Transfer, 0)
			FROM POS_Item A
			INNER JOIN POS_TrxItemTrf_DetailPOST B ON A.Item_Number=B.Item_Number
			where A.Site_ID=@SourceSite_ID and RTRIM(B.DOCNUMBER)=RTRIM(@DOCNUMBER)
			
			UPDATE A
			SET A.InStock=A.InStock + ISNULL(B.Qty_Transfer, 0)
			FROM POS_Item A
			INNER JOIN POS_TrxItemTrf_DetailPOST B ON A.Item_Number=B.Item_Number
			where A.Site_ID=@DestSite_ID and RTRIM(B.DOCNUMBER)=RTRIM(@DOCNUMBER)

			INSERT INTO POS_ItemVariant_History(Item_Number, Site_ID, LineItem_Option, Line_Item, CB_Available, Option_ID, Option_Name, LineItem_Variant, Variant_Name, 
			Item_Price, Item_Cost, InStock, LowStock, OptimalStock, Item_SKU, Item_Barcode, Created_User, Created_Date)
			SELECT DISTINCT A.Item_Number, A.Site_ID, A.LineItem_Option, ISNULL(Y.Line_Item, 0), A.CB_Available, A.Option_ID, A.Option_Name, A.LineItem_Variant, A.Variant_Name, 
			A.Item_Price, A.Item_Cost, A.InStock, A.LowStock, A.OptimalStock, A.Item_SKU, A.Item_Barcode, @UserID, CAST(GETDATE() as date)
			FROM POS_ItemVariant A
			INNER JOIN POS_TrxItemTrf_DetailTEMP B ON A.Item_Number=B.Item_Number
			OUTER APPLY (
				SELECT ISNULL(MAX(Line_Item), 0) + 1 Line_Item
				FROM POS_ItemVariant_History X
				WHERE A.Item_Number=X.Item_Number and A.Site_ID=X.Site_ID and A.LineItem_Option=X.LineItem_Option
			) Y
			WHERE RTRIM(B.DOCNUMBER)=RTRIM(@DOCNUMBER) and A.Site_ID=@DestSite_ID
			
			INSERT INTO POS_TrxItemTrf_HeaderHIST
			(DOCNUMBER, DOCDATE, SourceSite_ID, SourceSite_Name, DestSite_ID, DestSite_Name, Total_Line_Item, Notes, [Status], Created_User, Created_Date, Created_time)
			SELECT DOCNUMBER, DOCDATE, SourceSite_ID, SourceSite_Name, DestSite_ID, DestSite_Name, Total_Line_Item, Notes, [Status], @UserID, CAST(GETDATE() as date), CAST(GETDATE() as time)
			FROM POS_TrxItemTrf_HeaderPOST WHERE RTRIM(DOCNUMBER)=RTRIM(@DOCNUMBER)
			
			INSERT INTO POS_TrxItemTrf_DetailHIST(DOCNUMBER, DOCDATE, Lineitmseq, Item_Number, Item_Description, Item_SKU, Source_Stock, Dest_Stock, Qty_Transfer, Created_User, Created_Date, Created_time)
			SELECT DOCNUMBER, DOCDATE, Lineitmseq, Item_Number, Item_Description, Item_SKU, Source_Stock, Dest_Stock, Qty_Transfer, @UserID, CAST(GETDATE() as date), CAST(GETDATE() as time)
			FROM POS_TrxItemTrf_DetailPOST WHERE RTRIM(DOCNUMBER)=RTRIM(@DOCNUMBER)

			DELETE FROM POS_TrxItemTrf_HeaderTEMP WHERE RTRIM(DOCNUMBER)=RTRIM(@DOCNUMBER)
			DELETE FROM POS_TrxItemTrf_DetailTEMP WHERE RTRIM(DOCNUMBER)=RTRIM(@DOCNUMBER)
		END
		SELECT CODE='200', DOCNUMBER=@DOCNUMBER

	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000),@ErrorSeverity INT,@ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState)
	END CATCH
END
GO
CREATE OR ALTER proc [dbo].[Web_Trx_GetReason]
AS
BEGIN
	BEGIN TRY
		DECLARE @TABLEREASON table(REASON NVARCHAR(30))

		INSERT INTO @TABLEREASON(REASON)
		VALUES
		('Receive Items'),
		('Damage'),
		('Inventory Count'),
		('Loss')

		SELECT * FROM @TABLEREASON
		ORDER BY REASON
	END TRY
	BEGIN	CATCH
			DECLARE @ErrorMessage NVARCHAR(4000)
			DECLARE @ErrorSeverity INT
			DECLARE @ErrorState INT

			SELECT @ErrorMessage = ERROR_MESSAGE(),
				@ErrorSeverity = ERROR_SEVERITY(),
				@ErrorState = ERROR_STATE()

			RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState)
	END CATCH
END
GO
/*
EXEC Web_Trx_GetReason
*/