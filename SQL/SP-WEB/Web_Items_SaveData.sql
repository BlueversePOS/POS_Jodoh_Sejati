create or alter proc Web_Items_SaveData
(
	@UserID nvarchar(20),
	@Item_Number nvarchar(20),
	@Item_Name nvarchar(20),
	@Item_Description nvarchar(250),
	@UOFM nvarchar(30),
	@Category_ID nvarchar(20),
	@Item_Sales int,
	@Item_SoldBy int,
	@Item_Price numeric(19,5),
	@Item_Cost numeric(19,5),
	@Item_SKU nvarchar(10),
	@Item_Barcode nvarchar(MAX),
	@Composite_Item int,
	@Track_Stock int,
	@InStock int,
	@LowStock int,
	@Tax_ID nvarchar(20),
	@Representation int,
	@Item_Color nvarchar(50),
	@Item_Shape nvarchar(50),
	@Item_Image nvarchar(MAX),
	@COMPTYPE COMPTYPE readonly,
	@VARTYPE VARTYPE readonly
)
AS          
BEGIN
	BEGIN TRY
		BEGIN
			IF LEN(ISNULL(@Item_Name,''))=0
			BEGIN
				RAISERROR('Please fill item name.',16,1)
			END
			IF LEN(ISNULL(@Item_Description,''))=0
			BEGIN
				RAISERROR('Please fill item description.',16,1)
			END
			IF LEN(ISNULL(@Category_ID,''))=0
			BEGIN
				RAISERROR('Please choose category.',16,1)
			END
			IF NOT EXISTS(SELECT TOP 1 Site_ID FROM POS_Set_Site WHERE DefaultSite=1)
			BEGIN
				RAISERROR('Please setup your default site.',16,1)
			END
			IF EXISTS(SELECT * FROM @VARTYPE) and (SELECT SUM(ISNULL(InStock, 0)) FROM @VARTYPE) <> @InStock
			BEGIN
				RAISERROR('In Stock Variant not matched with Track Stock.',16,1)
			END
		END

		DECLARE @Site_ID nvarchar(20) = ''
		SELECT TOP 1 @Site_ID=Site_ID 
		FROM POS_Set_Site
		WHERE DefaultSite=1

		IF EXISTS(SELECT * FROM POS_Item WITH(NOLOCK) WHERE RTRIM(Item_Number)=RTRIM(@Item_Number))
		BEGIN
			UPDATE POS_Item
			SET Item_Name=@Item_Name, Item_Description=@Item_Description, UOFM=@UOFM, Category_ID=@Category_ID, Item_Sales=@Item_Sales, Item_SoldBy=@Item_SoldBy, 
			Item_Price=@Item_Price, Item_Cost=@Item_Cost, Item_SKU=@Item_SKU, Item_Barcode=@Item_Barcode, Composite_Item=@Composite_Item, 
			Track_Stock=@Track_Stock, InStock=@InStock, LowStock=@LowStock, Tax_ID=@Tax_ID, Representation=@Representation, Item_Color=@Item_Color, 
			Item_Shape=@Item_Shape, Item_Image=@Item_Image, Modified_User=@UserID, Modified_Date=CAST(GETDATE() as date)
			WHERE RTRIM(Item_Number)=RTRIM(@Item_Number) and Site_ID=@Site_ID
		END
		ELSE
		BEGIN
			declare @p varchar(30)
			EXEC Web_Generate_NumberMaster @TABLE=N'POS_Item', @FIELD=N'Item_Number', @DOCID=N'ITM', @NEWNUMBER=@p output
			SET @Item_Number=@p

			INSERT INTO [POS_Item]
			(Item_Number, Site_ID, Item_Name, Item_Description, UOFM, Category_ID, Item_Sales, Item_SoldBy, Item_Price, Item_Cost, 
			Item_SKU, Item_Barcode, Composite_Item, Track_Stock, InStock, LowStock, Tax_ID, Representation, Item_Color, 
			Item_Shape, Item_Image, Created_User, Created_Date, Modified_User, Modified_Date)
			SELECT @Item_Number, COALESCE(X.Site_ID, ''), @Item_Name, @Item_Description, @UOFM, @Category_ID, @Item_Sales, @Item_SoldBy, @Item_Price, @Item_Cost, 
			@Item_SKU, @Item_Barcode, @Composite_Item, @Track_Stock, 
			CASE WHEN COALESCE(X.Site_ID, '') = @Site_ID THEN @InStock ELSE 0 END, @LowStock, @Tax_ID, @Representation, @Item_Color, 
			@Item_Shape, @Item_Image, @UserID, CAST(GETDATE() as date), '', ''
			FROM POS_Set_Site X
		END

		DECLARE @LINEITEM int = 0
		SELECT @LINEITEM=MAX(COALESCE(Line_Item, 0)) + 1
		FROM POS_Item_History
		WHERE Item_Number=@Item_Number

		INSERT INTO [POS_Item_History]
		(Item_Number, Site_ID, Item_Name, Item_Description, Line_Item, UOFM, Category_ID, Item_Sales, Item_SoldBy, Item_Price, Item_Cost, 
		Item_SKU, Item_Barcode, Composite_Item, Track_Stock, InStock, LowStock, Tax_ID, Representation, Item_Color, 
		Item_Shape, Item_Image, Created_User, Created_Date)
		SELECT @Item_Number, COALESCE(X.Site_ID, ''), @Item_Name, @Item_Description, COALESCE(@LINEITEM, 0), @UOFM, @Category_ID, 
		@Item_Sales, @Item_SoldBy, @Item_Price, @Item_Cost, @Item_SKU, @Item_Barcode, @Composite_Item, @Track_Stock, 
		CASE WHEN COALESCE(X.Site_ID, '') = @Site_ID THEN @InStock ELSE 0 END, 
		@LowStock, @Tax_ID, @Representation, @Item_Color, 
		@Item_Shape, @Item_Image, @UserID, CAST(GETDATE() as date)
		FROM POS_Set_Site X

		DELETE FROM POS_CompositeItem
		WHERE Item_Number=@Item_Number

		INSERT INTO POS_CompositeItem(Item_Number, Item_Quantity, Item_Cost, Item_Composite, Created_User, Created_Date, Modified_User, Modified_Date)
		SELECT @Item_Number, Item_Quantity, Item_Cost, Item_Composite, @UserID, CAST(GETDATE() as date), @UserID, CAST(GETDATE() as date)
		FROM @COMPTYPE --WHERE Item_Number=@Item_Number

		INSERT INTO POS_CompositeItem_History(Item_Number, Line_Item, Item_Quantity, Item_Cost, Item_Composite, Created_User, Created_Date)
		SELECT @Item_Number, ROW_NUMBER() OVER(ORDER BY Item_Number), Item_Quantity, Item_Cost, Item_Composite, @UserID, CAST(GETDATE() as date)
		FROM @COMPTYPE --WHERE Item_Number=@Item_Number

		MERGE POS_ItemVariant AS A --TARGET
		USING (
			SELECT X.*, COALESCE(Y.Site_ID, '') Site_ID
			FROM @VARTYPE X 
			OUTER APPLY(
				select Site_ID from POS_Set_Site
			) Y
		) AS B --SOURCE
		ON A.Item_Number=@Item_Number and A.Site_ID=B.Site_ID and A.LineItem_Option=B.LineItem_Option --primary

		WHEN MATCHED THEN
		UPDATE 
		SET CB_Available=B.CB_Available, Option_ID=B.Option_ID, Option_Name=B.Option_Name, LineItem_Variant=B.LineItem_Variant, Variant_Name=B.Variant_Name, 
		Item_Price=B.Item_Price, Item_Cost=B.Item_Cost, InStock=CASE WHEN COALESCE(B.Site_ID, '') = @Site_ID THEN B.InStock ELSE 0 END, LowStock=B.LowStock, 
		OptimalStock=B.OptimalStock, Item_SKU=B.Item_SKU, Item_Barcode=B.Item_Barcode, Modified_User=@UserID, Modified_Date=cast(getdate() as date)

		WHEN NOT MATCHED BY TARGET THEN
		INSERT(Item_Number, Site_ID, LineItem_Option, CB_Available, Option_ID, Option_Name, LineItem_Variant, Variant_Name, 
		Item_Price, Item_Cost, InStock, LowStock, OptimalStock, Item_SKU, Item_Barcode, Created_User, Created_Date, Modified_User, Modified_Date)
		VALUES(@Item_Number, COALESCE(B.Site_ID, ''), B.LineItem_Option, B.CB_Available, 
		B.Option_ID, B.Option_Name, B.LineItem_Variant, B.Variant_Name, B.Item_Price, B.Item_Cost, 
		CASE WHEN COALESCE(B.Site_ID, '') = @Site_ID THEN InStock ELSE 0 END, 
		B.LowStock, B.OptimalStock, B.Item_SKU, B.Item_Barcode, @UserID, CAST(GETDATE() as date), @UserID, CAST(GETDATE() as date));

		INSERT INTO POS_ItemVariant_History(Item_Number, Site_ID, LineItem_Option, Line_Item, CB_Available, Option_ID, Option_Name, LineItem_Variant, Variant_Name, 
		Item_Price, Item_Cost, InStock, LowStock, OptimalStock, Item_SKU, Item_Barcode, Created_User, Created_Date)
		SELECT @Item_Number, COALESCE(X.Site_ID, ''), A.LineItem_Option, ISNULL(B.Line_Item, 1), 
		A.CB_Available, A.Option_ID, A.Option_Name, A.LineItem_Variant, A.Variant_Name, 
		A.Item_Price, A.Item_Cost, 
		CASE WHEN COALESCE(X.Site_ID, '') = @Site_ID THEN A.InStock ELSE 0 END, 
		A.LowStock, A.OptimalStock, A.Item_SKU, A.Item_Barcode, @UserID, CAST(GETDATE() as date)
		FROM @VARTYPE A --WHERE Item_Number=@Item_Number
		LEFT JOIN (
			SELECT Item_Number, LineItem_Option, ISNULL(MAX(Line_Item), 0) + 1 Line_Item
			from POS_ItemVariant_History
			WHERE Item_Number=@Item_Number --and Site_ID=@Site_ID
			group by Item_Number, LineItem_Option
		)B ON A.Item_Number = B.Item_Number and A.LineItem_Option=B.LineItem_Option
		OUTER APPLY(
			SELECT Site_ID
			FROM POS_Set_Site
		) X
			
		SELECT CODE='200', Item_Number=@Item_Number

	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000),@ErrorSeverity INT,@ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState)
	END CATCH
