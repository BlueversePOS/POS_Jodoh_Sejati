IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_Discount_History]') AND type in (N'U'))
DROP TABLE [dbo].[POS_Discount_History]
GO

/****** Object:  Table [dbo].[POS_Discount]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_Discount_History
(
	Discount_ID nvarchar(20) NOT NULL, 
	Discount_Name nvarchar(250) NOT NULL,
	Line_Item int NOT NULL,
	Discount_Type int NOT NULL,
	Discount_Value numeric(19,5) NOT NULL,
	Restricted_Access int NOT NULL,
	Created_User nvarchar(30),
	Created_Date DATETIME,
	CONSTRAINT PK_POS_Discount_History PRIMARY KEY NONCLUSTERED (Discount_ID ASC, Line_Item ASC),
)