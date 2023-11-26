IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_Item]') AND type in (N'U'))
DROP TABLE [dbo].[POS_Item]
GO

/****** Object:  Table [dbo].[POS_Item]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_Item
(
	Item_Number nvarchar(20) NOT NULL, 
	Item_Name nvarchar(50) NOT NULL, 
	Item_Description nvarchar(250) NOT NULL,
	UOFM nvarchar(30) NOT NULL,
	Category_ID nvarchar(20) NOT NULL,
	Item_Sales int NOT NULL,
	Item_SoldBy int NOT NULL,
	Item_Price numeric(19,5) NOT NULL,
	Item_Cost numeric(19,5) NOT NULL,
	Item_SKU nvarchar(10) NOT NULL,
	Item_Barcode nvarchar(MAX) NOT NULL,
	Composite_Item int NOT NULL,
	Track_Stock int NOT NULL,
	InStock int NOT NULL,
	LowStock int NOT NULL,
	Tax_10 int NOT NULL,
	Representation int NOT NULL,
	Item_Color nvarchar(50) NOT NULL,
	Item_Shape nvarchar(50) NOT NULL,
	Item_Image nvarchar(MAX) NOT NULL,
	Created_User nvarchar(30),
	Created_Date DATETIME,
	Modified_User nvarchar(30),
	Modified_Date DATETIME,
	CONSTRAINT PK_POS_Item PRIMARY KEY NONCLUSTERED (Item_Number),
	CONSTRAINT FK_POS_Item_Cat FOREIGN KEY (Category_ID)
	REFERENCES POS_CategoryItem (Category_ID)
	--CONSTRAINT FK_POS_Item_Inventory FOREIGN KEY (Item_Number)
	--REFERENCES POS_ItemInventory (Item_Number),
	--CONSTRAINT FK_POS_Item_Composite FOREIGN KEY (Item_Number)
	--REFERENCES POS_CompositeItem (Item_Number),
	--CONSTRAINT FK_POS_Item_Variant FOREIGN KEY (Item_Number)
	--REFERENCES POS_ItemVariant (Item_Number)
	ON DELETE CASCADE
	ON UPDATE CASCADE
)