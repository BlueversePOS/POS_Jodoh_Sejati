/****** Object:  UserDefinedTableType [dbo].[PLNDTL]    Script Date: 26/05/2023 15:41:01 ******/
DROP TYPE [dbo].[PLNDTL]
GO

/****** Object:  UserDefinedTableType [dbo].[PLNDTL]    Script Date: 26/05/2023 15:41:01 ******/
CREATE TYPE [dbo].[PLNDTL] AS TABLE(
	[CMS_PLANNING_ID] [char](21) NULL,
	[CMS_SO_NO] [char](31) NULL,
	[CMS_QUOTATION_NO] [char](31) NULL,
	[LNITMSEQ] [int] NULL,
	[LNSEQNBR] [numeric](19, 5) NULL,
	[CMS_VEHICLE] [char](21) NULL,
	[CMS_NOPOL] [char](11) NULL,
	[CMS_NO_SURATJALAN] [char](51) NULL,
	[CMS_SHIPPING_LINES] [char](51) NULL,
	[CMS_SHIP_ID] [char](11) NULL,
	[CMS_SHIP_NAME] [char](51) NULL,
	[CMS_VOYAGE] [char](51) NULL,
	[CMS_DEPARTURE_DATE] [datetime] NULL,
	[CMS_ARRIVING_DATE] [datetime] NULL,
	[CMS_TRAIN_NAME] [char](51) NULL,
	[CMS_AGENT_TYPE] [smallint] NULL,
	[CMS_STUFF_LOCATION] [char](101) NULL,
	[VENDORID] [char](15) NULL,
	[VENDNAME] [char](65) NULL,
	[CMS_FLAGGING] [smallint] NULL,
	[CMS_CONT_NO] [char](25) NULL,
	[CMS_SEAL_CONTAINER] [char](101) NULL,
	[CMS_CONT_UKURAN_ID] [char](25) NULL,
	[CMS_CONT_UKURAN] [char](51) NULL,
	[DEPRTMNT] [char](7) NULL,
	[CMS_OUID] [char](21) NULL,
	[UOMSCHDL] [char](11) NULL,
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


