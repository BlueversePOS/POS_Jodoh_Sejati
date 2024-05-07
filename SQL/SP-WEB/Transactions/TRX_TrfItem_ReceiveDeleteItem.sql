/*
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