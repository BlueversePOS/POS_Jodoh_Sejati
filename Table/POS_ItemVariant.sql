IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_ItemVariant]') AND type in (N'U'))
	DROP TABLE [dbo].[POS_ItemVariant]
GO

/****** Object:  Table [dbo].[POS_ItemVariant]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_ItemVariant
(
	Item_Variant nvarchar(20) NOT NULL,
	LineItem_Option numeric(19,5) NOT NULL,
	Option_Name nvarchar(50) NOT NULL,
	LineItem_Variant numeric(19,5) NOT NULL,
	Variant_Name nvarchar(50) NOT NULL,
	Created_User nvarchar(30),
	Created_Date DATETIME,
	Modified_User nvarchar(30),
	Modified_Date DATETIME,
	CONSTRAINT PK_POS_ItemVariant PRIMARY KEY NONCLUSTERED (Item_Variant),
)