/****** Object:  UserDefinedTableType [dbo].[COMPTYPE]    Script Date: 26/05/2023 15:41:01 ******/
DROP TYPE [dbo].[COMPTYPE]
GO

/****** Object:  UserDefinedTableType [dbo].[COMPTYPE]    Script Date: 26/05/2023 15:41:01 ******/
CREATE TYPE [dbo].[COMPTYPE] AS TABLE(
	[Item_Number] nvarchar(20) NULL, 
	[Item_Quantity] numeric(19,5) NULL,
	[Item_Cost] numeric(19,5) NULL,
	[Item_Composite] int NULL
)
GO


