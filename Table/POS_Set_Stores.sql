IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_Set_Stores]') AND type in (N'U'))
DROP TABLE [dbo].[POS_Set_Stores]
GO

/****** Object:  Table [dbo].[POS_Set_Stores]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_Set_Stores
(
	Store_ID nvarchar(20) NOT NULL, 
	Store_Name nvarchar(100) NOT NULL,
	[Address] nvarchar(300) NOT NULL,
	Country nvarchar(100) NOT NULL,
	Province nvarchar(100) NOT NULL,
	City nvarchar(100) NOT NULL,
	Postal_Code nvarchar(10) NOT NULL,
	Phone nvarchar(20) NOT NULL,
	[Description] nvarchar(255) NOT NULL,
	Created_User nvarchar(30),
	Created_Date DATETIME,
	Modified_User nvarchar(30),
	Modified_Date DATETIME,
	CONSTRAINT PK_POS_Set_Stores PRIMARY KEY NONCLUSTERED (Store_ID ASC),
)