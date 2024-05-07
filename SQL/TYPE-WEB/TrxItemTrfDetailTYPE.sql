drop proc TRX_TrfItem_SaveTemp

/****** Object:  UserDefinedTableType [dbo].[TrxItemTrfDetailTYPE]    Script Date: 26/05/2023 15:41:01 ******/
DROP TYPE [dbo].[TrxItemTrfDetailTYPE]
GO

/****** Object:  UserDefinedTableType [dbo].[TrxItemTrfDetailTYPE]    Script Date: 26/05/2023 15:41:01 ******/
CREATE TYPE [dbo].[TrxItemTrfDetailTYPE] AS TABLE(
	DOCDATE DATETIME NULL,
	Lineitmseq int NULL,
	Item_Number nvarchar(20) NULL,
	LineItem_Option int NULL,
	Item_Description nvarchar(250) NULL,
	Item_SKU nvarchar(10) NOT NULL,
	Source_Stock numeric(19,5) NULL,
	Dest_Stock numeric(19,5) NULL,
	Qty_Transfer numeric(19,5) NULL
)
GO
