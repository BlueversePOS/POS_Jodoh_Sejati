/****** Object:  UserDefinedTableType [dbo].[PAYTYPE]    Script Date: 26/05/2023 15:41:01 ******/
DROP TYPE [dbo].[PAYTYPE]
GO

/****** Object:  UserDefinedTableType [dbo].[PAYTYPE]    Script Date: 26/05/2023 15:41:01 ******/
CREATE TYPE [dbo].[PAYTYPE] AS TABLE(
	LineItem int NOT NULL,
	AllStore int NOT NULL,
	Store_ID nvarchar(20) NOT NULL, 
	Store_Name nvarchar(100)
)
GO
