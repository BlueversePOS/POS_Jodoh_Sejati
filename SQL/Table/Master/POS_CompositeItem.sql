IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_CompositeItem]') AND type in (N'U'))
	DROP TABLE [dbo].[POS_CompositeItem]
GO

/****** Object:  Table [dbo].[POS_CompositeItem]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_CompositeItem
(
	Item_Number nvarchar(20) NOT NULL, 
	Item_Quantity numeric(19,5) NOT NULL,
	Item_Cost numeric(19,5) NOT NULL,
	Item_Composite int NOT NULL,
	Created_User nvarchar(30),
	Created_Date DATETIME,
	Modified_User nvarchar(30),
	Modified_Date DATETIME,
	CONSTRAINT PK_POS_CompositeItem PRIMARY KEY NONCLUSTERED (Item_Number),
)