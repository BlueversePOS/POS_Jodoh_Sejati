/****** Object:  UserDefinedTableType [dbo].[CTRROUTE]    Script Date: 26/05/2023 15:41:01 ******/
DROP TYPE [dbo].[CTRROUTE]
GO

/****** Object:  UserDefinedTableType [dbo].[CTRROUTE]    Script Date: 26/05/2023 15:41:01 ******/
CREATE TYPE [dbo].[CTRROUTE] AS TABLE(
	[CMS_CONTRACT_NO] [char](21) NULL,
	[LNITMSEQ] [int] NULL,
	[LNSEQNBR] [numeric](19, 5) NULL,
	[CMS_ROUTEID_FROM] [char](21) NULL,
	[CMS_ROUTEID_TO] [char](21) NULL,
	[CMS_CONT_UKURAN_ID] [char](25) NULL,
	[CMS_CONT_UKURAN] [char](51) NULL,
	[CMS_KETERANGAN] [char](501) NULL,
	[CMS_STUFF_LOCATION] [char](101) NULL,
	[QUANTITY] [numeric](19, 5) NULL,
	[UNITPRCE] [numeric](19, 5) NULL,
	[XTNDPRCE] [numeric](19, 5) NULL,
	[SUBTOTAL] [numeric](19, 5) NULL,
	[TAXDTLID] [char](15) NULL,
	[TXDTLPCT] [numeric](19, 5) NULL,
	[TAXAMNT] [numeric](19, 5) NULL,
	[TOTAL] [numeric](19, 5) NULL
)
GO


