/****** Object:  UserDefinedTableType [dbo].[VARTYPE]    Script Date: 26/05/2023 15:41:01 ******/
DROP TYPE [dbo].[VARTYPE]
GO

/****** Object:  UserDefinedTableType [dbo].[VARTYPE]    Script Date: 26/05/2023 15:41:01 ******/
CREATE TYPE [dbo].[VARTYPE] AS TABLE(
	[Item_Number] nvarchar(20) NULL,
	[LineItem_Option] numeric(19,5) NULL,
	[CB_Available] int NULL,
	[Option_ID] nvarchar(50) NULL,
	[Option_Name] nvarchar(50) NULL,
	[LineItem_Variant] numeric(19,5) NULL,
	[Variant_Name] nvarchar(50) NULL,
	[Item_Price] numeric(19,5) NULL,
	[Item_Cost] numeric(19,5) NULL,
	[InStock] int NULL,
	[LowStock] int NULL,
	[OptimalStock] int NULL,
	[Item_SKU] nvarchar(10) NULL,
	[Item_Barcode] nvarchar(MAX) NULL
)
GO


