IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_Discount]') AND type in (N'U'))
DROP TABLE [dbo].[POS_Discount]
GO

/****** Object:  Table [dbo].[POS_Discount]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_Discount
(
	Discount_ID nvarchar(20) NOT NULL, 
	Discount_Name nvarchar(250) NOT NULL,
	[TYPE] int NOT NULL,
	Discount_Type int NOT NULL,
	Discount_Value numeric(19,5) NOT NULL,
	Restricted_Access int NOT NULL,
	Created_User nvarchar(30),
	Created_Date DATETIME,
	Modified_User nvarchar(30),
	Modified_Date DATETIME,
	CONSTRAINT PK_POS_Discount PRIMARY KEY NONCLUSTERED (Discount_ID),
)