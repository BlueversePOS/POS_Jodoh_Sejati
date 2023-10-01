/****** Object:  UserDefinedTableType [dbo].[CTRCHRGS]    Script Date: 26/05/2023 15:41:01 ******/
DROP TYPE [dbo].[CTRCHRGS]
GO

/****** Object:  UserDefinedTableType [dbo].[CTRCHRGS]    Script Date: 26/05/2023 15:41:01 ******/
CREATE TYPE [dbo].[CTRCHRGS] AS TABLE(
	[CMS_CONTRACT_NO] [char](21) NULL,
	[LNITMSEQ] [int] NULL,
	[ITEMNMBR] [char](31) NULL,
	[ITEMDESC] [char](101) NULL,
	[QUANTITY] [numeric](19, 5) NULL,
	[CHRGAMNT] [numeric](19, 5) NULL,
	[TAXAMNT] [numeric](19, 5) NULL,
	[SUBTOTAL] [numeric](19, 5) NULL,
	[TOTAL] [numeric](19, 5) NULL
)
GO


