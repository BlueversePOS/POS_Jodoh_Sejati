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
	@Tax_10 nvarchar(20),
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
		END

		IF EXISTS(SELECT * FROM POS_Item WITH(NOLOCK) WHERE RTRIM(Item_Number)=RTRIM(@Item_Number))
		BEGIN
			UPDATE POS_Item
			SET Item_Name=@Item_Name, Item_Description=@Item_Description, UOFM=@UOFM, Category_ID=@Category_ID, Item_Sales=@Item_Sales, Item_SoldBy=@Item_SoldBy, 
			Item_Price=@Item_Price, Item_Cost=@Item_Cost, Item_SKU=@Item_SKU, Item_Barcode=@Item_Barcode, Composite_Item=@Composite_Item, 
			Track_Stock=@Track_Stock, InStock=@InStock, LowStock=@LowStock, Tax_10=@Tax_10, Representation=@Representation, Item_Color=@Item_Color, 
			Item_Shape=@Item_Shape, Item_Image=@Item_Image, Modified_User=@UserID, Modified_Date=DATEADD(HOUR,1,GETDATE())
			WHERE RTRIM(Item_Number)=RTRIM(@Item_Number)
		END
		ELSE
		BEGIN
			declare @p varchar(30)
			EXEC Web_Generate_NumberMaster @TABLE=N'POS_Item', @FIELD=N'Item_Number', @DOCID=N'ITM', @NEWNUMBER=@p output
			SET @Item_Number=@p

			INSERT INTO [POS_Item]
			(Item_Number, Item_Name, Item_Description, UOFM, Category_ID, Item_Sales, Item_SoldBy, Item_Price, Item_Cost, 
			Item_SKU, Item_Barcode, Composite_Item, Track_Stock, InStock, LowStock, Tax_10, Representation, Item_Color, 
			Item_Shape, Item_Image, Created_User, Created_Date, Modified_User, Modified_Date)
			VALUES
			(@Item_Number, @Item_Name, @Item_Description, @UOFM, @Category_ID, @Item_Sales, @Item_SoldBy, @Item_Price, @Item_Cost, 
			@Item_SKU, @Item_Barcode, @Composite_Item, @Track_Stock, @InStock, @LowStock, @Tax_10, @Representation, @Item_Color, 
			@Item_Shape, @Item_Image, @UserID, DATEADD(HOUR,1,GETDATE()), '', '')
		END

		DECLARE @LINEITEM int = 0
		SELECT @LINEITEM=MAX(COALESCE(Line_Item, 0)) + 1
		FROM POS_Item_History
		WHERE Category_ID=@Category_ID

		INSERT INTO [POS_Item_History]
		(Item_Number, Item_Name, Item_Description, Line_Item, UOFM, Category_ID, Item_Sales, Item_SoldBy, Item_Price, Item_Cost, 
		Item_SKU, Item_Barcode, Composite_Item, Track_Stock, InStock, LowStock, Tax_10, Representation, Item_Color, 
		Item_Shape, Item_Image, Created_User, Created_Date)
		VALUES
		(@Item_Number, @Item_Name, @Item_Description, COALESCE(@LINEITEM, 0), @UOFM, @Category_ID, @Item_Sales, @Item_SoldBy, @Item_Price, @Item_Cost, 
		@Item_SKU, @Item_Barcode, @Composite_Item, @Track_Stock, @InStock, @LowStock, @Tax_10, @Representation, @Item_Color, 
		@Item_Shape, @Item_Image, @UserID, DATEADD(HOUR,1,GETDATE()))

		DELETE FROM POS_CompositeItem
		WHERE Item_Number=@Item_Number

		INSERT INTO POS_CompositeItem(Item_Number, Item_Quantity, Item_Cost, Item_Composite, Created_User, Created_Date, Modified_User, Modified_Date)
		SELECT @Item_Number, Item_Quantity, Item_Cost, Item_Composite, @UserID, DATEADD(HOUR,1,GETDATE()), @UserID, DATEADD(HOUR,1,GETDATE())
		FROM @COMPTYPE --WHERE Item_Number=@Item_Number

		INSERT INTO POS_CompositeItem_History(Item_Number, Line_Item, Item_Quantity, Item_Cost, Item_Composite, Created_User, Created_Date)
		SELECT @Item_Number, ROW_NUMBER() OVER(ORDER BY Item_Number), Item_Quantity, Item_Cost, Item_Composite, @UserID, DATEADD(HOUR,1,GETDATE())
		FROM @COMPTYPE --WHERE Item_Number=@Item_Number

		DELETE FROM POS_ItemVariant
		WHERE Item_Number=@Item_Number

		INSERT INTO POS_ItemVariant(Item_Number, LineItem_Option, CB_Available, Option_ID, Option_Name, LineItem_Variant, Variant_Name, 
		Item_Price, Item_Cost, InStock, LowStock, OptimalStock, Item_SKU, Item_Barcode, Created_User, Created_Date, Modified_User, Modified_Date)
		SELECT @Item_Number, LineItem_Option, CB_Available, Option_ID, Option_Name, LineItem_Variant, Variant_Name, 
		Item_Price, Item_Cost, InStock, LowStock, OptimalStock, Item_SKU, Item_Barcode, @UserID, DATEADD(HOUR,1,GETDATE()), @UserID, DATEADD(HOUR,1,GETDATE())
		FROM @VARTYPE --WHERE Item_Number=@Item_Number

		INSERT INTO POS_ItemVariant_History(Item_Number, LineItem_Option, Line_Item, CB_Available, Option_ID, Option_Name, LineItem_Variant, Variant_Name, 
		Item_Price, Item_Cost, InStock, LowStock, OptimalStock, Item_SKU, Item_Barcode, Created_User, Created_Date)
		SELECT @Item_Number, LineItem_Option, ROW_NUMBER() OVER(ORDER BY Item_Number), CB_Available, Option_ID, Option_Name, LineItem_Variant, Variant_Name, 
		Item_Price, Item_Cost, InStock, LowStock, OptimalStock, Item_SKU, Item_Barcode, @UserID, DATEADD(HOUR,1,GETDATE())
		FROM @VARTYPE --WHERE Item_Number=@Item_Number
			
		SELECT CODE='200', Item_Number=@Item_Number

	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000),@ErrorSeverity INT,@ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState)
	END CATCH
END
/*
declare @p22 dbo.COMPTYPE

declare @p23 dbo.VARTYPE

exec Web_Items_SaveData @UserID=N'USER1',@Item_Number=N'',@Item_Name=N'Item Kopsus',@Item_Description=N'Item Kopi Susu',@UOFM=N'',
@Category_ID=N'CAT0001',@Item_Sales=1,@Item_SoldBy=0,@Item_Price=25000.0,@Item_Cost=18000.0,@Item_SKU=N'000001',@Item_Barcode=N'',
@Composite_Item=0,@Track_Stock=1,@InStock=50,@LowStock=10,@Tax_10=N'1',@Representation=0,@Item_Color=N'bg-red',@Item_Shape=N'shape',
@Item_Image=N'',@COMPTYPE=@p22,@VARTYPE=@p23
*/
GO
