/****** Object:  UserDefinedTableType [dbo].[PLNCHRGS]    Script Date: 26/05/2023 15:41:01 ******/
DROP TYPE [dbo].[PLNCHRGS]
GO

/****** Object:  UserDefinedTableType [dbo].[PLNCHRGS]    Script Date: 26/05/2023 15:41:01 ******/
CREATE TYPE [dbo].[PLNCHRGS] AS TABLE(
	[CMS_PLANNING_ID] [char](21) NULL,
	[CMS_SO_NO] [char](31) NULL,
	[LNITMSEQ] [int] NULL,
	[CMS_SELECTED] [smallint] NULL,
	[ITEMNMBR] [char](31) NULL,
	[ITEMDESC] [char](101) NULL,
	[QUANTITY] [numeric](19, 5) NULL,
	[UNITCOST] [numeric](19, 5) NULL,
	[XTNDPRCE] [numeric](19, 5) NULL,
	[CMS_DESC] [char](251) NULL,
	[SUBTOTAL] [numeric](19, 5) NULL,
	[TAXDTLID] [char](15) NULL,
	[TXDTLPCT] [numeric](19, 5) NULL,
	[TAXAMNT] [numeric](19, 5) NULL,
	[TOTAL] [numeric](19, 5) NULL
)
GO


