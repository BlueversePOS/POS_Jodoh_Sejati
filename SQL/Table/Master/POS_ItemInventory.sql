
ALTER TABLE [dbo].[POS_ItemInventory] DROP CONSTRAINT [FK_POS_ItemInventorySite]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_ItemInventory]') AND type in (N'U'))
	DROP TABLE [dbo].[POS_ItemInventory]
GO

/****** Object:  Table [dbo].[POS_ItemInventory]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_ItemInventory
(
	Item_Number nvarchar(20) NOT NULL, 
	Item_Quantity numeric(19,5) NOT NULL,
	Site_ID nvarchar(20) NOT NULL, 
	Low_Stock numeric(19,5) NOT NULL,
	UOFM nvarchar(30) NOT NULL,
	Created_User nvarchar(30),
	Created_Date DATETIME,
	Modified_User nvarchar(30),
	Modified_Date DATETIME,
	CONSTRAINT PK_POS_ItemInventory PRIMARY KEY NONCLUSTERED (Item_Number),
	CONSTRAINT FK_POS_ItemInventorySite FOREIGN KEY (Site_ID)
	REFERENCES POS_Set_Site (Site_ID)
	ON DELETE CASCADE
	ON UPDATE CASCADE
)