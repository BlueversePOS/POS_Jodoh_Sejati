IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_Device_History]') AND type in (N'U'))
DROP TABLE [dbo].[POS_Device_History]
GO

/****** Object:  Table [dbo].[POS_Device]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_Device_History
(
	POS_Device_ID nvarchar(20) NOT NULL, 
	POS_Device_Name nvarchar(250) NOT NULL,
	Line_Item int NOT NULL,
	Store_ID nvarchar(20) NOT NULL, 
	Store_Name nvarchar(100) NOT NULL, 
	Created_User nvarchar(30),
	Created_Date DATETIME
	CONSTRAINT PK_POS_Device_History PRIMARY KEY NONCLUSTERED (POS_Device_ID ASC, Line_Item ASC),
)