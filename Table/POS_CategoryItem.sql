IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_CategoryItem]') AND type in (N'U'))
DROP TABLE [dbo].[POS_CategoryItem]
GO

/****** Object:  Table [dbo].[POS_CategoryItem]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_CategoryItem
(
	Category_ID nvarchar(20) NOT NULL, 
	Category_Name nvarchar(250) NOT NULL,
	Created_User nvarchar(30),
	Created_Date DATETIME,
	Modified_User nvarchar(30),
	Modified_Date DATETIME,
	CONSTRAINT PK_POS_CategoryItem PRIMARY KEY NONCLUSTERED (Category_ID),
)