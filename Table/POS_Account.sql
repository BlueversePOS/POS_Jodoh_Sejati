IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_Account]') AND type in (N'U'))
DROP TABLE [dbo].[POS_Account]
GO

/****** Object:  Table [dbo].[POS_Account]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_Account
(
	UserID nvarchar(20) NOT NULL, 
	Business_Name nvarchar(100) NOT NULL,
	EmailAddress nvarchar(250) NOT NULL,
	[Password] nvarchar(30) NOT NULL,
	CurrencyID nvarchar(20) NOT NULL,
	Currency nvarchar(30) NOT NULL,
	Timezone nvarchar(30) NOT NULL,
	Created_User nvarchar(30) NOT NULL,
	Created_Date DATETIME NOT NULL,
	Modified_User nvarchar(30),
	Modified_Date DATETIME,
	CONSTRAINT PK_POS_Account PRIMARY KEY NONCLUSTERED (UserID ASC),
	CONSTRAINT FK_POS_User FOREIGN KEY (UserID, EmailAddress)
	REFERENCES POS_LoginUser (UserID, EmailAddress)
	ON DELETE CASCADE
	ON UPDATE CASCADE
)