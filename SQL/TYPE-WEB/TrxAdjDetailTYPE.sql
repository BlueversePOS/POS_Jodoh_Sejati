/****** Object:  UserDefinedTableType [dbo].[TrxAdjDetailTYPE]    Script Date: 26/05/2023 15:41:01 ******/
DROP TYPE [dbo].[TrxAdjDetailTYPE]
GO

/****** Object:  UserDefinedTableType [dbo].[TrxAdjDetailTYPE]    Script Date: 26/05/2023 15:41:01 ******/
CREATE TYPE [dbo].[TrxAdjDetailTYPE] AS TABLE(
	DOCDATE DATETIME NULL,
	Reason nvarchar(30) NULL,
	Lineitmseq int NULL,
	Item_Number nvarchar(20) NULL,
	LineItem_Option numeric(19,5) NULL,
	Item_Description nvarchar(250) NULL,
	Qty_Stock numeric(19,5) NULL,
	Qty_Add_Stock numeric(19,5) NULL,
	Qty_Remove_Stock numeric(19,5) NULL,
	Item_Cost numeric(19,5) NULL,
	Qty_After_Stock numeric(19,5) NULL,
	Expected_Stock numeric(19,5) NULL,
	Counted_Stock numeric(19,5) NULL
)
GO
/*
DROP PROC TRX_Adjustment_Save
*/
