IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_Set_Taxes_History]') AND type in (N'U'))
DROP TABLE [dbo].[POS_Set_Taxes_History]
GO

/****** Object:  Table [dbo].[POS_Set_Taxes_History]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_Set_Taxes_History
(
	Tax_ID nvarchar(20) NOT NULL, 
	Tax_Name nvarchar(100) NOT NULL,
	Line_Item int NOT NULL,
	Tax_Rate numeric(19,5) NOT NULL,
	Tax_Type int NOT NULL,
	Tax_Option int NOT NULL,
	Created_User nvarchar(30),
	Created_Date DATETIME,
	CONSTRAINT PK_POS_Set_Taxes_History PRIMARY KEY NONCLUSTERED (Tax_ID ASC, Line_Item ASC),
)