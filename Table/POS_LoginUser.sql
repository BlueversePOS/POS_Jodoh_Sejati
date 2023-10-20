IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_LoginUser]') AND type in (N'U'))
DROP TABLE [dbo].[POS_LoginUser]
GO

/****** Object:  Table [dbo].[POS_LoginUser]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_LoginUser
(
	UserID nvarchar(20) NOT NULL UNIQUE,
	EmailAddress nvarchar(250) NOT NULL,
	[PASSWORD] nvarchar(100) NOT NULL,
	Business_Name nvarchar(100) NOT NULL,
	Currency nvarchar(30) NOT NULL,
	Country nvarchar(100) NOT NULL,
	Verify int NOT NULL,
	Created_User nvarchar(100) NOT NULL,
	Created_Date DATETIME NOT NULL,
	Modified_User nvarchar(100) NOT NULL,
	Modified_Date DATETIME NOT NULL,
	CONSTRAINT PK_POS_LoginUser PRIMARY KEY NONCLUSTERED (UserID ASC, EmailAddress ASC),
)