END
GO
/*
declare @p22 dbo.COMPTYPE

declare @p23 dbo.VARTYPE
insert into @p23 values(N'',1.0,0,N'Warna / Ukuran',N'Warna / Ukuran',1.0,N'Hitam / Kecil',30000.0,50000.0,20,5,10,N'0110001',N'')
insert into @p23 values(N'',2.0,0,N'Warna / Ukuran',N'Warna / Ukuran',2.0,N'Hitam / Besar',30000.0,50000.0,20,5,10,N'0110002',N'')
insert into @p23 values(N'',3.0,0,N'Warna / Ukuran',N'Warna / Ukuran',3.0,N'Biru / Kecil',30000.0,50000.0,15,5,10,N'0110003',N'')
insert into @p23 values(N'',4.0,0,N'Warna / Ukuran',N'Warna / Ukuran',4.0,N'Biru / Besar',30000.0,50000.0,15,5,10,N'0110004',N'')
insert into @p23 values(N'',5.0,0,N'Warna / Ukuran',N'Warna / Ukuran',5.0,N'Merah / Kecil',30000.0,50000.0,15,5,10,N'0110005',N'')
insert into @p23 values(N'',6.0,0,N'Warna / Ukuran',N'Warna / Ukuran',6.0,N'Merah / Besar',30000.0,50000.0,15,5,10,N'0110006',N'')

exec Web_Items_SaveData @UserID=N'USER1',@Item_Number=N'',@Item_Name=N'Tester',@Item_Description=N'Item Tester',
@UOFM=N'',@Category_ID=N'CAT0004',@Item_Sales=0,@Item_SoldBy=1,@Item_Price=30000.0,@Item_Cost=50000.0,@Item_SKU=N'0110001',
@Item_Barcode=N'',@Composite_Item=0,@Track_Stock=1,@InStock=100,@LowStock=10,@Tax_ID=N'TAX0001',@Representation=1,
@Item_Color=N'bg-red',@Item_Shape=N'circle',@Item_Image=N'',@COMPTYPE=@p22,@VARTYPE=@p23
*/
