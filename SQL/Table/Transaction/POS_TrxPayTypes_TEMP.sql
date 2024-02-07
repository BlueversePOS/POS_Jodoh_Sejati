IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_TrxPayTypes_TEMP]') AND type in (N'U'))
DROP TABLE [dbo].[POS_TrxPayTypes_TEMP]
GO

/****** Object:  Table [dbo].[POS_TrxPayTypes_TEMP]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_TrxPayTypes_TEMP
(
	DOCNUMBER nvarchar(20) NOT NULL, 
	DOCTYPE int NOT NULL,
	DOCDATE DATETIME NOT NULL,
	Lnitmseq int NOT NULL,
	Payment_ID nvarchar(20) NOT NULL,
	Payment_Type nvarchar(20) NOT NULL,
	ORIGTOTAL numeric(19,5) NOT NULL,
	SUBTOTAL numeric(19,5) NOT NULL,
	Amount_Tendered numeric(19,5) NOT NULL,
	Change_Amount numeric(19,5) NOT NULL,
	Store_ID nvarchar(20) NOT NULL, 
	POS_Device_ID nvarchar(20) NOT NULL, 
	POS_Version nvarchar(20) NOT NULL, 
	Created_User nvarchar(30) NOT NULL,
	Created_Date DATETIME NOT NULL,
	Created_time DATETIME,
	Modified_User nvarchar(30) NOT NULL,
	Modified_Date DATETIME NOT NULL,
	Modified_time DATETIME NOT NULL,
	CONSTRAINT PK_POS_TrxPayTypes_TEMP PRIMARY KEY NONCLUSTERED (DOCNUMBER ASC)
)

