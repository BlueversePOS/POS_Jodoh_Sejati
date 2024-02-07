IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_ItemInventory_History]') AND type in (N'U'))
	DROP TABLE [dbo].[POS_ItemInventory_History]
GO

/****** Object:  Table [dbo].[POS_ItemInventory_History]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_ItemInventory_History
(
	Item_Number nvarchar(20) NOT NULL, 
	Line_Item int NOT NULL,
	Item_Quantity numeric(19,5) NOT NULL,
	Site_ID nvarchar(20) NOT NULL, 
	Low_Stock numeric(19,5) NOT NULL,
	UOFM nvarchar(30) NOT NULL,
	Created_User nvarchar(30),
	Created_Date DATETIME,
	CONSTRAINT PK_POS_ItemInventory_History PRIMARY KEY NONCLUSTERED (Item_Number ASC, Line_Item ASC),
)