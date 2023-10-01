/****** Object:  UserDefinedTableType [dbo].[PLNCOST]    Script Date: 26/05/2023 15:41:01 ******/
DROP TYPE [dbo].[PLNCOST]
GO

/****** Object:  UserDefinedTableType [dbo].[PLNCOST]    Script Date: 26/05/2023 15:41:01 ******/
CREATE TYPE [dbo].[PLNCOST] AS TABLE(
	[CMS_PLANNING_ID] [char](21) NULL,
	[CMS_SO_NO] [char](31) NULL,
	[LNITMSEQ] [int] NULL,
	[CMS_SELECTED] [smallint] NULL,
	[ITEMNMBR] [char](31) NULL,
	[ITEMDESC] [char](101) NULL,
	[CURNCYID] [char](15) NULL,
	[CMS_EXPENSES_NO] [char](21) NULL,
	[CMS_BANKTRX_NO] [char](21) NULL,
	[CHEKBKID] [char](15) NULL,
	[QUANTITY] [numeric](19, 5) NULL,
	[UNITCOST] [numeric](19, 5) NULL,
	[XTNDPRCE] [numeric](19, 5) NULL,
	[CMS_DESC] [char](251) NULL,
	[TOTAL] [numeric](19, 5) NULL
)
GO


