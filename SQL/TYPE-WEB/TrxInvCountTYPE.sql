/****** Object:  UserDefinedTableType [dbo].[TrxInvCountTYPE]    Script Date: 26/05/2023 15:41:01 ******/
DROP TYPE [dbo].[TrxInvCountTYPE]
GO

/****** Object:  UserDefinedTableType [dbo].[TrxInvCountTYPE]    Script Date: 26/05/2023 15:41:01 ******/
CREATE TYPE [dbo].[TrxInvCountTYPE] AS TABLE(
	Lineitmseq int NOT NULL,
	Item_Number nvarchar(20) NOT NULL,
	Item_Description nvarchar(250) NOT NULL,
	Item_SKU nvarchar(20) NOT NULL,
	Expected_Stock numeric(19,5) NOT NULL,
	Counted_Stock numeric(19,5) NOT NULL,
	Different_Stock numeric(19,5) NOT NULL,
	Item_Cost numeric(19,5) NOT NULL,
	Item_Cost_Different numeric(19,5) NOT NULL
)
GO
/*
DROP PROC TRX_InvCount_Save
*/
