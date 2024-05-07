IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_ItemVariant_History]') AND type in (N'U'))
	DROP TABLE [dbo].[POS_ItemVariant_History]
GO

/****** Object:  Table [dbo].[POS_ItemVariant_History]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_ItemVariant_History
(
	Item_Number nvarchar(20) NOT NULL,
	Site_ID nvarchar(20) NOT NULL, 
	LineItem_Option numeric(19,5) NOT NULL,
	Line_Item int NOT NULL,
	CB_Available int NOT NULL,
	Option_ID nvarchar(50) NOT NULL,
	Option_Name nvarchar(50) NOT NULL,
	LineItem_Variant numeric(19,5) NOT NULL,
	Variant_Name nvarchar(50) NOT NULL,
	Item_Price numeric(19,5) NOT NULL,
	Item_Cost numeric(19,5) NOT NULL,
	InStock int NOT NULL,
	LowStock int NOT NULL,
	OptimalStock int NOT NULL,
	Item_SKU nvarchar(10) NOT NULL,
	Item_Barcode nvarchar(MAX) NOT NULL,
	Created_User nvarchar(30),
	Created_Date DATETIME,
	CONSTRAINT PK_POS_ItemVariant_History PRIMARY KEY NONCLUSTERED (Item_Number ASC, Site_ID ASC, LineItem_Option ASC, Line_Item ASC),
)
