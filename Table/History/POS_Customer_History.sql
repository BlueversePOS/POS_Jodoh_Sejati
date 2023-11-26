IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_Customer_History]') AND type in (N'U'))
DROP TABLE [dbo].[POS_Customer_History]
GO

/****** Object:  Table [dbo].[POS_Customer_History]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_Customer_History
(
	Customer_ID nvarchar(20) NOT NULL, 
	Customer_Name nvarchar(250) NOT NULL,
	Line_Item int NOT NULL,
	Email nvarchar(250) NOT NULL,
	Phone nvarchar(20) NOT NULL,
	Address nvarchar(300) NOT NULL,
	Country nvarchar(100) NOT NULL,
	Province nvarchar(100) NOT NULL,
	City nvarchar(100) NOT NULL,
	Postal_Code nvarchar(10) NOT NULL,
	Customer_Code nvarchar(20) NOT NULL,
	Note nvarchar(255) NOT NULL,
	Created_User nvarchar(30),
	Created_Date DATETIME,
	CONSTRAINT PK_POS_Customer_History PRIMARY KEY NONCLUSTERED (Customer_ID ASC, Customer_Code ASC, Line_Item ASC),
)