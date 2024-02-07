IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_Account_History]') AND type in (N'U'))
DROP TABLE [dbo].[POS_Account_History]
GO

/****** Object:  Table [dbo].[POS_Account_History]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_Account_History
(
	UserID nvarchar(20) NOT NULL, 
	Line_Item int NOT NULL,
	Business_Name nvarchar(100) NOT NULL,
	EmailAddress nvarchar(250) NOT NULL,
	[Password] nvarchar(30) NOT NULL,
	CurrencyID nvarchar(20) NOT NULL,
	Currency nvarchar(30) NOT NULL,
	Timezone nvarchar(30) NOT NULL,
	Created_User nvarchar(30) NOT NULL,
	Created_Date DATETIME NOT NULL,
	CONSTRAINT PK_POS_Account_History PRIMARY KEY NONCLUSTERED (UserID ASC, Line_Item ASC),
)