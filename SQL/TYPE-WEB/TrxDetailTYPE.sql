/****** Object:  UserDefinedTableType [dbo].[TrxDetailTYPE]    Script Date: 26/05/2023 15:41:01 ******/
DROP TYPE [dbo].[TrxDetailTYPE]
GO

/****** Object:  UserDefinedTableType [dbo].[TrxDetailTYPE]    Script Date: 26/05/2023 15:41:01 ******/
CREATE TYPE [dbo].[TrxDetailTYPE] AS TABLE(
	DOCNUMBER nvarchar(20) NULL,
	DOCTYPE int NULL,
	DOCDATE DATETIME NULL,
	Lineitmseq int NULL,
	Item_Number nvarchar(20) NULL, 
	Item_Description nvarchar(500) NULL, 
	LineItem_Option numeric(19, 5) NULL,
	Quantity numeric(19,5) NULL,
	UofM nvarchar(20) NULL, 
	Item_Price numeric(19,5) NULL,
	Item_Cost numeric(19,5) NULL,
	Store_ID nvarchar(20) NULL, 
	Site_ID nvarchar(20) NULL, 
	SalesType_ID nvarchar(20) NULL, 
	Discount_ID nvarchar(20) NULL, 
	Discount_Amount numeric(19,5) NULL,
	Notes nvarchar(200) NULL, 
	POS_Device_ID nvarchar(20) NULL, 
	POS_Version nvarchar(20) NULL
)
GO


