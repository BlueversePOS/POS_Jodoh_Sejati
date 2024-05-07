
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name = 'FK_POS_Set_PayTypes')
BEGIN
	ALTER TABLE POS_Set_PayTypes
	ADD CONSTRAINT FK_POS_Set_PayTypes
	FOREIGN KEY (Store_ID)
	REFERENCES POS_Set_Stores(Store_ID)
END;

ALTER TABLE [dbo].[POS_Set_PayTypes] DROP CONSTRAINT [FK_POS_Set_PayTypes]
GO

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name = 'FK_POS_Set_Site')
BEGIN
	ALTER TABLE POS_Set_Site
	ADD CONSTRAINT FK_POS_Set_Site
	FOREIGN KEY (Store_ID)
	REFERENCES POS_Set_Stores(Store_ID)
END;

ALTER TABLE [dbo].[POS_Set_Site] DROP CONSTRAINT [FK_POS_Set_Site]
GO

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name = 'FK_POS_Device')
BEGIN
	ALTER TABLE POS_Device
	ADD CONSTRAINT FK_POS_Device
	FOREIGN KEY (Store_ID)
	REFERENCES POS_Set_Stores(Store_ID)
END;

ALTER TABLE [dbo].[POS_Device] DROP CONSTRAINT [FK_POS_Device]
GO

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name = 'FK_POS_Set_SalesType')
BEGIN
	ALTER TABLE POS_Set_SalesType
	ADD CONSTRAINT FK_POS_Set_SalesType
	FOREIGN KEY (Store_ID)
	REFERENCES POS_Set_Stores(Store_ID)
END;

ALTER TABLE [dbo].[POS_Set_SalesType] DROP CONSTRAINT [FK_POS_Set_SalesType]
GO

ALTER TABLE [dbo].[POS_Set_Stores] DROP CONSTRAINT [PK_POS_Set_Stores]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_Set_Stores]') AND type in (N'U'))
DROP TABLE [dbo].[POS_Set_Stores]
GO

/****** Object:  Table [dbo].[POS_Set_Stores]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_Set_Stores
(
	Store_ID nvarchar(20) NOT NULL, 
	Store_Name nvarchar(100) NOT NULL,
	[Address] nvarchar(300) NOT NULL,
	Country nvarchar(100) NOT NULL,
	CountryName nvarchar(100) NOT NULL,
	Province nvarchar(100) NOT NULL,
	City nvarchar(100) NOT NULL,
	Postal_Code nvarchar(10) NOT NULL,
	Phone nvarchar(20) NOT NULL,
	[Description] nvarchar(255) NOT NULL,
	Created_User nvarchar(30),
	Created_Date DATETIME,
	Modified_User nvarchar(30),
	Modified_Date DATETIME,
	CONSTRAINT PK_POS_Set_Stores PRIMARY KEY NONCLUSTERED (Store_ID ASC),
)