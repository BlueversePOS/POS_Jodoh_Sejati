IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_CategoryItem_History]') AND type in (N'U'))
DROP TABLE [dbo].[POS_CategoryItem_History]
GO

/****** Object:  Table [dbo].[POS_CategoryItem_History]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_CategoryItem_History
(
	Category_ID nvarchar(20) NOT NULL, 
	Line_Item int NOT NULL,
	Category_Name nvarchar(250) NOT NULL,
	Category_Color nvarchar(20) NOT NULL, 
	Created_User nvarchar(30),
	Created_Date DATETIME,
	CONSTRAINT PK_POS_CategoryItem_History PRIMARY KEY NONCLUSTERED (Category_ID ASC, Line_Item ASC),
)