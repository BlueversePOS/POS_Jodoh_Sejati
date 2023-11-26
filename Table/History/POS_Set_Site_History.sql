IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_Set_Site_History]') AND type in (N'U'))
DROP TABLE [dbo].[POS_Set_Site_History]
GO

/****** Object:  Table [dbo].[POS_Set_Site_History]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_Set_Site_History
(
	Site_ID nvarchar(20) NOT NULL, 
	Site_Name nvarchar(100) NOT NULL,
	Line_Item int NOT NULL,
	Store_ID nvarchar(20) NOT NULL, 
	Store_Name nvarchar(100) NOT NULL, 
	Created_User nvarchar(30),
	Created_Date DATETIME,
	CONSTRAINT PK_POS_Set_Site_History PRIMARY KEY NONCLUSTERED (Site_ID ASC, Line_Item ASC),
)