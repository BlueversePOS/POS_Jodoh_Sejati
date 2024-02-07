IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_CompositeItem_History]') AND type in (N'U'))
	DROP TABLE [dbo].[POS_CompositeItem_History]
GO

/****** Object:  Table [dbo].[POS_CompositeItem_History]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_CompositeItem_History
(
	Item_Number nvarchar(20) NOT NULL, 
	Line_Item int NOT NULL,
	Item_Quantity numeric(19,5) NOT NULL,
	Item_Cost numeric(19,5) NOT NULL,
	Item_Composite int NOT NULL,
	Created_User nvarchar(30),
	Created_Date DATETIME,
	CONSTRAINT PK_POS_CompositeItem_History PRIMARY KEY NONCLUSTERED (Item_Number ASC, Line_Item ASC),
)