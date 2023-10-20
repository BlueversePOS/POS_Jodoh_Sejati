IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_Employee]') AND type in (N'U'))
DROP TABLE [dbo].[POS_Employee]
GO

/****** Object:  Table [dbo].[POS_Employee]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_Employee
(
	Employee_ID nvarchar(20) NOT NULL, 
	Employee_Name nvarchar(250) NOT NULL,
	Email nvarchar(250) NOT NULL,
	Phone nvarchar(20) NOT NULL,
	Role_ID nvarchar(20) NOT NULL,
	Role_Name nvarchar(100) NOT NULL,
	Created_User nvarchar(30),
	Created_Date DATETIME,
	Modified_User nvarchar(30),
	Modified_Date DATETIME,
	CONSTRAINT PK_POS_Employee PRIMARY KEY NONCLUSTERED (Employee_ID),
	CONSTRAINT FK_POS_Employee FOREIGN KEY (Role_ID)
	REFERENCES POS_EmployeeRole (Role_ID)
	ON DELETE CASCADE
	ON UPDATE CASCADE
)