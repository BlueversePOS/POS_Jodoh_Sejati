IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_Set_Stores_History]') AND type in (N'U'))
DROP TABLE [dbo].[POS_Set_Stores_History]
GO

/****** Object:  Table [dbo].[POS_Set_Stores_History]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_Set_Stores_History
(
	Store_ID nvarchar(20) NOT NULL, 
	Store_Name nvarchar(100) NOT NULL,
	Line_Item int NOT NULL,
	[Address] nvarchar(300) NOT NULL,
	Country nvarchar(100) NOT NULL,
	CountryName nvarchar(100) NOT NULL,
	Province nvarchar(100) NOT NULL,
	City nvarchar(100) NOT NULL,
	Postal_Code nvarchar(10) NOT NULL,
	Phone nvarchar(20) NOT NULL,
	[Description] nvarchar(255) NOT NULL,
	Created_User nvarchar(30),
	Created_Date DATETIME,
	CONSTRAINT PK_POS_Set_Stores_History PRIMARY KEY NONCLUSTERED (Store_ID ASC, Line_Item ASC),
)