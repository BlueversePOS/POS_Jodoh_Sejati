IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_Employee_History]') AND type in (N'U'))
DROP TABLE [dbo].[POS_Employee_History]
GO

/****** Object:  Table [dbo].[POS_Employee_History]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_Employee_History
(
	Employee_ID nvarchar(20) NOT NULL, 
	Employee_Name nvarchar(250) NOT NULL,
	Line_Item int NOT NULL,
	Email nvarchar(250) NOT NULL,
	Phone nvarchar(20) NOT NULL,
	Role_ID nvarchar(20) NOT NULL,
	Created_User nvarchar(30),
	Created_Date DATETIME,
	CONSTRAINT PK_POS_Employee_History PRIMARY KEY NONCLUSTERED (Employee_ID ASC, Line_Item ASC),
)