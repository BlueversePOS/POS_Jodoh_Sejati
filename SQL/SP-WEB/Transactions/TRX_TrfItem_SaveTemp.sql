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