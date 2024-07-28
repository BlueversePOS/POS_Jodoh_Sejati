/*
begin tran

declare @p9 dbo.TrxAdjDetailTYPE
insert into @p9 values('2024-01-27 09:46:54',N'Receive Items',10,N'ITM0001',N'tester',0.0,50.0,0.0,0.0,50.0,0.0,0.0)

exec TRX_Adjustment_Save @DOCNUMBER=N'',@DOCDATE='2024-01-27 09:46:54',@Site_ID=N'SITE0001',@Site_Name=N'SITE A',@Reason=N'Receive Items',@Total_Line_Item=1,@Notes=N'tester',@UserID=N'USER1',@TrxAdjDetailTYPE=@p9

rollback
*/
create or alter proc [dbo].[TRX_Adjustment_Save]
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
		DECLARE @CurrDate datetime = SYSDATETIMEOFFSET() AT TIME ZONE 'SE Asia Standard Time'
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
			Modified_User=@UserID, Modified_Date=CAST(@CurrDate as date), Modified_time=CAST(@CurrDate as time)
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
			(@DOCNUMBER, @DOCDATE, @Site_ID, @Site_Name, @Reason, @Total_Line_Item, @Notes, @UserID, CAST(@CurrDate as date), CAST(@CurrDate as time), '', '', '')
		END

		DELETE FROM POS_TrxAdjustment_Detail WHERE RTRIM(DOCNUMBER)=RTRIM(@DOCNUMBER)
			
		INSERT INTO POS_TrxAdjustment_Detail(DOCNUMBER, DOCDATE, Reason, Lineitmseq, Item_Number, LineItem_Option, Item_Description, Qty_Stock, Qty_Add_Stock, Qty_Remove_Stock, 
		Item_Cost, Qty_After_Stock, Expected_Stock, Counted_Stock, Created_User, Created_Date, Created_time, Modified_User, Modified_Date, Modified_time)
		SELECT @DOCNUMBER, DOCDATE, Reason, Lineitmseq, Item_Number, LineItem_Option, Item_Description, Qty_Stock, Qty_Add_Stock, Qty_Remove_Stock, 
		Item_Cost, Qty_After_Stock, Expected_Stock, Counted_Stock, @UserID, CAST(@CurrDate as date), CAST(@CurrDate as time), 
		@UserID, CAST(@CurrDate as date), CAST(@CurrDate as time)
		FROM @TrxAdjDetailTYPE

		UPDATE A
		SET A.InStock=CASE
			WHEN LOWER(RTRIM(@Reason)) = 'inventory count' and B.LineItem_Option > 0 THEN A.InStock + ISNULL(B.Counted_Stock, 0) - ISNULL(B.Qty_Stock, 0)
			WHEN LOWER(RTRIM(@Reason)) = 'inventory count' and B.LineItem_Option = 0 THEN ISNULL(B.Counted_Stock, 0)
			WHEN B.LineItem_Option > 0 THEN A.InStock + ISNULL(B.Qty_After_Stock, 0) - ISNULL(B.Qty_Stock, 0)
			WHEN B.LineItem_Option = 0 THEN ISNULL(B.Qty_After_Stock, 0)
			ELSE A.InStock END
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
		SELECT DOCNUMBER, DOCDATE, Site_ID, Site_Name, Reason, Total_Line_Item, Notes, @UserID, CAST(@CurrDate as date), CAST(@CurrDate as time)
		FROM POS_TrxAdjustment_Header
		WHERE RTRIM(DOCNUMBER)=RTRIM(@DOCNUMBER)

		INSERT INTO POS_TrxAdjustment_DetailHIST(DOCNUMBER, DOCDATE, Reason, Lineitmseq, Item_Number, LineItem_Option, Item_Description, Qty_Stock, 
		Qty_Add_Stock, Qty_Remove_Stock, Item_Cost, Qty_After_Stock, Expected_Stock, Counted_Stock, Created_User, Created_Date, Created_time)
		SELECT DOCNUMBER, DOCDATE, Reason, Lineitmseq, Item_Number, LineItem_Option, Item_Description, Qty_Stock, Qty_Add_Stock, Qty_Remove_Stock, Item_Cost, 
		Qty_After_Stock, Expected_Stock, Counted_Stock, @UserID, CAST(@CurrDate as date), CAST(@CurrDate as time)
		FROM POS_TrxAdjustment_Detail
		WHERE RTRIM(DOCNUMBER)=RTRIM(@DOCNUMBER)

		INSERT INTO POS_ItemVariant_History(Item_Number, Site_ID, LineItem_Option, Line_Item, CB_Available, Option_ID, Option_Name, 
		LineItem_Variant, Variant_Name, Item_Price, Item_Cost, InStock, LowStock, OptimalStock, Item_SKU, Item_Barcode, Created_User, Created_Date)
		SELECT A.Item_Number, A.Site_ID, A.LineItem_Option, ISNULL(HIST.Line_Item, 0) + 1, A.CB_Available, A.Option_ID, A.Option_Name, 
		A.LineItem_Variant, A.Variant_Name, A.Item_Price, A.Item_Cost, A.InStock, A.LowStock, A.OptimalStock, A.Item_SKU, A.Item_Barcode, @UserID, CAST(@CurrDate as date) 
		FROM POS_ItemVariant A
		INNER JOIN POS_TrxAdjustment_Detail B ON A.Item_Number=B.Item_Number and A.LineItem_Option=B.LineItem_Option
		LEFT JOIN (
			SELECT Item_Number, Site_ID, LineItem_Option, ISNULL(MAX(Line_Item), 0) Line_Item
			FROM POS_ItemVariant_History X
			GROUP BY Item_Number, Site_ID, LineItem_Option
		) HIST ON A.Item_Number=HIST.Item_Number and A.Site_ID=HIST.Site_ID and A.LineItem_Option=HIST.LineItem_Option
		WHERE RTRIM(B.DOCNUMBER)=RTRIM(@DOCNUMBER) and RTRIM(A.Site_ID)=RTRIM(@Site_ID)

		SELECT CODE='200', DOCNUMBER=@DOCNUMBER

	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000),@ErrorSeverity INT,@ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState)
	END CATCH
END
GO
