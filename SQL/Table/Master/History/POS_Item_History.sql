IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_Item_History]') AND type in (N'U'))
DROP TABLE [dbo].[POS_Item_History]
GO

/****** Object:  Table [dbo].[POS_Item_History]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_Item_History
(
	Item_Number nvarchar(20) NOT NULL, 
	Site_ID nvarchar(20) NOT NULL, 
	Item_Name nvarchar(50) NOT NULL, 
	Item_Description nvarchar(250) NOT NULL,
	Line_Item int NOT NULL,
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
	Tax_ID nvarchar(20) NOT NULL,
	Representation int NOT NULL,
	Item_Color nvarchar(50) NOT NULL,
	Item_Shape nvarchar(50) NOT NULL,
	Item_Image nvarchar(MAX) NOT NULL,
	Created_User nvarchar(30),
	Created_Date DATETIME,
	CONSTRAINT PK_POS_Item_History PRIMARY KEY NONCLUSTERED (Item_Number ASC, Site_ID ASC, Line_Item ASC),
)