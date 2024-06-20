USE [Blueverse_POS]
GO
ALTER TABLE [dbo].[POS_TrxItemTrf_HeaderPOST] DROP CONSTRAINT [FK_POS_TrxItemTrf_HeaderPOSTSrc]
GO
ALTER TABLE [dbo].[POS_TrxItemTrf_HeaderPOST] DROP CONSTRAINT [FK_POS_TrxItemTrf_HeaderPOSTDst]
GO
ALTER TABLE [dbo].[POS_TrxAdjustment_Header] DROP CONSTRAINT [FK_POS_TrxAdjustmentSites]
GO
ALTER TABLE [dbo].[POS_Set_Site] DROP CONSTRAINT [FK_POS_Set_Site]
GO
ALTER TABLE [dbo].[POS_ItemInventory] DROP CONSTRAINT [FK_POS_ItemInventorySite]
GO
ALTER TABLE [dbo].[POS_Item] DROP CONSTRAINT [FK_POS_Item_Cat]
GO
ALTER TABLE [dbo].[POS_Employee] DROP CONSTRAINT [FK_POS_Employee]
GO
ALTER TABLE [dbo].[POS_Device] DROP CONSTRAINT [FK_POS_Device]
GO
/****** Object:  Index [PK_POS_TrxItemTrf_HeaderTEMP]    Script Date: 3/5/2024 11:03:05 PM ******/
ALTER TABLE [dbo].[POS_TrxItemTrf_HeaderTEMP] DROP CONSTRAINT [PK_POS_TrxItemTrf_HeaderTEMP]
GO
/****** Object:  Index [PK_POS_TrxItemTrf_HeaderPOST]    Script Date: 3/5/2024 11:03:05 PM ******/
ALTER TABLE [dbo].[POS_TrxItemTrf_HeaderPOST] DROP CONSTRAINT [PK_POS_TrxItemTrf_HeaderPOST]
GO
/****** Object:  Index [PK_POS_TrxItemTrf_HeaderHIST]    Script Date: 3/5/2024 11:03:05 PM ******/
ALTER TABLE [dbo].[POS_TrxItemTrf_HeaderHIST] DROP CONSTRAINT [PK_POS_TrxItemTrf_HeaderHIST]
GO
/****** Object:  Index [PK_POS_TrxItemTrf_DetailTEMP]    Script Date: 3/5/2024 11:03:05 PM ******/
ALTER TABLE [dbo].[POS_TrxItemTrf_DetailTEMP] DROP CONSTRAINT [PK_POS_TrxItemTrf_DetailTEMP]
GO
/****** Object:  Index [PK_POS_TrxItemTrf_DetailPOST]    Script Date: 3/5/2024 11:03:05 PM ******/
ALTER TABLE [dbo].[POS_TrxItemTrf_DetailPOST] DROP CONSTRAINT [PK_POS_TrxItemTrf_DetailPOST]
GO
/****** Object:  Index [PK_POS_TrxItemTrf_DetailHIST]    Script Date: 3/5/2024 11:03:05 PM ******/
ALTER TABLE [dbo].[POS_TrxItemTrf_DetailHIST] DROP CONSTRAINT [PK_POS_TrxItemTrf_DetailHIST]
GO
/****** Object:  Index [PK_POS_TrxAdjustment_Header]    Script Date: 3/5/2024 11:03:05 PM ******/
ALTER TABLE [dbo].[POS_TrxAdjustment_Header] DROP CONSTRAINT [PK_POS_TrxAdjustment_Header]
GO
/****** Object:  Index [PK_POS_TrxAdjustment_Detail]    Script Date: 3/5/2024 11:03:05 PM ******/
ALTER TABLE [dbo].[POS_TrxAdjustment_Detail] DROP CONSTRAINT [PK_POS_TrxAdjustment_Detail]
GO
/****** Object:  Index [PK_POS_Set_Taxes_History]    Script Date: 3/5/2024 11:03:05 PM ******/
ALTER TABLE [dbo].[POS_Set_Taxes_History] DROP CONSTRAINT [PK_POS_Set_Taxes_History]
GO
/****** Object:  Index [PK_POS_Set_Taxes]    Script Date: 3/5/2024 11:03:05 PM ******/
ALTER TABLE [dbo].[POS_Set_Taxes] DROP CONSTRAINT [PK_POS_Set_Taxes]
GO
/****** Object:  Index [PK_POS_Set_Site_History]    Script Date: 3/5/2024 11:03:05 PM ******/
ALTER TABLE [dbo].[POS_Set_Site_History] DROP CONSTRAINT [PK_POS_Set_Site_History]
GO
/****** Object:  Index [PK_POS_Set_Site]    Script Date: 3/5/2024 11:03:05 PM ******/
ALTER TABLE [dbo].[POS_Set_Site] DROP CONSTRAINT [PK_POS_Set_Site]
GO
/****** Object:  Index [PK_POS_ItemVariant_History]    Script Date: 3/5/2024 11:03:05 PM ******/
ALTER TABLE [dbo].[POS_ItemVariant_History] DROP CONSTRAINT [PK_POS_ItemVariant_History]
GO
/****** Object:  Index [PK_POS_ItemVariant]    Script Date: 3/5/2024 11:03:05 PM ******/
ALTER TABLE [dbo].[POS_ItemVariant] DROP CONSTRAINT [PK_POS_ItemVariant]
GO
/****** Object:  Index [PK_POS_ItemInventory_History]    Script Date: 3/5/2024 11:03:05 PM ******/
ALTER TABLE [dbo].[POS_ItemInventory_History] DROP CONSTRAINT [PK_POS_ItemInventory_History]
GO
/****** Object:  Index [PK_POS_ItemInventory]    Script Date: 3/5/2024 11:03:05 PM ******/
ALTER TABLE [dbo].[POS_ItemInventory] DROP CONSTRAINT [PK_POS_ItemInventory]
GO
/****** Object:  Index [PK_POS_Item_History]    Script Date: 3/5/2024 11:03:05 PM ******/
ALTER TABLE [dbo].[POS_Item_History] DROP CONSTRAINT [PK_POS_Item_History]
GO
/****** Object:  Index [PK_POS_Item]    Script Date: 3/5/2024 11:03:05 PM ******/
ALTER TABLE [dbo].[POS_Item] DROP CONSTRAINT [PK_POS_Item]
GO
/****** Object:  Index [PK_POS_EmployeeRole_History]    Script Date: 3/5/2024 11:03:05 PM ******/
ALTER TABLE [dbo].[POS_EmployeeRole_History] DROP CONSTRAINT [PK_POS_EmployeeRole_History]
GO
/****** Object:  Index [PK_POS_EmployeeRole]    Script Date: 3/5/2024 11:03:05 PM ******/
ALTER TABLE [dbo].[POS_EmployeeRole] DROP CONSTRAINT [PK_POS_EmployeeRole]
GO
/****** Object:  Index [PK_POS_Employee_History]    Script Date: 3/5/2024 11:03:05 PM ******/
ALTER TABLE [dbo].[POS_Employee_History] DROP CONSTRAINT [PK_POS_Employee_History]
GO
/****** Object:  Index [PK_POS_Employee]    Script Date: 3/5/2024 11:03:05 PM ******/
ALTER TABLE [dbo].[POS_Employee] DROP CONSTRAINT [PK_POS_Employee]
GO
/****** Object:  Index [PK_POS_Discount_History]    Script Date: 3/5/2024 11:03:05 PM ******/
ALTER TABLE [dbo].[POS_Discount_History] DROP CONSTRAINT [PK_POS_Discount_History]
GO
/****** Object:  Index [PK_POS_Discount]    Script Date: 3/5/2024 11:03:05 PM ******/
ALTER TABLE [dbo].[POS_Discount] DROP CONSTRAINT [PK_POS_Discount]
GO
/****** Object:  Index [PK_POS_Device_History]    Script Date: 3/5/2024 11:03:05 PM ******/
ALTER TABLE [dbo].[POS_Device_History] DROP CONSTRAINT [PK_POS_Device_History]
GO
/****** Object:  Index [PK_POS_Device]    Script Date: 3/5/2024 11:03:05 PM ******/
ALTER TABLE [dbo].[POS_Device] DROP CONSTRAINT [PK_POS_Device]
GO
/****** Object:  Index [PK_POS_Customer_History]    Script Date: 3/5/2024 11:03:05 PM ******/
ALTER TABLE [dbo].[POS_Customer_History] DROP CONSTRAINT [PK_POS_Customer_History]
GO
/****** Object:  Index [PK_POS_Customer]    Script Date: 3/5/2024 11:03:05 PM ******/
ALTER TABLE [dbo].[POS_Customer] DROP CONSTRAINT [PK_POS_Customer]
GO
/****** Object:  Index [PK_POS_CompositeItem_History]    Script Date: 3/5/2024 11:03:05 PM ******/
ALTER TABLE [dbo].[POS_CompositeItem_History] DROP CONSTRAINT [PK_POS_CompositeItem_History]
GO
/****** Object:  Index [PK_POS_CompositeItem]    Script Date: 3/5/2024 11:03:05 PM ******/
ALTER TABLE [dbo].[POS_CompositeItem] DROP CONSTRAINT [PK_POS_CompositeItem]
GO
/****** Object:  Index [PK_POS_CategoryItem_History]    Script Date: 3/5/2024 11:03:05 PM ******/
ALTER TABLE [dbo].[POS_CategoryItem_History] DROP CONSTRAINT [PK_POS_CategoryItem_History]
GO
/****** Object:  Index [PK_POS_CategoryItem]    Script Date: 3/5/2024 11:03:05 PM ******/
ALTER TABLE [dbo].[POS_CategoryItem] DROP CONSTRAINT [PK_POS_CategoryItem]
GO
/****** Object:  Table [dbo].[POS_TrxItemTrf_HeaderTEMP]    Script Date: 3/5/2024 11:03:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_TrxItemTrf_HeaderTEMP]') AND type in (N'U'))
DROP TABLE [dbo].[POS_TrxItemTrf_HeaderTEMP]
GO
/****** Object:  Table [dbo].[POS_TrxItemTrf_HeaderPOST]    Script Date: 3/5/2024 11:03:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_TrxItemTrf_HeaderPOST]') AND type in (N'U'))
DROP TABLE [dbo].[POS_TrxItemTrf_HeaderPOST]
GO
/****** Object:  Table [dbo].[POS_TrxItemTrf_HeaderHIST]    Script Date: 3/5/2024 11:03:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_TrxItemTrf_HeaderHIST]') AND type in (N'U'))
DROP TABLE [dbo].[POS_TrxItemTrf_HeaderHIST]
GO
/****** Object:  Table [dbo].[POS_TrxItemTrf_DetailTEMP]    Script Date: 3/5/2024 11:03:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_TrxItemTrf_DetailTEMP]') AND type in (N'U'))
DROP TABLE [dbo].[POS_TrxItemTrf_DetailTEMP]
GO
/****** Object:  Table [dbo].[POS_TrxItemTrf_DetailPOST]    Script Date: 3/5/2024 11:03:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_TrxItemTrf_DetailPOST]') AND type in (N'U'))
DROP TABLE [dbo].[POS_TrxItemTrf_DetailPOST]
GO
/****** Object:  Table [dbo].[POS_TrxItemTrf_DetailHIST]    Script Date: 3/5/2024 11:03:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_TrxItemTrf_DetailHIST]') AND type in (N'U'))
DROP TABLE [dbo].[POS_TrxItemTrf_DetailHIST]
GO
/****** Object:  Table [dbo].[POS_TrxAdjustment_HeaderHIST]    Script Date: 3/5/2024 11:03:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_TrxAdjustment_HeaderHIST]') AND type in (N'U'))
DROP TABLE [dbo].[POS_TrxAdjustment_HeaderHIST]
GO
/****** Object:  Table [dbo].[POS_TrxAdjustment_Header]    Script Date: 3/5/2024 11:03:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_TrxAdjustment_Header]') AND type in (N'U'))
DROP TABLE [dbo].[POS_TrxAdjustment_Header]
GO
/****** Object:  Table [dbo].[POS_TrxAdjustment_DetailHIST]    Script Date: 3/5/2024 11:03:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_TrxAdjustment_DetailHIST]') AND type in (N'U'))
DROP TABLE [dbo].[POS_TrxAdjustment_DetailHIST]
GO
/****** Object:  Table [dbo].[POS_TrxAdjustment_Detail]    Script Date: 3/5/2024 11:03:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_TrxAdjustment_Detail]') AND type in (N'U'))
DROP TABLE [dbo].[POS_TrxAdjustment_Detail]
GO
/****** Object:  Table [dbo].[POS_Set_Taxes_History]    Script Date: 3/5/2024 11:03:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_Set_Taxes_History]') AND type in (N'U'))
DROP TABLE [dbo].[POS_Set_Taxes_History]
GO
/****** Object:  Table [dbo].[POS_Set_Taxes]    Script Date: 3/5/2024 11:03:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_Set_Taxes]') AND type in (N'U'))
DROP TABLE [dbo].[POS_Set_Taxes]
GO
/****** Object:  Table [dbo].[POS_Set_Site_History]    Script Date: 3/5/2024 11:03:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_Set_Site_History]') AND type in (N'U'))
DROP TABLE [dbo].[POS_Set_Site_History]
GO
/****** Object:  Table [dbo].[POS_Set_Site]    Script Date: 3/5/2024 11:03:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_Set_Site]') AND type in (N'U'))
DROP TABLE [dbo].[POS_Set_Site]
GO
/****** Object:  Table [dbo].[POS_ItemVariant_History]    Script Date: 3/5/2024 11:03:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_ItemVariant_History]') AND type in (N'U'))
DROP TABLE [dbo].[POS_ItemVariant_History]
GO
/****** Object:  Table [dbo].[POS_ItemVariant]    Script Date: 3/5/2024 11:03:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_ItemVariant]') AND type in (N'U'))
DROP TABLE [dbo].[POS_ItemVariant]
GO
/****** Object:  Table [dbo].[POS_ItemInventory_History]    Script Date: 3/5/2024 11:03:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_ItemInventory_History]') AND type in (N'U'))
DROP TABLE [dbo].[POS_ItemInventory_History]
GO
/****** Object:  Table [dbo].[POS_ItemInventory]    Script Date: 3/5/2024 11:03:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_ItemInventory]') AND type in (N'U'))
DROP TABLE [dbo].[POS_ItemInventory]
GO
/****** Object:  Table [dbo].[POS_Item_History]    Script Date: 3/5/2024 11:03:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_Item_History]') AND type in (N'U'))
DROP TABLE [dbo].[POS_Item_History]
GO
/****** Object:  Table [dbo].[POS_Item]    Script Date: 3/5/2024 11:03:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_Item]') AND type in (N'U'))
DROP TABLE [dbo].[POS_Item]
GO
/****** Object:  Table [dbo].[POS_EmployeeRole_History]    Script Date: 3/5/2024 11:03:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_EmployeeRole_History]') AND type in (N'U'))
DROP TABLE [dbo].[POS_EmployeeRole_History]
GO
/****** Object:  Table [dbo].[POS_EmployeeRole]    Script Date: 3/5/2024 11:03:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_EmployeeRole]') AND type in (N'U'))
DROP TABLE [dbo].[POS_EmployeeRole]
GO
/****** Object:  Table [dbo].[POS_Employee_History]    Script Date: 3/5/2024 11:03:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_Employee_History]') AND type in (N'U'))
DROP TABLE [dbo].[POS_Employee_History]
GO
/****** Object:  Table [dbo].[POS_Employee]    Script Date: 3/5/2024 11:03:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_Employee]') AND type in (N'U'))
DROP TABLE [dbo].[POS_Employee]
GO
/****** Object:  Table [dbo].[POS_Discount_History]    Script Date: 3/5/2024 11:03:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_Discount_History]') AND type in (N'U'))
DROP TABLE [dbo].[POS_Discount_History]
GO
/****** Object:  Table [dbo].[POS_Discount]    Script Date: 3/5/2024 11:03:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_Discount]') AND type in (N'U'))
DROP TABLE [dbo].[POS_Discount]
GO
/****** Object:  Table [dbo].[POS_Device_History]    Script Date: 3/5/2024 11:03:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_Device_History]') AND type in (N'U'))
DROP TABLE [dbo].[POS_Device_History]
GO
/****** Object:  Table [dbo].[POS_Device]    Script Date: 3/5/2024 11:03:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_Device]') AND type in (N'U'))
DROP TABLE [dbo].[POS_Device]
GO
/****** Object:  Table [dbo].[POS_Customer_History]    Script Date: 3/5/2024 11:03:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_Customer_History]') AND type in (N'U'))
DROP TABLE [dbo].[POS_Customer_History]
GO
/****** Object:  Table [dbo].[POS_Customer]    Script Date: 3/5/2024 11:03:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_Customer]') AND type in (N'U'))
DROP TABLE [dbo].[POS_Customer]
GO
/****** Object:  Table [dbo].[POS_CompositeItem_History]    Script Date: 3/5/2024 11:03:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_CompositeItem_History]') AND type in (N'U'))
DROP TABLE [dbo].[POS_CompositeItem_History]
GO
/****** Object:  Table [dbo].[POS_CompositeItem]    Script Date: 3/5/2024 11:03:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_CompositeItem]') AND type in (N'U'))
DROP TABLE [dbo].[POS_CompositeItem]
GO
/****** Object:  Table [dbo].[POS_CategoryItem_History]    Script Date: 3/5/2024 11:03:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_CategoryItem_History]') AND type in (N'U'))
DROP TABLE [dbo].[POS_CategoryItem_History]
GO
/****** Object:  Table [dbo].[POS_CategoryItem]    Script Date: 3/5/2024 11:03:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_CategoryItem]') AND type in (N'U'))
DROP TABLE [dbo].[POS_CategoryItem]
GO
/****** Object:  Table [dbo].[POS_CategoryItem]    Script Date: 3/5/2024 11:03:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POS_CategoryItem](
	[Category_ID] [nvarchar](20) NOT NULL,
	[Category_Name] [nvarchar](250) NOT NULL,
	[Category_Color] [nvarchar](20) NOT NULL,
	[Created_User] [nvarchar](30) NULL,
	[Created_Date] [datetime] NULL,
	[Modified_User] [nvarchar](30) NULL,
	[Modified_Date] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[POS_CategoryItem_History]    Script Date: 3/5/2024 11:03:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POS_CategoryItem_History](
	[Category_ID] [nvarchar](20) NOT NULL,
	[Line_Item] [int] NOT NULL,
	[Category_Name] [nvarchar](250) NOT NULL,
	[Category_Color] [nvarchar](20) NOT NULL,
	[Created_User] [nvarchar](30) NULL,
	[Created_Date] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[POS_CompositeItem]    Script Date: 3/5/2024 11:03:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POS_CompositeItem](
	[Item_Number] [nvarchar](20) NOT NULL,
	[Item_Quantity] [numeric](19, 5) NOT NULL,
	[Item_Cost] [numeric](19, 5) NOT NULL,
	[Item_Composite] [int] NOT NULL,
	[Created_User] [nvarchar](30) NULL,
	[Created_Date] [datetime] NULL,
	[Modified_User] [nvarchar](30) NULL,
	[Modified_Date] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[POS_CompositeItem_History]    Script Date: 3/5/2024 11:03:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POS_CompositeItem_History](
	[Item_Number] [nvarchar](20) NOT NULL,
	[Line_Item] [int] NOT NULL,
	[Item_Quantity] [numeric](19, 5) NOT NULL,
	[Item_Cost] [numeric](19, 5) NOT NULL,
	[Item_Composite] [int] NOT NULL,
	[Created_User] [nvarchar](30) NULL,
	[Created_Date] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[POS_Customer]    Script Date: 3/5/2024 11:03:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POS_Customer](
	[Customer_ID] [nvarchar](20) NOT NULL,
	[Customer_Name] [nvarchar](250) NOT NULL,
	[Email] [nvarchar](250) NOT NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[Address] [nvarchar](300) NOT NULL,
	[Country] [nvarchar](100) NOT NULL,
	[Province] [nvarchar](100) NOT NULL,
	[City] [nvarchar](100) NOT NULL,
	[Postal_Code] [nvarchar](10) NOT NULL,
	[Customer_Code] [nvarchar](20) NOT NULL,
	[Note] [nvarchar](255) NOT NULL,
	[Created_User] [nvarchar](30) NULL,
	[Created_Date] [datetime] NULL,
	[Modified_User] [nvarchar](30) NULL,
	[Modified_Date] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[POS_Customer_History]    Script Date: 3/5/2024 11:03:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POS_Customer_History](
	[Customer_ID] [nvarchar](20) NOT NULL,
	[Customer_Name] [nvarchar](250) NOT NULL,
	[Line_Item] [int] NOT NULL,
	[Email] [nvarchar](250) NOT NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[Address] [nvarchar](300) NOT NULL,
	[Country] [nvarchar](100) NOT NULL,
	[Province] [nvarchar](100) NOT NULL,
	[City] [nvarchar](100) NOT NULL,
	[Postal_Code] [nvarchar](10) NOT NULL,
	[Customer_Code] [nvarchar](20) NOT NULL,
	[Note] [nvarchar](255) NOT NULL,
	[Created_User] [nvarchar](30) NULL,
	[Created_Date] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[POS_Device]    Script Date: 3/5/2024 11:03:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POS_Device](
	[POS_Device_ID] [nvarchar](20) NOT NULL,
	[POS_Device_Name] [nvarchar](250) NOT NULL,
	[Store_ID] [nvarchar](20) NOT NULL,
	[Store_Name] [nvarchar](100) NOT NULL,
	[Created_User] [nvarchar](30) NULL,
	[Created_Date] [datetime] NULL,
	[Modified_User] [nvarchar](30) NULL,
	[Modified_Date] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[POS_Device_History]    Script Date: 3/5/2024 11:03:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POS_Device_History](
	[POS_Device_ID] [nvarchar](20) NOT NULL,
	[POS_Device_Name] [nvarchar](250) NOT NULL,
	[Line_Item] [int] NOT NULL,
	[Store_ID] [nvarchar](20) NOT NULL,
	[Store_Name] [nvarchar](100) NOT NULL,
	[Created_User] [nvarchar](30) NULL,
	[Created_Date] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[POS_Discount]    Script Date: 3/5/2024 11:03:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POS_Discount](
	[Discount_ID] [nvarchar](20) NOT NULL,
	[Discount_Name] [nvarchar](250) NOT NULL,
	[Discount_Type] [int] NOT NULL,
	[Discount_Value] [numeric](19, 5) NOT NULL,
	[Restricted_Access] [int] NOT NULL,
	[Created_User] [nvarchar](30) NULL,
	[Created_Date] [datetime] NULL,
	[Modified_User] [nvarchar](30) NULL,
	[Modified_Date] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[POS_Discount_History]    Script Date: 3/5/2024 11:03:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POS_Discount_History](
	[Discount_ID] [nvarchar](20) NOT NULL,
	[Discount_Name] [nvarchar](250) NOT NULL,
	[Line_Item] [int] NOT NULL,
	[Discount_Type] [int] NOT NULL,
	[Discount_Value] [numeric](19, 5) NOT NULL,
	[Restricted_Access] [int] NOT NULL,
	[Created_User] [nvarchar](30) NULL,
	[Created_Date] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[POS_Employee]    Script Date: 3/5/2024 11:03:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POS_Employee](
	[Employee_ID] [nvarchar](20) NOT NULL,
	[Employee_Name] [nvarchar](250) NOT NULL,
	[Email] [nvarchar](250) NOT NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[Role_ID] [nvarchar](20) NOT NULL,
	[Created_User] [nvarchar](30) NULL,
	[Created_Date] [datetime] NULL,
	[Modified_User] [nvarchar](30) NULL,
	[Modified_Date] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[POS_Employee_History]    Script Date: 3/5/2024 11:03:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POS_Employee_History](
	[Employee_ID] [nvarchar](20) NOT NULL,
	[Employee_Name] [nvarchar](250) NOT NULL,
	[Line_Item] [int] NOT NULL,
	[Email] [nvarchar](250) NOT NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[Role_ID] [nvarchar](20) NOT NULL,
	[Created_User] [nvarchar](30) NULL,
	[Created_Date] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[POS_EmployeeRole]    Script Date: 3/5/2024 11:03:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POS_EmployeeRole](
	[Role_ID] [nvarchar](20) NOT NULL,
	[Role_Name] [nvarchar](100) NOT NULL,
	[POS_Flag] [int] NOT NULL,
	[POS_AccessPayments] [int] NOT NULL,
	[POS_ApplyDiscount] [int] NOT NULL,
	[POS_ChangeTaxes] [int] NOT NULL,
	[POS_ViewReceipt] [int] NOT NULL,
	[POS_ReprintSendReceipt] [int] NOT NULL,
	[POS_ViewShift] [int] NOT NULL,
	[POS_ManageItemsPOS] [int] NOT NULL,
	[POS_ViewCostPOS] [int] NOT NULL,
	[POS_ChangeSetting] [int] NOT NULL,
	[BckOffice_Flag] [int] NOT NULL,
	[BckOffice_ViewSales] [int] NOT NULL,
	[BckOffice_ManageItemsOff] [int] NOT NULL,
	[BckOffice_ViewCostOff] [int] NOT NULL,
	[BckOffice_ManageEmployee] [int] NOT NULL,
	[BckOffice_ManageCustomers] [int] NOT NULL,
	[BckOffice_EditSetting] [int] NOT NULL,
	[BckOffice_ManagePayTypes] [int] NOT NULL,
	[BckOffice_ManageTaxes] [int] NOT NULL,
	[BckOffice_POSDevices] [int] NOT NULL,
	[Created_User] [nvarchar](30) NULL,
	[Created_Date] [datetime] NULL,
	[Modified_User] [nvarchar](30) NULL,
	[Modified_Date] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[POS_EmployeeRole_History]    Script Date: 3/5/2024 11:03:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POS_EmployeeRole_History](
	[Role_ID] [nvarchar](20) NOT NULL,
	[Role_Name] [nvarchar](100) NOT NULL,
	[Line_Item] [int] NOT NULL,
	[POS_Flag] [int] NOT NULL,
	[POS_AccessPayments] [int] NOT NULL,
	[POS_ApplyDiscount] [int] NOT NULL,
	[POS_ChangeTaxes] [int] NOT NULL,
	[POS_ViewReceipt] [int] NOT NULL,
	[POS_ReprintSendReceipt] [int] NOT NULL,
	[POS_ViewShift] [int] NOT NULL,
	[POS_ManageItemsPOS] [int] NOT NULL,
	[POS_ViewCostPOS] [int] NOT NULL,
	[POS_ChangeSetting] [int] NOT NULL,
	[BckOffice_Flag] [int] NOT NULL,
	[BckOffice_ViewSales] [int] NOT NULL,
	[BckOffice_ManageItemsOff] [int] NOT NULL,
	[BckOffice_ViewCostOff] [int] NOT NULL,
	[BckOffice_ManageEmployee] [int] NOT NULL,
	[BckOffice_ManageCustomers] [int] NOT NULL,
	[BckOffice_EditSetting] [int] NOT NULL,
	[BckOffice_ManagePayTypes] [int] NOT NULL,
	[BckOffice_ManageTaxes] [int] NOT NULL,
	[BckOffice_POSDevices] [int] NOT NULL,
	[Created_User] [nvarchar](30) NULL,
	[Created_Date] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[POS_Item]    Script Date: 3/5/2024 11:03:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POS_Item](
	[Item_Number] [nvarchar](20) NOT NULL,
	[Site_ID] [nvarchar](20) NOT NULL,
	[Item_Name] [nvarchar](50) NOT NULL,
	[Item_Description] [nvarchar](250) NOT NULL,
	[UOFM] [nvarchar](30) NOT NULL,
	[Category_ID] [nvarchar](20) NOT NULL,
	[Item_Sales] [int] NOT NULL,
	[Item_SoldBy] [int] NOT NULL,
	[Item_Price] [numeric](19, 5) NOT NULL,
	[Item_Cost] [numeric](19, 5) NOT NULL,
	[Item_SKU] [nvarchar](10) NOT NULL,
	[Item_Barcode] [nvarchar](max) NOT NULL,
	[Composite_Item] [int] NOT NULL,
	[Track_Stock] [int] NOT NULL,
	[InStock] [int] NOT NULL,
	[LowStock] [int] NOT NULL,
	[Tax_ID] [nvarchar](20) NOT NULL,
	[Representation] [int] NOT NULL,
	[Item_Color] [nvarchar](50) NOT NULL,
	[Item_Shape] [nvarchar](50) NOT NULL,
	[Item_Image] [nvarchar](max) NOT NULL,
	[Created_User] [nvarchar](30) NULL,
	[Created_Date] [datetime] NULL,
	[Modified_User] [nvarchar](30) NULL,
	[Modified_Date] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[POS_Item_History]    Script Date: 3/5/2024 11:03:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POS_Item_History](
	[Item_Number] [nvarchar](20) NOT NULL,
	[Site_ID] [nvarchar](20) NOT NULL,
	[Item_Name] [nvarchar](50) NOT NULL,
	[Item_Description] [nvarchar](250) NOT NULL,
	[Line_Item] [int] NOT NULL,
	[UOFM] [nvarchar](30) NOT NULL,
	[Category_ID] [nvarchar](20) NOT NULL,
	[Item_Sales] [int] NOT NULL,
	[Item_SoldBy] [int] NOT NULL,
	[Item_Price] [numeric](19, 5) NOT NULL,
	[Item_Cost] [numeric](19, 5) NOT NULL,
	[Item_SKU] [nvarchar](10) NOT NULL,
	[Item_Barcode] [nvarchar](max) NOT NULL,
	[Composite_Item] [int] NOT NULL,
	[Track_Stock] [int] NOT NULL,
	[InStock] [int] NOT NULL,
	[LowStock] [int] NOT NULL,
	[Tax_ID] [nvarchar](20) NOT NULL,
	[Representation] [int] NOT NULL,
	[Item_Color] [nvarchar](50) NOT NULL,
	[Item_Shape] [nvarchar](50) NOT NULL,
	[Item_Image] [nvarchar](max) NOT NULL,
	[Created_User] [nvarchar](30) NULL,
	[Created_Date] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[POS_ItemInventory]    Script Date: 3/5/2024 11:03:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POS_ItemInventory](
	[Item_Number] [nvarchar](20) NOT NULL,
	[Item_Quantity] [numeric](19, 5) NOT NULL,
	[Site_ID] [nvarchar](20) NOT NULL,
	[Low_Stock] [numeric](19, 5) NOT NULL,
	[UOFM] [nvarchar](30) NOT NULL,
	[Created_User] [nvarchar](30) NULL,
	[Created_Date] [datetime] NULL,
	[Modified_User] [nvarchar](30) NULL,
	[Modified_Date] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[POS_ItemInventory_History]    Script Date: 3/5/2024 11:03:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POS_ItemInventory_History](
	[Item_Number] [nvarchar](20) NOT NULL,
	[Line_Item] [int] NOT NULL,
	[Item_Quantity] [numeric](19, 5) NOT NULL,
	[Site_ID] [nvarchar](20) NOT NULL,
	[Low_Stock] [numeric](19, 5) NOT NULL,
	[UOFM] [nvarchar](30) NOT NULL,
	[Created_User] [nvarchar](30) NULL,
	[Created_Date] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[POS_ItemVariant]    Script Date: 3/5/2024 11:03:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POS_ItemVariant](
	[Item_Number] [nvarchar](20) NOT NULL,
	[Site_ID] [nvarchar](20) NOT NULL,
	[LineItem_Option] [numeric](19, 5) NOT NULL,
	[CB_Available] [int] NOT NULL,
	[Option_ID] [nvarchar](50) NOT NULL,
	[Option_Name] [nvarchar](50) NOT NULL,
	[LineItem_Variant] [numeric](19, 5) NOT NULL,
	[Variant_Name] [nvarchar](50) NOT NULL,
	[Item_Price] [numeric](19, 5) NOT NULL,
	[Item_Cost] [numeric](19, 5) NOT NULL,
	[InStock] [int] NOT NULL,
	[LowStock] [int] NOT NULL,
	[OptimalStock] [int] NOT NULL,
	[Item_SKU] [nvarchar](10) NOT NULL,
	[Item_Barcode] [nvarchar](max) NOT NULL,
	[Created_User] [nvarchar](30) NULL,
	[Created_Date] [datetime] NULL,
	[Modified_User] [nvarchar](30) NULL,
	[Modified_Date] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[POS_ItemVariant_History]    Script Date: 3/5/2024 11:03:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POS_ItemVariant_History](
	[Item_Number] [nvarchar](20) NOT NULL,
	[Site_ID] [nvarchar](20) NOT NULL,
	[LineItem_Option] [numeric](19, 5) NOT NULL,
	[Line_Item] [int] NOT NULL,
	[CB_Available] [int] NOT NULL,
	[Option_ID] [nvarchar](50) NOT NULL,
	[Option_Name] [nvarchar](50) NOT NULL,
	[LineItem_Variant] [numeric](19, 5) NOT NULL,
	[Variant_Name] [nvarchar](50) NOT NULL,
	[Item_Price] [numeric](19, 5) NOT NULL,
	[Item_Cost] [numeric](19, 5) NOT NULL,
	[InStock] [int] NOT NULL,
	[LowStock] [int] NOT NULL,
	[OptimalStock] [int] NOT NULL,
	[Item_SKU] [nvarchar](10) NOT NULL,
	[Item_Barcode] [nvarchar](max) NOT NULL,
	[Created_User] [nvarchar](30) NULL,
	[Created_Date] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[POS_Set_Site]    Script Date: 3/5/2024 11:03:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POS_Set_Site](
	[Site_ID] [nvarchar](20) NOT NULL,
	[DefaultSite] [int] NOT NULL,
	[Site_Name] [nvarchar](100) NOT NULL,
	[Store_ID] [nvarchar](20) NOT NULL,
	[Store_Name] [nvarchar](100) NOT NULL,
	[Created_User] [nvarchar](30) NULL,
	[Created_Date] [datetime] NULL,
	[Modified_User] [nvarchar](30) NULL,
	[Modified_Date] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[POS_Set_Site_History]    Script Date: 3/5/2024 11:03:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POS_Set_Site_History](
	[Site_ID] [nvarchar](20) NOT NULL,
	[DefaultSite] [int] NOT NULL,
	[Site_Name] [nvarchar](100) NOT NULL,
	[Line_Item] [int] NOT NULL,
	[Store_ID] [nvarchar](20) NOT NULL,
	[Store_Name] [nvarchar](100) NOT NULL,
	[Created_User] [nvarchar](30) NULL,
	[Created_Date] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[POS_Set_Taxes]    Script Date: 3/5/2024 11:03:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POS_Set_Taxes](
	[Tax_ID] [nvarchar](20) NOT NULL,
	[Tax_Name] [nvarchar](100) NOT NULL,
	[Tax_Rate] [numeric](19, 5) NOT NULL,
	[Tax_Type] [int] NOT NULL,
	[Tax_Option] [int] NOT NULL,
	[Created_User] [nvarchar](30) NULL,
	[Created_Date] [datetime] NULL,
	[Modified_User] [nvarchar](30) NULL,
	[Modified_Date] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[POS_Set_Taxes_History]    Script Date: 3/5/2024 11:03:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POS_Set_Taxes_History](
	[Tax_ID] [nvarchar](20) NOT NULL,
	[Tax_Name] [nvarchar](100) NOT NULL,
	[Line_Item] [int] NOT NULL,
	[Tax_Rate] [numeric](19, 5) NOT NULL,
	[Tax_Type] [int] NOT NULL,
	[Tax_Option] [int] NOT NULL,
	[Created_User] [nvarchar](30) NULL,
	[Created_Date] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[POS_TrxAdjustment_Detail]    Script Date: 3/5/2024 11:03:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POS_TrxAdjustment_Detail](
	[DOCNUMBER] [nvarchar](20) NOT NULL,
	[DOCDATE] [datetime] NOT NULL,
	[Reason] [nvarchar](30) NOT NULL,
	[Lineitmseq] [int] NOT NULL,
	[Item_Number] [nvarchar](20) NOT NULL,
	[LineItem_Option] [numeric](19, 5) NOT NULL,
	[Item_Description] [nvarchar](250) NOT NULL,
	[Qty_Stock] [numeric](19, 5) NOT NULL,
	[Qty_Add_Stock] [numeric](19, 5) NOT NULL,
	[Qty_Remove_Stock] [numeric](19, 5) NOT NULL,
	[Item_Cost] [numeric](19, 5) NOT NULL,
	[Qty_After_Stock] [numeric](19, 5) NOT NULL,
	[Expected_Stock] [numeric](19, 5) NOT NULL,
	[Counted_Stock] [numeric](19, 5) NOT NULL,
	[Created_User] [nvarchar](30) NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Created_time] [datetime] NOT NULL,
	[Modified_User] [nvarchar](30) NOT NULL,
	[Modified_Date] [datetime] NOT NULL,
	[Modified_time] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[POS_TrxAdjustment_DetailHIST]    Script Date: 3/5/2024 11:03:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POS_TrxAdjustment_DetailHIST](
	[DOCNUMBER] [nvarchar](20) NOT NULL,
	[DOCDATE] [datetime] NOT NULL,
	[Reason] [nvarchar](30) NOT NULL,
	[Lineitmseq] [int] NOT NULL,
	[Item_Number] [nvarchar](20) NOT NULL,
	[LineItem_Option] [numeric](19, 5) NOT NULL,
	[Item_Description] [nvarchar](250) NOT NULL,
	[Qty_Stock] [numeric](19, 5) NOT NULL,
	[Qty_Add_Stock] [numeric](19, 5) NOT NULL,
	[Qty_Remove_Stock] [numeric](19, 5) NOT NULL,
	[Item_Cost] [numeric](19, 5) NOT NULL,
	[Qty_After_Stock] [numeric](19, 5) NOT NULL,
	[Expected_Stock] [numeric](19, 5) NOT NULL,
	[Counted_Stock] [numeric](19, 5) NOT NULL,
	[Created_User] [nvarchar](30) NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Created_time] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[POS_TrxAdjustment_Header]    Script Date: 3/5/2024 11:03:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POS_TrxAdjustment_Header](
	[DOCNUMBER] [nvarchar](20) NOT NULL,
	[DOCDATE] [datetime] NOT NULL,
	[Site_ID] [nvarchar](20) NOT NULL,
	[Site_Name] [nvarchar](100) NOT NULL,
	[Reason] [nvarchar](30) NOT NULL,
	[Total_Line_Item] [int] NOT NULL,
	[Notes] [nvarchar](500) NOT NULL,
	[Created_User] [nvarchar](30) NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Created_time] [datetime] NOT NULL,
	[Modified_User] [nvarchar](30) NOT NULL,
	[Modified_Date] [datetime] NOT NULL,
	[Modified_time] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[POS_TrxAdjustment_HeaderHIST]    Script Date: 3/5/2024 11:03:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POS_TrxAdjustment_HeaderHIST](
	[DOCNUMBER] [nvarchar](20) NOT NULL,
	[DOCDATE] [datetime] NOT NULL,
	[Site_ID] [nvarchar](20) NOT NULL,
	[Site_Name] [nvarchar](100) NOT NULL,
	[Reason] [nvarchar](30) NOT NULL,
	[Total_Line_Item] [int] NOT NULL,
	[Notes] [nvarchar](500) NOT NULL,
	[Created_User] [nvarchar](30) NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Created_time] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[POS_TrxItemTrf_DetailHIST]    Script Date: 3/5/2024 11:03:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POS_TrxItemTrf_DetailHIST](
	[DOCNUMBER] [nvarchar](20) NOT NULL,
	[DOCDATE] [datetime] NOT NULL,
	[Lineitmseq] [int] NOT NULL,
	[Item_Number] [nvarchar](20) NOT NULL,
	[Item_Description] [nvarchar](250) NOT NULL,
	[Item_SKU] [nvarchar](20) NOT NULL,
	[Source_Stock] [numeric](19, 5) NOT NULL,
	[Dest_Stock] [numeric](19, 5) NOT NULL,
	[Qty_Transfer] [numeric](19, 5) NOT NULL,
	[Created_User] [nvarchar](30) NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Created_time] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[POS_TrxItemTrf_DetailPOST]    Script Date: 3/5/2024 11:03:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POS_TrxItemTrf_DetailPOST](
	[DOCNUMBER] [nvarchar](20) NOT NULL,
	[DOCDATE] [datetime] NOT NULL,
	[Lineitmseq] [int] NOT NULL,
	[Item_Number] [nvarchar](20) NOT NULL,
	[Item_Description] [nvarchar](250) NOT NULL,
	[Item_SKU] [nvarchar](20) NOT NULL,
	[Source_Stock] [numeric](19, 5) NOT NULL,
	[Dest_Stock] [numeric](19, 5) NOT NULL,
	[Qty_Transfer] [numeric](19, 5) NOT NULL,
	[Created_User] [nvarchar](30) NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Created_time] [datetime] NOT NULL,
	[Modified_User] [nvarchar](30) NOT NULL,
	[Modified_Date] [datetime] NOT NULL,
	[Modified_time] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[POS_TrxItemTrf_DetailTEMP]    Script Date: 3/5/2024 11:03:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POS_TrxItemTrf_DetailTEMP](
	[DOCNUMBER] [nvarchar](20) NOT NULL,
	[DOCDATE] [datetime] NOT NULL,
	[Lineitmseq] [int] NOT NULL,
	[Item_Number] [nvarchar](20) NOT NULL,
	[Item_Description] [nvarchar](250) NOT NULL,
	[Item_SKU] [nvarchar](20) NOT NULL,
	[Source_Stock] [numeric](19, 5) NOT NULL,
	[Dest_Stock] [numeric](19, 5) NOT NULL,
	[Qty_Transfer] [numeric](19, 5) NOT NULL,
	[Created_User] [nvarchar](30) NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Created_time] [datetime] NOT NULL,
	[Modified_User] [nvarchar](30) NOT NULL,
	[Modified_Date] [datetime] NOT NULL,
	[Modified_time] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[POS_TrxItemTrf_HeaderHIST]    Script Date: 3/5/2024 11:03:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POS_TrxItemTrf_HeaderHIST](
	[DOCNUMBER] [nvarchar](20) NOT NULL,
	[DOCDATE] [datetime] NOT NULL,
	[SourceSite_ID] [nvarchar](20) NOT NULL,
	[SourceSite_Name] [nvarchar](100) NOT NULL,
	[DestSite_ID] [nvarchar](20) NOT NULL,
	[DestSite_Name] [nvarchar](100) NOT NULL,
	[Total_Line_Item] [int] NOT NULL,
	[Notes] [nvarchar](500) NOT NULL,
	[Status] [int] NOT NULL,
	[Created_User] [nvarchar](30) NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Created_time] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[POS_TrxItemTrf_HeaderPOST]    Script Date: 3/5/2024 11:03:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POS_TrxItemTrf_HeaderPOST](
	[DOCNUMBER] [nvarchar](20) NOT NULL,
	[DOCDATE] [datetime] NOT NULL,
	[SourceSite_ID] [nvarchar](20) NOT NULL,
	[SourceSite_Name] [nvarchar](100) NOT NULL,
	[DestSite_ID] [nvarchar](20) NOT NULL,
	[DestSite_Name] [nvarchar](100) NOT NULL,
	[Total_Line_Item] [int] NOT NULL,
	[Notes] [nvarchar](500) NOT NULL,
	[Status] [int] NOT NULL,
	[Created_User] [nvarchar](30) NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Created_time] [datetime] NOT NULL,
	[Modified_User] [nvarchar](30) NOT NULL,
	[Modified_Date] [datetime] NOT NULL,
	[Modified_time] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[POS_TrxItemTrf_HeaderTEMP]    Script Date: 3/5/2024 11:03:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POS_TrxItemTrf_HeaderTEMP](
	[DOCNUMBER] [nvarchar](20) NOT NULL,
	[DOCDATE] [datetime] NOT NULL,
	[SourceSite_ID] [nvarchar](20) NOT NULL,
	[SourceSite_Name] [nvarchar](100) NOT NULL,
	[DestSite_ID] [nvarchar](20) NOT NULL,
	[DestSite_Name] [nvarchar](100) NOT NULL,
	[Total_Line_Item] [int] NOT NULL,
	[Notes] [nvarchar](500) NOT NULL,
	[Status] [int] NOT NULL,
	[Created_User] [nvarchar](30) NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Created_time] [datetime] NOT NULL,
	[Modified_User] [nvarchar](30) NOT NULL,
	[Modified_Date] [datetime] NOT NULL,
	[Modified_time] [datetime] NOT NULL
) ON [PRIMARY]
GO
INSERT [dbo].[POS_CategoryItem] ([Category_ID], [Category_Name], [Category_Color], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'CAT0001', N'SD', N'bg-red', N'USER1', CAST(N'2023-11-05T15:49:35.513' AS DateTime), N'USER1', CAST(N'2024-02-15T22:54:13.710' AS DateTime))
GO
INSERT [dbo].[POS_CategoryItem] ([Category_ID], [Category_Name], [Category_Color], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'CAT0002', N'SMP', N'bg-purple', N'USER1', CAST(N'2024-02-15T22:54:23.560' AS DateTime), N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_CategoryItem] ([Category_ID], [Category_Name], [Category_Color], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'CAT0003', N'SMA', N'bg-gray-light', N'USER1', CAST(N'2024-02-15T22:54:32.300' AS DateTime), N'USER1', CAST(N'2024-02-15T22:54:49.797' AS DateTime))
GO
INSERT [dbo].[POS_CategoryItem] ([Category_ID], [Category_Name], [Category_Color], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'CAT0004', N'TAS', N'bg-green', N'USER1', CAST(N'2024-02-15T22:54:43.267' AS DateTime), N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_CategoryItem_History] ([Category_ID], [Line_Item], [Category_Name], [Category_Color], [Created_User], [Created_Date]) VALUES (N'CAT0001', 0, N'Kopi Susu', N'bg-blue', N'USER1', CAST(N'2023-11-05T15:49:35.597' AS DateTime))
GO
INSERT [dbo].[POS_CategoryItem_History] ([Category_ID], [Line_Item], [Category_Name], [Category_Color], [Created_User], [Created_Date]) VALUES (N'CAT0001', 1, N'SD', N'bg-red', N'USER1', CAST(N'2024-02-15T22:54:13.713' AS DateTime))
GO
INSERT [dbo].[POS_CategoryItem_History] ([Category_ID], [Line_Item], [Category_Name], [Category_Color], [Created_User], [Created_Date]) VALUES (N'CAT0002', 0, N'SMP', N'bg-purple', N'USER1', CAST(N'2024-02-15T22:54:23.560' AS DateTime))
GO
INSERT [dbo].[POS_CategoryItem_History] ([Category_ID], [Line_Item], [Category_Name], [Category_Color], [Created_User], [Created_Date]) VALUES (N'CAT0003', 0, N'SMA', N'bg-blue', N'USER1', CAST(N'2024-02-15T22:54:32.303' AS DateTime))
GO
INSERT [dbo].[POS_CategoryItem_History] ([Category_ID], [Line_Item], [Category_Name], [Category_Color], [Created_User], [Created_Date]) VALUES (N'CAT0004', 0, N'TAS', N'bg-green', N'USER1', CAST(N'2024-02-15T22:54:43.267' AS DateTime))
GO
INSERT [dbo].[POS_CategoryItem_History] ([Category_ID], [Line_Item], [Category_Name], [Category_Color], [Created_User], [Created_Date]) VALUES (N'CAT0003', 1, N'SMA', N'bg-gray-light', N'USER1', CAST(N'2024-02-15T22:54:49.800' AS DateTime))
GO
INSERT [dbo].[POS_Customer] ([Customer_ID], [Customer_Name], [Email], [Phone], [Address], [Country], [Province], [City], [Postal_Code], [Customer_Code], [Note], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'CUST0001', N'Test Customer', N'testcust@amail.com', N'089765467873', N'dimana bae', N'ID', N'', N'', N'17125', N'CUST001', N'testing', N'USER1', CAST(N'2023-11-23T21:18:40.587' AS DateTime), N'USER1', CAST(N'2023-12-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_Customer] ([Customer_ID], [Customer_Name], [Email], [Phone], [Address], [Country], [Province], [City], [Postal_Code], [Customer_Code], [Note], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'CUST0002', N'CUST002', N'testcust2@amail.com', N'08976565432132', N'dimana bae juga', N'ID', N'', N'', N'17126', N'CUST002', N'', N'USER1', CAST(N'2023-11-23T21:30:46.637' AS DateTime), N'USER1', CAST(N'2023-11-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_Customer_History] ([Customer_ID], [Customer_Name], [Line_Item], [Email], [Phone], [Address], [Country], [Province], [City], [Postal_Code], [Customer_Code], [Note], [Created_User], [Created_Date]) VALUES (N'CUST0001', N'Test Customer', 0, N'testcust@amail.com', N'089765467873', N'dimana bae', N'', N'', N'', N'17125', N'CUST001', N'', N'USER1', CAST(N'2023-11-23T21:18:40.593' AS DateTime))
GO
INSERT [dbo].[POS_Customer_History] ([Customer_ID], [Customer_Name], [Line_Item], [Email], [Phone], [Address], [Country], [Province], [City], [Postal_Code], [Customer_Code], [Note], [Created_User], [Created_Date]) VALUES (N'CUST0002', N'CUST002', 0, N'testcust2@amail.com', N'08976565432132', N'dimana bae juga', N'', N'', N'', N'17126', N'CUST002', N'', N'USER1', CAST(N'2023-11-23T21:30:46.637' AS DateTime))
GO
INSERT [dbo].[POS_Customer_History] ([Customer_ID], [Customer_Name], [Line_Item], [Email], [Phone], [Address], [Country], [Province], [City], [Postal_Code], [Customer_Code], [Note], [Created_User], [Created_Date]) VALUES (N'CUST0003', N'Test Customer', 0, N'testcust@amail.com', N'089765467873', N'dimana bae', N'ID', N'', N'', N'17125', N'CUST001', N'', N'USER1', CAST(N'2023-11-23T21:58:31.100' AS DateTime))
GO
INSERT [dbo].[POS_Customer_History] ([Customer_ID], [Customer_Name], [Line_Item], [Email], [Phone], [Address], [Country], [Province], [City], [Postal_Code], [Customer_Code], [Note], [Created_User], [Created_Date]) VALUES (N'CUST0004', N'Test Customer', 0, N'testcust@amail.com', N'089765467873', N'dimana bae', N'ID', N'', N'', N'17125', N'CUST001', N'', N'USER1', CAST(N'2023-11-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_Customer_History] ([Customer_ID], [Customer_Name], [Line_Item], [Email], [Phone], [Address], [Country], [Province], [City], [Postal_Code], [Customer_Code], [Note], [Created_User], [Created_Date]) VALUES (N'CUST0005', N'Test Customer', 0, N'testcust@amail.com', N'089765467873', N'dimana bae', N'ID', N'', N'', N'17125', N'CUST001', N'', N'USER1', CAST(N'2023-11-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_Customer_History] ([Customer_ID], [Customer_Name], [Line_Item], [Email], [Phone], [Address], [Country], [Province], [City], [Postal_Code], [Customer_Code], [Note], [Created_User], [Created_Date]) VALUES (N'CUST0002', N'CUST002', 1, N'testcust2@amail.com', N'08976565432132', N'dimana bae juga', N'ID', N'', N'', N'17126', N'CUST002', N'', N'USER1', CAST(N'2023-11-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_Customer_History] ([Customer_ID], [Customer_Name], [Line_Item], [Email], [Phone], [Address], [Country], [Province], [City], [Postal_Code], [Customer_Code], [Note], [Created_User], [Created_Date]) VALUES (N'CUST0001', N'Test Customer', 1, N'testcust@amail.com', N'089765467873', N'dimana bae', N'', N'', N'', N'17125', N'CUST001', N'testing', N'USER1', CAST(N'2023-11-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_Customer_History] ([Customer_ID], [Customer_Name], [Line_Item], [Email], [Phone], [Address], [Country], [Province], [City], [Postal_Code], [Customer_Code], [Note], [Created_User], [Created_Date]) VALUES (N'CUST0001', N'Test Customer', 2, N'testcust@amail.com', N'089765467873', N'dimana bae', N'ID', N'', N'', N'17125', N'CUST001', N'testing', N'USER1', CAST(N'2023-12-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_Device] ([POS_Device_ID], [POS_Device_Name], [Store_ID], [Store_Name], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'DVC0001', N'POS01', N'STR0001', N'STORE A', N'USER1', CAST(N'2023-12-17T00:00:00.000' AS DateTime), N'USER1', CAST(N'2024-02-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_Device_History] ([POS_Device_ID], [POS_Device_Name], [Line_Item], [Store_ID], [Store_Name], [Created_User], [Created_Date]) VALUES (N'DVC0001', N'TEST', 0, N'STR0001', N'STORE A', N'USER1', CAST(N'2023-12-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_Device_History] ([POS_Device_ID], [POS_Device_Name], [Line_Item], [Store_ID], [Store_Name], [Created_User], [Created_Date]) VALUES (N'DVC0001', N'POS01', 1, N'STR0001', N'STORE A', N'USER1', CAST(N'2024-02-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_Discount] ([Discount_ID], [Discount_Name], [Discount_Type], [Discount_Value], [Restricted_Access], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'DISC0001', N'Best Friend', 1, CAST(20000.00000 AS Numeric(19, 5)), 0, N'USER1', CAST(N'2023-11-04T01:17:35.603' AS DateTime), N'USER1', CAST(N'2024-02-19T22:42:44.430' AS DateTime))
GO
INSERT [dbo].[POS_Discount] ([Discount_ID], [Discount_Name], [Discount_Type], [Discount_Value], [Restricted_Access], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'DISC0002', N'Best Friend OLD', 1, CAST(1000.00000 AS Numeric(19, 5)), 0, N'USER1', CAST(N'2023-11-04T01:17:49.037' AS DateTime), N'USER1', CAST(N'2024-02-19T22:43:25.007' AS DateTime))
GO
INSERT [dbo].[POS_Discount] ([Discount_ID], [Discount_Name], [Discount_Type], [Discount_Value], [Restricted_Access], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'DISC0003', N'Tester', 2, CAST(50000.00000 AS Numeric(19, 5)), 0, N'USER1', CAST(N'2023-11-04T01:21:35.573' AS DateTime), N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_Discount] ([Discount_ID], [Discount_Name], [Discount_Type], [Discount_Value], [Restricted_Access], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'DISC0006', N'LUCKY FRIEND', 2, CAST(25000.00000 AS Numeric(19, 5)), 0, N'USER1', CAST(N'2024-02-15T23:01:28.930' AS DateTime), N'USER1', CAST(N'2024-02-19T22:43:09.337' AS DateTime))
GO
INSERT [dbo].[POS_Discount] ([Discount_ID], [Discount_Name], [Discount_Type], [Discount_Value], [Restricted_Access], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'DISC0004', N'test', 1, CAST(5.00000 AS Numeric(19, 5)), 0, N'USER1', CAST(N'2023-11-04T01:22:48.970' AS DateTime), N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_Discount] ([Discount_ID], [Discount_Name], [Discount_Type], [Discount_Value], [Restricted_Access], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'DISC0005', N'test', 2, CAST(30000.00000 AS Numeric(19, 5)), 1, N'USER1', CAST(N'2023-11-04T16:59:18.907' AS DateTime), N'USER1', CAST(N'2023-11-04T17:01:25.387' AS DateTime))
GO
INSERT [dbo].[POS_Discount_History] ([Discount_ID], [Discount_Name], [Line_Item], [Discount_Type], [Discount_Value], [Restricted_Access], [Created_User], [Created_Date]) VALUES (N'', N'Best Friend', 0, 2, CAST(50000.00000 AS Numeric(19, 5)), 0, N'USER1', CAST(N'2023-11-04T01:08:30.387' AS DateTime))
GO
INSERT [dbo].[POS_Discount_History] ([Discount_ID], [Discount_Name], [Line_Item], [Discount_Type], [Discount_Value], [Restricted_Access], [Created_User], [Created_Date]) VALUES (N'', N'Best Friend', 1, 2, CAST(50000.00000 AS Numeric(19, 5)), 0, N'USER1', CAST(N'2023-11-04T01:09:08.437' AS DateTime))
GO
INSERT [dbo].[POS_Discount_History] ([Discount_ID], [Discount_Name], [Line_Item], [Discount_Type], [Discount_Value], [Restricted_Access], [Created_User], [Created_Date]) VALUES (N'', N'Best Friend', 2, 2, CAST(50000.00000 AS Numeric(19, 5)), 0, N'USER1', CAST(N'2023-11-04T01:09:38.163' AS DateTime))
GO
INSERT [dbo].[POS_Discount_History] ([Discount_ID], [Discount_Name], [Line_Item], [Discount_Type], [Discount_Value], [Restricted_Access], [Created_User], [Created_Date]) VALUES (N'', N'Tester', 3, 1, CAST(1000.00000 AS Numeric(19, 5)), 0, N'USER1', CAST(N'2023-11-04T01:15:21.560' AS DateTime))
GO
INSERT [dbo].[POS_Discount_History] ([Discount_ID], [Discount_Name], [Line_Item], [Discount_Type], [Discount_Value], [Restricted_Access], [Created_User], [Created_Date]) VALUES (N'', N'Tester', 4, 1, CAST(5000.00000 AS Numeric(19, 5)), 0, N'USER1', CAST(N'2023-11-04T01:16:21.940' AS DateTime))
GO
INSERT [dbo].[POS_Discount_History] ([Discount_ID], [Discount_Name], [Line_Item], [Discount_Type], [Discount_Value], [Restricted_Access], [Created_User], [Created_Date]) VALUES (N'DISC0005', N'test', 1, 2, CAST(30000.00000 AS Numeric(19, 5)), 1, N'USER1', CAST(N'2023-11-04T17:01:25.390' AS DateTime))
GO
INSERT [dbo].[POS_Discount_History] ([Discount_ID], [Discount_Name], [Line_Item], [Discount_Type], [Discount_Value], [Restricted_Access], [Created_User], [Created_Date]) VALUES (N'DISC0006', N'LUCKY FRIEND', 0, 1, CAST(30.00000 AS Numeric(19, 5)), 0, N'USER1', CAST(N'2024-02-15T23:01:28.933' AS DateTime))
GO
INSERT [dbo].[POS_Discount_History] ([Discount_ID], [Discount_Name], [Line_Item], [Discount_Type], [Discount_Value], [Restricted_Access], [Created_User], [Created_Date]) VALUES (N'DISC0001', N'Best Friend', 1, 1, CAST(20000.00000 AS Numeric(19, 5)), 0, N'USER1', CAST(N'2024-02-19T22:42:44.430' AS DateTime))
GO
INSERT [dbo].[POS_Discount_History] ([Discount_ID], [Discount_Name], [Line_Item], [Discount_Type], [Discount_Value], [Restricted_Access], [Created_User], [Created_Date]) VALUES (N'DISC0006', N'LUCKY FRIEND', 1, 2, CAST(25000.00000 AS Numeric(19, 5)), 0, N'USER1', CAST(N'2024-02-19T22:43:09.337' AS DateTime))
GO
INSERT [dbo].[POS_Discount_History] ([Discount_ID], [Discount_Name], [Line_Item], [Discount_Type], [Discount_Value], [Restricted_Access], [Created_User], [Created_Date]) VALUES (N'DISC0002', N'Best Friend OLD', 1, 1, CAST(1000.00000 AS Numeric(19, 5)), 0, N'USER1', CAST(N'2024-02-19T22:43:25.007' AS DateTime))
GO
INSERT [dbo].[POS_Discount_History] ([Discount_ID], [Discount_Name], [Line_Item], [Discount_Type], [Discount_Value], [Restricted_Access], [Created_User], [Created_Date]) VALUES (N'DISC0001', N'Best Friend', 0, 1, CAST(1000.00000 AS Numeric(19, 5)), 0, N'USER1', CAST(N'2023-11-04T01:17:35.603' AS DateTime))
GO
INSERT [dbo].[POS_Discount_History] ([Discount_ID], [Discount_Name], [Line_Item], [Discount_Type], [Discount_Value], [Restricted_Access], [Created_User], [Created_Date]) VALUES (N'DISC0002', N'Best Friend', 0, 1, CAST(1000.00000 AS Numeric(19, 5)), 0, N'USER1', CAST(N'2023-11-04T01:17:49.040' AS DateTime))
GO
INSERT [dbo].[POS_Discount_History] ([Discount_ID], [Discount_Name], [Line_Item], [Discount_Type], [Discount_Value], [Restricted_Access], [Created_User], [Created_Date]) VALUES (N'DISC0003', N'Tester', 0, 2, CAST(50000.00000 AS Numeric(19, 5)), 0, N'USER1', CAST(N'2023-11-04T01:21:35.573' AS DateTime))
GO
INSERT [dbo].[POS_Discount_History] ([Discount_ID], [Discount_Name], [Line_Item], [Discount_Type], [Discount_Value], [Restricted_Access], [Created_User], [Created_Date]) VALUES (N'DISC0004', N'test', 0, 1, CAST(5.00000 AS Numeric(19, 5)), 0, N'USER1', CAST(N'2023-11-04T01:22:48.970' AS DateTime))
GO
INSERT [dbo].[POS_Discount_History] ([Discount_ID], [Discount_Name], [Line_Item], [Discount_Type], [Discount_Value], [Restricted_Access], [Created_User], [Created_Date]) VALUES (N'DISC0005', N'test', 0, 1, CAST(5.00000 AS Numeric(19, 5)), 1, N'USER1', CAST(N'2023-11-04T16:59:18.910' AS DateTime))
GO
INSERT [dbo].[POS_Employee] ([Employee_ID], [Employee_Name], [Email], [Phone], [Role_ID], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'EMP0001', N'test', N'test@amail.com', N'0856787652124', N'ROLE0001', N'USER1', CAST(N'2023-12-09T00:00:00.000' AS DateTime), N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_Employee_History] ([Employee_ID], [Employee_Name], [Line_Item], [Email], [Phone], [Role_ID], [Created_User], [Created_Date]) VALUES (N'EMP0001', N'test', 0, N'test@amail.com', N'0856787652124', N'ROLE0001', N'USER1', CAST(N'2023-12-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_EmployeeRole] ([Role_ID], [Role_Name], [POS_Flag], [POS_AccessPayments], [POS_ApplyDiscount], [POS_ChangeTaxes], [POS_ViewReceipt], [POS_ReprintSendReceipt], [POS_ViewShift], [POS_ManageItemsPOS], [POS_ViewCostPOS], [POS_ChangeSetting], [BckOffice_Flag], [BckOffice_ViewSales], [BckOffice_ManageItemsOff], [BckOffice_ViewCostOff], [BckOffice_ManageEmployee], [BckOffice_ManageCustomers], [BckOffice_EditSetting], [BckOffice_ManagePayTypes], [BckOffice_ManageTaxes], [BckOffice_POSDevices], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'ROLE0001', N'Owner', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, N'', CAST(N'2023-11-26T00:00:00.000' AS DateTime), N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_EmployeeRole_History] ([Role_ID], [Role_Name], [Line_Item], [POS_Flag], [POS_AccessPayments], [POS_ApplyDiscount], [POS_ChangeTaxes], [POS_ViewReceipt], [POS_ReprintSendReceipt], [POS_ViewShift], [POS_ManageItemsPOS], [POS_ViewCostPOS], [POS_ChangeSetting], [BckOffice_Flag], [BckOffice_ViewSales], [BckOffice_ManageItemsOff], [BckOffice_ViewCostOff], [BckOffice_ManageEmployee], [BckOffice_ManageCustomers], [BckOffice_EditSetting], [BckOffice_ManagePayTypes], [BckOffice_ManageTaxes], [BckOffice_POSDevices], [Created_User], [Created_Date]) VALUES (N'ROLE0001', N'Owner', 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, N'', CAST(N'2023-11-26T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_Item] ([Item_Number], [Site_ID], [Item_Name], [Item_Description], [UOFM], [Category_ID], [Item_Sales], [Item_SoldBy], [Item_Price], [Item_Cost], [Item_SKU], [Item_Barcode], [Composite_Item], [Track_Stock], [InStock], [LowStock], [Tax_ID], [Representation], [Item_Color], [Item_Shape], [Item_Image], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'ITM0001', N'SITE0001', N'BODYPACK', N'BODYPACK', N'', N'CAT0004', 1, 1, CAST(175000.00000 AS Numeric(19, 5)), CAST(125000.00000 AS Numeric(19, 5)), N'00004001', N'00004001', 0, 1, 100, 10, N'TAX0001', 0, N'bg-yellow', N'', N'', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime), N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_Item] ([Item_Number], [Site_ID], [Item_Name], [Item_Description], [UOFM], [Category_ID], [Item_Sales], [Item_SoldBy], [Item_Price], [Item_Cost], [Item_SKU], [Item_Barcode], [Composite_Item], [Track_Stock], [InStock], [LowStock], [Tax_ID], [Representation], [Item_Color], [Item_Shape], [Item_Image], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'ITM0001', N'SITE0002', N'BODYPACK', N'BODYPACK', N'', N'CAT0004', 1, 1, CAST(175000.00000 AS Numeric(19, 5)), CAST(125000.00000 AS Numeric(19, 5)), N'00004001', N'00004001', 0, 1, 0, 10, N'TAX0001', 0, N'bg-yellow', N'', N'', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime), N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_Item] ([Item_Number], [Site_ID], [Item_Name], [Item_Description], [UOFM], [Category_ID], [Item_Sales], [Item_SoldBy], [Item_Price], [Item_Cost], [Item_SKU], [Item_Barcode], [Composite_Item], [Track_Stock], [InStock], [LowStock], [Tax_ID], [Representation], [Item_Color], [Item_Shape], [Item_Image], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'ITM0001', N'SITE0003', N'BODYPACK', N'BODYPACK', N'', N'CAT0004', 1, 1, CAST(175000.00000 AS Numeric(19, 5)), CAST(125000.00000 AS Numeric(19, 5)), N'00004001', N'00004001', 0, 1, 0, 10, N'TAX0001', 0, N'bg-yellow', N'', N'', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime), N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_Item] ([Item_Number], [Site_ID], [Item_Name], [Item_Description], [UOFM], [Category_ID], [Item_Sales], [Item_SoldBy], [Item_Price], [Item_Cost], [Item_SKU], [Item_Barcode], [Composite_Item], [Track_Stock], [InStock], [LowStock], [Tax_ID], [Representation], [Item_Color], [Item_Shape], [Item_Image], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'ITM0002', N'SITE0001', N'SMIGGLE', N'SMIGGLE', N'', N'CAT0004', 1, 1, CAST(185000.00000 AS Numeric(19, 5)), CAST(150000.00000 AS Numeric(19, 5)), N'00005001', N'00005001', 0, 1, 100, 10, N'TAX0001', 0, N'bg-pink', N'', N'', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime), N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_Item] ([Item_Number], [Site_ID], [Item_Name], [Item_Description], [UOFM], [Category_ID], [Item_Sales], [Item_SoldBy], [Item_Price], [Item_Cost], [Item_SKU], [Item_Barcode], [Composite_Item], [Track_Stock], [InStock], [LowStock], [Tax_ID], [Representation], [Item_Color], [Item_Shape], [Item_Image], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'ITM0002', N'SITE0002', N'SMIGGLE', N'SMIGGLE', N'', N'CAT0004', 1, 1, CAST(185000.00000 AS Numeric(19, 5)), CAST(150000.00000 AS Numeric(19, 5)), N'00005001', N'00005001', 0, 1, 0, 10, N'', 0, N'bg-pink', N'', N'', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime), N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_Item] ([Item_Number], [Site_ID], [Item_Name], [Item_Description], [UOFM], [Category_ID], [Item_Sales], [Item_SoldBy], [Item_Price], [Item_Cost], [Item_SKU], [Item_Barcode], [Composite_Item], [Track_Stock], [InStock], [LowStock], [Tax_ID], [Representation], [Item_Color], [Item_Shape], [Item_Image], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'ITM0002', N'SITE0003', N'SMIGGLE', N'SMIGGLE', N'', N'CAT0004', 1, 1, CAST(185000.00000 AS Numeric(19, 5)), CAST(150000.00000 AS Numeric(19, 5)), N'00005001', N'00005001', 0, 1, 0, 10, N'', 0, N'bg-pink', N'', N'', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime), N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_Item] ([Item_Number], [Site_ID], [Item_Name], [Item_Description], [UOFM], [Category_ID], [Item_Sales], [Item_SoldBy], [Item_Price], [Item_Cost], [Item_SKU], [Item_Barcode], [Composite_Item], [Track_Stock], [InStock], [LowStock], [Tax_ID], [Representation], [Item_Color], [Item_Shape], [Item_Image], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'ITM0003', N'SITE0001', N'SERAGAM SD', N'SERAGAM SD', N'', N'CAT0001', 1, 1, CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), N'00001001', N'00001001', 0, 1, 800, 10, N'TAX0001', 0, N'bg-red', N'', N'', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime), N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_Item] ([Item_Number], [Site_ID], [Item_Name], [Item_Description], [UOFM], [Category_ID], [Item_Sales], [Item_SoldBy], [Item_Price], [Item_Cost], [Item_SKU], [Item_Barcode], [Composite_Item], [Track_Stock], [InStock], [LowStock], [Tax_ID], [Representation], [Item_Color], [Item_Shape], [Item_Image], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'ITM0003', N'SITE0002', N'SERAGAM SD', N'SERAGAM SD', N'', N'CAT0001', 1, 1, CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), N'00001001', N'00001001', 0, 1, 0, 10, N'TAX0001', 0, N'bg-red', N'', N'', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime), N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_Item] ([Item_Number], [Site_ID], [Item_Name], [Item_Description], [UOFM], [Category_ID], [Item_Sales], [Item_SoldBy], [Item_Price], [Item_Cost], [Item_SKU], [Item_Barcode], [Composite_Item], [Track_Stock], [InStock], [LowStock], [Tax_ID], [Representation], [Item_Color], [Item_Shape], [Item_Image], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'ITM0003', N'SITE0003', N'SERAGAM SD', N'SERAGAM SD', N'', N'CAT0001', 1, 1, CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), N'00001001', N'00001001', 0, 1, 0, 10, N'TAX0001', 0, N'bg-red', N'', N'', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime), N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_Item] ([Item_Number], [Site_ID], [Item_Name], [Item_Description], [UOFM], [Category_ID], [Item_Sales], [Item_SoldBy], [Item_Price], [Item_Cost], [Item_SKU], [Item_Barcode], [Composite_Item], [Track_Stock], [InStock], [LowStock], [Tax_ID], [Representation], [Item_Color], [Item_Shape], [Item_Image], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'ITM0004', N'SITE0001', N'SERAGAM SMP', N'SERAGAM SMP', N'', N'CAT0002', 1, 1, CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), N'00002001', N'00002001', 0, 1, 800, 10, N'TAX0001', 0, N'bg-blue', N'', N'', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime), N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_Item] ([Item_Number], [Site_ID], [Item_Name], [Item_Description], [UOFM], [Category_ID], [Item_Sales], [Item_SoldBy], [Item_Price], [Item_Cost], [Item_SKU], [Item_Barcode], [Composite_Item], [Track_Stock], [InStock], [LowStock], [Tax_ID], [Representation], [Item_Color], [Item_Shape], [Item_Image], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'ITM0004', N'SITE0002', N'SERAGAM SMP', N'SERAGAM SMP', N'', N'CAT0002', 1, 1, CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), N'00002001', N'00002001', 0, 1, 0, 10, N'TAX0001', 0, N'bg-blue', N'', N'', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime), N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_Item] ([Item_Number], [Site_ID], [Item_Name], [Item_Description], [UOFM], [Category_ID], [Item_Sales], [Item_SoldBy], [Item_Price], [Item_Cost], [Item_SKU], [Item_Barcode], [Composite_Item], [Track_Stock], [InStock], [LowStock], [Tax_ID], [Representation], [Item_Color], [Item_Shape], [Item_Image], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'ITM0004', N'SITE0003', N'SERAGAM SMP', N'SERAGAM SMP', N'', N'CAT0002', 1, 1, CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), N'00002001', N'00002001', 0, 1, 0, 10, N'TAX0001', 0, N'bg-blue', N'', N'', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime), N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_Item] ([Item_Number], [Site_ID], [Item_Name], [Item_Description], [UOFM], [Category_ID], [Item_Sales], [Item_SoldBy], [Item_Price], [Item_Cost], [Item_SKU], [Item_Barcode], [Composite_Item], [Track_Stock], [InStock], [LowStock], [Tax_ID], [Representation], [Item_Color], [Item_Shape], [Item_Image], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'ITM0005', N'SITE0001', N'SERAGAM SMA', N'SERAGAM SMA', N'', N'CAT0003', 1, 1, CAST(125000.00000 AS Numeric(19, 5)), CAST(85000.00000 AS Numeric(19, 5)), N'00003001', N'00003001', 0, 1, 800, 10, N'TAX0001', 0, N'bg-gray-light', N'', N'', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime), N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_Item] ([Item_Number], [Site_ID], [Item_Name], [Item_Description], [UOFM], [Category_ID], [Item_Sales], [Item_SoldBy], [Item_Price], [Item_Cost], [Item_SKU], [Item_Barcode], [Composite_Item], [Track_Stock], [InStock], [LowStock], [Tax_ID], [Representation], [Item_Color], [Item_Shape], [Item_Image], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'ITM0005', N'SITE0002', N'SERAGAM SMA', N'SERAGAM SMA', N'', N'CAT0003', 1, 1, CAST(125000.00000 AS Numeric(19, 5)), CAST(85000.00000 AS Numeric(19, 5)), N'00003001', N'00003001', 0, 1, 0, 10, N'TAX0001', 0, N'bg-gray-light', N'', N'', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime), N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_Item] ([Item_Number], [Site_ID], [Item_Name], [Item_Description], [UOFM], [Category_ID], [Item_Sales], [Item_SoldBy], [Item_Price], [Item_Cost], [Item_SKU], [Item_Barcode], [Composite_Item], [Track_Stock], [InStock], [LowStock], [Tax_ID], [Representation], [Item_Color], [Item_Shape], [Item_Image], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'ITM0005', N'SITE0003', N'SERAGAM SMA', N'SERAGAM SMA', N'', N'CAT0003', 1, 1, CAST(125000.00000 AS Numeric(19, 5)), CAST(85000.00000 AS Numeric(19, 5)), N'00003001', N'00003001', 0, 1, 0, 10, N'TAX0001', 0, N'bg-gray-light', N'', N'', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime), N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_Item_History] ([Item_Number], [Site_ID], [Item_Name], [Item_Description], [Line_Item], [UOFM], [Category_ID], [Item_Sales], [Item_SoldBy], [Item_Price], [Item_Cost], [Item_SKU], [Item_Barcode], [Composite_Item], [Track_Stock], [InStock], [LowStock], [Tax_ID], [Representation], [Item_Color], [Item_Shape], [Item_Image], [Created_User], [Created_Date]) VALUES (N'ITM0001', N'SITE0001', N'BODYPACK', N'BODYPACK', 0, N'', N'CAT0004', 1, 1, CAST(175000.00000 AS Numeric(19, 5)), CAST(125000.00000 AS Numeric(19, 5)), N'00004001', N'00004001', 0, 1, 100, 10, N'TAX0001', 0, N'bg-yellow', N'', N'', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_Item_History] ([Item_Number], [Site_ID], [Item_Name], [Item_Description], [Line_Item], [UOFM], [Category_ID], [Item_Sales], [Item_SoldBy], [Item_Price], [Item_Cost], [Item_SKU], [Item_Barcode], [Composite_Item], [Track_Stock], [InStock], [LowStock], [Tax_ID], [Representation], [Item_Color], [Item_Shape], [Item_Image], [Created_User], [Created_Date]) VALUES (N'ITM0001', N'SITE0002', N'BODYPACK', N'BODYPACK', 0, N'', N'CAT0004', 1, 1, CAST(175000.00000 AS Numeric(19, 5)), CAST(125000.00000 AS Numeric(19, 5)), N'00004001', N'00004001', 0, 1, 0, 10, N'TAX0001', 0, N'bg-yellow', N'', N'', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_Item_History] ([Item_Number], [Site_ID], [Item_Name], [Item_Description], [Line_Item], [UOFM], [Category_ID], [Item_Sales], [Item_SoldBy], [Item_Price], [Item_Cost], [Item_SKU], [Item_Barcode], [Composite_Item], [Track_Stock], [InStock], [LowStock], [Tax_ID], [Representation], [Item_Color], [Item_Shape], [Item_Image], [Created_User], [Created_Date]) VALUES (N'ITM0001', N'SITE0003', N'BODYPACK', N'BODYPACK', 0, N'', N'CAT0004', 1, 1, CAST(175000.00000 AS Numeric(19, 5)), CAST(125000.00000 AS Numeric(19, 5)), N'00004001', N'00004001', 0, 1, 0, 10, N'TAX0001', 0, N'bg-yellow', N'', N'', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_Item_History] ([Item_Number], [Site_ID], [Item_Name], [Item_Description], [Line_Item], [UOFM], [Category_ID], [Item_Sales], [Item_SoldBy], [Item_Price], [Item_Cost], [Item_SKU], [Item_Barcode], [Composite_Item], [Track_Stock], [InStock], [LowStock], [Tax_ID], [Representation], [Item_Color], [Item_Shape], [Item_Image], [Created_User], [Created_Date]) VALUES (N'ITM0001', N'SITE0001', N'BODYPACK', N'BODYPACK', 1, N'', N'CAT0004', 1, 1, CAST(175000.00000 AS Numeric(19, 5)), CAST(125000.00000 AS Numeric(19, 5)), N'00004001', N'00004001', 0, 1, 100, 10, N'TAX0001', 0, N'bg-yellow', N'', N'', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_Item_History] ([Item_Number], [Site_ID], [Item_Name], [Item_Description], [Line_Item], [UOFM], [Category_ID], [Item_Sales], [Item_SoldBy], [Item_Price], [Item_Cost], [Item_SKU], [Item_Barcode], [Composite_Item], [Track_Stock], [InStock], [LowStock], [Tax_ID], [Representation], [Item_Color], [Item_Shape], [Item_Image], [Created_User], [Created_Date]) VALUES (N'ITM0001', N'SITE0002', N'BODYPACK', N'BODYPACK', 1, N'', N'CAT0004', 1, 1, CAST(175000.00000 AS Numeric(19, 5)), CAST(125000.00000 AS Numeric(19, 5)), N'00004001', N'00004001', 0, 1, 0, 10, N'TAX0001', 0, N'bg-yellow', N'', N'', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_Item_History] ([Item_Number], [Site_ID], [Item_Name], [Item_Description], [Line_Item], [UOFM], [Category_ID], [Item_Sales], [Item_SoldBy], [Item_Price], [Item_Cost], [Item_SKU], [Item_Barcode], [Composite_Item], [Track_Stock], [InStock], [LowStock], [Tax_ID], [Representation], [Item_Color], [Item_Shape], [Item_Image], [Created_User], [Created_Date]) VALUES (N'ITM0001', N'SITE0003', N'BODYPACK', N'BODYPACK', 1, N'', N'CAT0004', 1, 1, CAST(175000.00000 AS Numeric(19, 5)), CAST(125000.00000 AS Numeric(19, 5)), N'00004001', N'00004001', 0, 1, 0, 10, N'TAX0001', 0, N'bg-yellow', N'', N'', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_Item_History] ([Item_Number], [Site_ID], [Item_Name], [Item_Description], [Line_Item], [UOFM], [Category_ID], [Item_Sales], [Item_SoldBy], [Item_Price], [Item_Cost], [Item_SKU], [Item_Barcode], [Composite_Item], [Track_Stock], [InStock], [LowStock], [Tax_ID], [Representation], [Item_Color], [Item_Shape], [Item_Image], [Created_User], [Created_Date]) VALUES (N'ITM0002', N'SITE0001', N'SMIGGLE', N'SMIGGLE', 0, N'', N'CAT0004', 1, 1, CAST(185000.00000 AS Numeric(19, 5)), CAST(150000.00000 AS Numeric(19, 5)), N'00005001', N'00005001', 0, 1, 100, 10, N'', 0, N'bg-pink', N'', N'', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_Item_History] ([Item_Number], [Site_ID], [Item_Name], [Item_Description], [Line_Item], [UOFM], [Category_ID], [Item_Sales], [Item_SoldBy], [Item_Price], [Item_Cost], [Item_SKU], [Item_Barcode], [Composite_Item], [Track_Stock], [InStock], [LowStock], [Tax_ID], [Representation], [Item_Color], [Item_Shape], [Item_Image], [Created_User], [Created_Date]) VALUES (N'ITM0002', N'SITE0002', N'SMIGGLE', N'SMIGGLE', 0, N'', N'CAT0004', 1, 1, CAST(185000.00000 AS Numeric(19, 5)), CAST(150000.00000 AS Numeric(19, 5)), N'00005001', N'00005001', 0, 1, 0, 10, N'', 0, N'bg-pink', N'', N'', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_Item_History] ([Item_Number], [Site_ID], [Item_Name], [Item_Description], [Line_Item], [UOFM], [Category_ID], [Item_Sales], [Item_SoldBy], [Item_Price], [Item_Cost], [Item_SKU], [Item_Barcode], [Composite_Item], [Track_Stock], [InStock], [LowStock], [Tax_ID], [Representation], [Item_Color], [Item_Shape], [Item_Image], [Created_User], [Created_Date]) VALUES (N'ITM0002', N'SITE0003', N'SMIGGLE', N'SMIGGLE', 0, N'', N'CAT0004', 1, 1, CAST(185000.00000 AS Numeric(19, 5)), CAST(150000.00000 AS Numeric(19, 5)), N'00005001', N'00005001', 0, 1, 0, 10, N'', 0, N'bg-pink', N'', N'', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_Item_History] ([Item_Number], [Site_ID], [Item_Name], [Item_Description], [Line_Item], [UOFM], [Category_ID], [Item_Sales], [Item_SoldBy], [Item_Price], [Item_Cost], [Item_SKU], [Item_Barcode], [Composite_Item], [Track_Stock], [InStock], [LowStock], [Tax_ID], [Representation], [Item_Color], [Item_Shape], [Item_Image], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0001', N'SERAGAM SD', N'SERAGAM SD', 0, N'', N'CAT0001', 1, 1, CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), N'00001001', N'00001001', 0, 1, 800, 10, N'TAX0001', 0, N'bg-red', N'', N'', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_Item_History] ([Item_Number], [Site_ID], [Item_Name], [Item_Description], [Line_Item], [UOFM], [Category_ID], [Item_Sales], [Item_SoldBy], [Item_Price], [Item_Cost], [Item_SKU], [Item_Barcode], [Composite_Item], [Track_Stock], [InStock], [LowStock], [Tax_ID], [Representation], [Item_Color], [Item_Shape], [Item_Image], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0002', N'SERAGAM SD', N'SERAGAM SD', 0, N'', N'CAT0001', 1, 1, CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), N'00001001', N'00001001', 0, 1, 0, 10, N'TAX0001', 0, N'bg-red', N'', N'', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_Item_History] ([Item_Number], [Site_ID], [Item_Name], [Item_Description], [Line_Item], [UOFM], [Category_ID], [Item_Sales], [Item_SoldBy], [Item_Price], [Item_Cost], [Item_SKU], [Item_Barcode], [Composite_Item], [Track_Stock], [InStock], [LowStock], [Tax_ID], [Representation], [Item_Color], [Item_Shape], [Item_Image], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0003', N'SERAGAM SD', N'SERAGAM SD', 0, N'', N'CAT0001', 1, 1, CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), N'00001001', N'00001001', 0, 1, 0, 10, N'TAX0001', 0, N'bg-red', N'', N'', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_Item_History] ([Item_Number], [Site_ID], [Item_Name], [Item_Description], [Line_Item], [UOFM], [Category_ID], [Item_Sales], [Item_SoldBy], [Item_Price], [Item_Cost], [Item_SKU], [Item_Barcode], [Composite_Item], [Track_Stock], [InStock], [LowStock], [Tax_ID], [Representation], [Item_Color], [Item_Shape], [Item_Image], [Created_User], [Created_Date]) VALUES (N'ITM0004', N'SITE0001', N'SERAGAM SMP', N'SERAGAM SMP', 0, N'', N'CAT0002', 1, 1, CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), N'00002001', N'00002001', 0, 1, 800, 10, N'TAX0001', 0, N'bg-blue', N'', N'', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_Item_History] ([Item_Number], [Site_ID], [Item_Name], [Item_Description], [Line_Item], [UOFM], [Category_ID], [Item_Sales], [Item_SoldBy], [Item_Price], [Item_Cost], [Item_SKU], [Item_Barcode], [Composite_Item], [Track_Stock], [InStock], [LowStock], [Tax_ID], [Representation], [Item_Color], [Item_Shape], [Item_Image], [Created_User], [Created_Date]) VALUES (N'ITM0004', N'SITE0002', N'SERAGAM SMP', N'SERAGAM SMP', 0, N'', N'CAT0002', 1, 1, CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), N'00002001', N'00002001', 0, 1, 0, 10, N'TAX0001', 0, N'bg-blue', N'', N'', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_Item_History] ([Item_Number], [Site_ID], [Item_Name], [Item_Description], [Line_Item], [UOFM], [Category_ID], [Item_Sales], [Item_SoldBy], [Item_Price], [Item_Cost], [Item_SKU], [Item_Barcode], [Composite_Item], [Track_Stock], [InStock], [LowStock], [Tax_ID], [Representation], [Item_Color], [Item_Shape], [Item_Image], [Created_User], [Created_Date]) VALUES (N'ITM0004', N'SITE0003', N'SERAGAM SMP', N'SERAGAM SMP', 0, N'', N'CAT0002', 1, 1, CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), N'00002001', N'00002001', 0, 1, 0, 10, N'TAX0001', 0, N'bg-blue', N'', N'', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_Item_History] ([Item_Number], [Site_ID], [Item_Name], [Item_Description], [Line_Item], [UOFM], [Category_ID], [Item_Sales], [Item_SoldBy], [Item_Price], [Item_Cost], [Item_SKU], [Item_Barcode], [Composite_Item], [Track_Stock], [InStock], [LowStock], [Tax_ID], [Representation], [Item_Color], [Item_Shape], [Item_Image], [Created_User], [Created_Date]) VALUES (N'ITM0005', N'SITE0001', N'SERAGAM SMA', N'SERAGAM SMA', 0, N'', N'CAT0003', 1, 1, CAST(125000.00000 AS Numeric(19, 5)), CAST(85000.00000 AS Numeric(19, 5)), N'00003001', N'00003001', 0, 1, 800, 10, N'TAX0001', 0, N'bg-gray-light', N'', N'', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_Item_History] ([Item_Number], [Site_ID], [Item_Name], [Item_Description], [Line_Item], [UOFM], [Category_ID], [Item_Sales], [Item_SoldBy], [Item_Price], [Item_Cost], [Item_SKU], [Item_Barcode], [Composite_Item], [Track_Stock], [InStock], [LowStock], [Tax_ID], [Representation], [Item_Color], [Item_Shape], [Item_Image], [Created_User], [Created_Date]) VALUES (N'ITM0005', N'SITE0002', N'SERAGAM SMA', N'SERAGAM SMA', 0, N'', N'CAT0003', 1, 1, CAST(125000.00000 AS Numeric(19, 5)), CAST(85000.00000 AS Numeric(19, 5)), N'00003001', N'00003001', 0, 1, 0, 10, N'TAX0001', 0, N'bg-gray-light', N'', N'', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_Item_History] ([Item_Number], [Site_ID], [Item_Name], [Item_Description], [Line_Item], [UOFM], [Category_ID], [Item_Sales], [Item_SoldBy], [Item_Price], [Item_Cost], [Item_SKU], [Item_Barcode], [Composite_Item], [Track_Stock], [InStock], [LowStock], [Tax_ID], [Representation], [Item_Color], [Item_Shape], [Item_Image], [Created_User], [Created_Date]) VALUES (N'ITM0005', N'SITE0003', N'SERAGAM SMA', N'SERAGAM SMA', 0, N'', N'CAT0003', 1, 1, CAST(125000.00000 AS Numeric(19, 5)), CAST(85000.00000 AS Numeric(19, 5)), N'00003001', N'00003001', 0, 1, 0, 10, N'TAX0001', 0, N'bg-gray-light', N'', N'', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_Item_History] ([Item_Number], [Site_ID], [Item_Name], [Item_Description], [Line_Item], [UOFM], [Category_ID], [Item_Sales], [Item_SoldBy], [Item_Price], [Item_Cost], [Item_SKU], [Item_Barcode], [Composite_Item], [Track_Stock], [InStock], [LowStock], [Tax_ID], [Representation], [Item_Color], [Item_Shape], [Item_Image], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0001', N'SERAGAM SD', N'SERAGAM SD', 1, N'', N'CAT0001', 1, 1, CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), N'00001001', N'00001001', 0, 1, 800, 10, N'TAX0001', 0, N'bg-red', N'', N'', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_Item_History] ([Item_Number], [Site_ID], [Item_Name], [Item_Description], [Line_Item], [UOFM], [Category_ID], [Item_Sales], [Item_SoldBy], [Item_Price], [Item_Cost], [Item_SKU], [Item_Barcode], [Composite_Item], [Track_Stock], [InStock], [LowStock], [Tax_ID], [Representation], [Item_Color], [Item_Shape], [Item_Image], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0002', N'SERAGAM SD', N'SERAGAM SD', 1, N'', N'CAT0001', 1, 1, CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), N'00001001', N'00001001', 0, 1, 0, 10, N'TAX0001', 0, N'bg-red', N'', N'', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_Item_History] ([Item_Number], [Site_ID], [Item_Name], [Item_Description], [Line_Item], [UOFM], [Category_ID], [Item_Sales], [Item_SoldBy], [Item_Price], [Item_Cost], [Item_SKU], [Item_Barcode], [Composite_Item], [Track_Stock], [InStock], [LowStock], [Tax_ID], [Representation], [Item_Color], [Item_Shape], [Item_Image], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0003', N'SERAGAM SD', N'SERAGAM SD', 1, N'', N'CAT0001', 1, 1, CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), N'00001001', N'00001001', 0, 1, 0, 10, N'TAX0001', 0, N'bg-red', N'', N'', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_Item_History] ([Item_Number], [Site_ID], [Item_Name], [Item_Description], [Line_Item], [UOFM], [Category_ID], [Item_Sales], [Item_SoldBy], [Item_Price], [Item_Cost], [Item_SKU], [Item_Barcode], [Composite_Item], [Track_Stock], [InStock], [LowStock], [Tax_ID], [Representation], [Item_Color], [Item_Shape], [Item_Image], [Created_User], [Created_Date]) VALUES (N'ITM0004', N'SITE0001', N'SERAGAM SMP', N'SERAGAM SMP', 1, N'', N'CAT0002', 1, 1, CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), N'00002001', N'00002001', 0, 1, 800, 10, N'TAX0001', 0, N'bg-blue', N'', N'', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_Item_History] ([Item_Number], [Site_ID], [Item_Name], [Item_Description], [Line_Item], [UOFM], [Category_ID], [Item_Sales], [Item_SoldBy], [Item_Price], [Item_Cost], [Item_SKU], [Item_Barcode], [Composite_Item], [Track_Stock], [InStock], [LowStock], [Tax_ID], [Representation], [Item_Color], [Item_Shape], [Item_Image], [Created_User], [Created_Date]) VALUES (N'ITM0004', N'SITE0002', N'SERAGAM SMP', N'SERAGAM SMP', 1, N'', N'CAT0002', 1, 1, CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), N'00002001', N'00002001', 0, 1, 0, 10, N'TAX0001', 0, N'bg-blue', N'', N'', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_Item_History] ([Item_Number], [Site_ID], [Item_Name], [Item_Description], [Line_Item], [UOFM], [Category_ID], [Item_Sales], [Item_SoldBy], [Item_Price], [Item_Cost], [Item_SKU], [Item_Barcode], [Composite_Item], [Track_Stock], [InStock], [LowStock], [Tax_ID], [Representation], [Item_Color], [Item_Shape], [Item_Image], [Created_User], [Created_Date]) VALUES (N'ITM0004', N'SITE0003', N'SERAGAM SMP', N'SERAGAM SMP', 1, N'', N'CAT0002', 1, 1, CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), N'00002001', N'00002001', 0, 1, 0, 10, N'TAX0001', 0, N'bg-blue', N'', N'', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_Item_History] ([Item_Number], [Site_ID], [Item_Name], [Item_Description], [Line_Item], [UOFM], [Category_ID], [Item_Sales], [Item_SoldBy], [Item_Price], [Item_Cost], [Item_SKU], [Item_Barcode], [Composite_Item], [Track_Stock], [InStock], [LowStock], [Tax_ID], [Representation], [Item_Color], [Item_Shape], [Item_Image], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0001', N'SERAGAM SD', N'SERAGAM SD', 2, N'', N'CAT0001', 1, 1, CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), N'00001001', N'00001001', 0, 1, 800, 10, N'TAX0001', 0, N'bg-red', N'', N'', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_Item_History] ([Item_Number], [Site_ID], [Item_Name], [Item_Description], [Line_Item], [UOFM], [Category_ID], [Item_Sales], [Item_SoldBy], [Item_Price], [Item_Cost], [Item_SKU], [Item_Barcode], [Composite_Item], [Track_Stock], [InStock], [LowStock], [Tax_ID], [Representation], [Item_Color], [Item_Shape], [Item_Image], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0002', N'SERAGAM SD', N'SERAGAM SD', 2, N'', N'CAT0001', 1, 1, CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), N'00001001', N'00001001', 0, 1, 0, 10, N'TAX0001', 0, N'bg-red', N'', N'', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_Item_History] ([Item_Number], [Site_ID], [Item_Name], [Item_Description], [Line_Item], [UOFM], [Category_ID], [Item_Sales], [Item_SoldBy], [Item_Price], [Item_Cost], [Item_SKU], [Item_Barcode], [Composite_Item], [Track_Stock], [InStock], [LowStock], [Tax_ID], [Representation], [Item_Color], [Item_Shape], [Item_Image], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0003', N'SERAGAM SD', N'SERAGAM SD', 2, N'', N'CAT0001', 1, 1, CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), N'00001001', N'00001001', 0, 1, 0, 10, N'TAX0001', 0, N'bg-red', N'', N'', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_Item_History] ([Item_Number], [Site_ID], [Item_Name], [Item_Description], [Line_Item], [UOFM], [Category_ID], [Item_Sales], [Item_SoldBy], [Item_Price], [Item_Cost], [Item_SKU], [Item_Barcode], [Composite_Item], [Track_Stock], [InStock], [LowStock], [Tax_ID], [Representation], [Item_Color], [Item_Shape], [Item_Image], [Created_User], [Created_Date]) VALUES (N'ITM0004', N'SITE0001', N'SERAGAM SMP', N'SERAGAM SMP', 2, N'', N'CAT0002', 1, 1, CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), N'00002001', N'00002001', 0, 1, 800, 10, N'TAX0001', 0, N'bg-blue', N'', N'', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_Item_History] ([Item_Number], [Site_ID], [Item_Name], [Item_Description], [Line_Item], [UOFM], [Category_ID], [Item_Sales], [Item_SoldBy], [Item_Price], [Item_Cost], [Item_SKU], [Item_Barcode], [Composite_Item], [Track_Stock], [InStock], [LowStock], [Tax_ID], [Representation], [Item_Color], [Item_Shape], [Item_Image], [Created_User], [Created_Date]) VALUES (N'ITM0004', N'SITE0002', N'SERAGAM SMP', N'SERAGAM SMP', 2, N'', N'CAT0002', 1, 1, CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), N'00002001', N'00002001', 0, 1, 0, 10, N'TAX0001', 0, N'bg-blue', N'', N'', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_Item_History] ([Item_Number], [Site_ID], [Item_Name], [Item_Description], [Line_Item], [UOFM], [Category_ID], [Item_Sales], [Item_SoldBy], [Item_Price], [Item_Cost], [Item_SKU], [Item_Barcode], [Composite_Item], [Track_Stock], [InStock], [LowStock], [Tax_ID], [Representation], [Item_Color], [Item_Shape], [Item_Image], [Created_User], [Created_Date]) VALUES (N'ITM0004', N'SITE0003', N'SERAGAM SMP', N'SERAGAM SMP', 2, N'', N'CAT0002', 1, 1, CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), N'00002001', N'00002001', 0, 1, 0, 10, N'TAX0001', 0, N'bg-blue', N'', N'', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_Item_History] ([Item_Number], [Site_ID], [Item_Name], [Item_Description], [Line_Item], [UOFM], [Category_ID], [Item_Sales], [Item_SoldBy], [Item_Price], [Item_Cost], [Item_SKU], [Item_Barcode], [Composite_Item], [Track_Stock], [InStock], [LowStock], [Tax_ID], [Representation], [Item_Color], [Item_Shape], [Item_Image], [Created_User], [Created_Date]) VALUES (N'ITM0002', N'SITE0001', N'SMIGGLE', N'SMIGGLE', 1, N'', N'CAT0004', 1, 1, CAST(185000.00000 AS Numeric(19, 5)), CAST(150000.00000 AS Numeric(19, 5)), N'00005001', N'00005001', 0, 1, 100, 10, N'TAX0001', 0, N'bg-pink', N'', N'', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_Item_History] ([Item_Number], [Site_ID], [Item_Name], [Item_Description], [Line_Item], [UOFM], [Category_ID], [Item_Sales], [Item_SoldBy], [Item_Price], [Item_Cost], [Item_SKU], [Item_Barcode], [Composite_Item], [Track_Stock], [InStock], [LowStock], [Tax_ID], [Representation], [Item_Color], [Item_Shape], [Item_Image], [Created_User], [Created_Date]) VALUES (N'ITM0002', N'SITE0002', N'SMIGGLE', N'SMIGGLE', 1, N'', N'CAT0004', 1, 1, CAST(185000.00000 AS Numeric(19, 5)), CAST(150000.00000 AS Numeric(19, 5)), N'00005001', N'00005001', 0, 1, 0, 10, N'TAX0001', 0, N'bg-pink', N'', N'', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_Item_History] ([Item_Number], [Site_ID], [Item_Name], [Item_Description], [Line_Item], [UOFM], [Category_ID], [Item_Sales], [Item_SoldBy], [Item_Price], [Item_Cost], [Item_SKU], [Item_Barcode], [Composite_Item], [Track_Stock], [InStock], [LowStock], [Tax_ID], [Representation], [Item_Color], [Item_Shape], [Item_Image], [Created_User], [Created_Date]) VALUES (N'ITM0002', N'SITE0003', N'SMIGGLE', N'SMIGGLE', 1, N'', N'CAT0004', 1, 1, CAST(185000.00000 AS Numeric(19, 5)), CAST(150000.00000 AS Numeric(19, 5)), N'00005001', N'00005001', 0, 1, 0, 10, N'TAX0001', 0, N'bg-pink', N'', N'', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_Item_History] ([Item_Number], [Site_ID], [Item_Name], [Item_Description], [Line_Item], [UOFM], [Category_ID], [Item_Sales], [Item_SoldBy], [Item_Price], [Item_Cost], [Item_SKU], [Item_Barcode], [Composite_Item], [Track_Stock], [InStock], [LowStock], [Tax_ID], [Representation], [Item_Color], [Item_Shape], [Item_Image], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0001', N'SERAGAM SD', N'SERAGAM SD', 3, N'', N'CAT0001', 1, 1, CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), N'00001001', N'00001001', 0, 1, 800, 10, N'TAX0001', 0, N'bg-red', N'', N'', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_Item_History] ([Item_Number], [Site_ID], [Item_Name], [Item_Description], [Line_Item], [UOFM], [Category_ID], [Item_Sales], [Item_SoldBy], [Item_Price], [Item_Cost], [Item_SKU], [Item_Barcode], [Composite_Item], [Track_Stock], [InStock], [LowStock], [Tax_ID], [Representation], [Item_Color], [Item_Shape], [Item_Image], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0002', N'SERAGAM SD', N'SERAGAM SD', 3, N'', N'CAT0001', 1, 1, CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), N'00001001', N'00001001', 0, 1, 0, 10, N'TAX0001', 0, N'bg-red', N'', N'', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_Item_History] ([Item_Number], [Site_ID], [Item_Name], [Item_Description], [Line_Item], [UOFM], [Category_ID], [Item_Sales], [Item_SoldBy], [Item_Price], [Item_Cost], [Item_SKU], [Item_Barcode], [Composite_Item], [Track_Stock], [InStock], [LowStock], [Tax_ID], [Representation], [Item_Color], [Item_Shape], [Item_Image], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0003', N'SERAGAM SD', N'SERAGAM SD', 3, N'', N'CAT0001', 1, 1, CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), N'00001001', N'00001001', 0, 1, 0, 10, N'TAX0001', 0, N'bg-red', N'', N'', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant] ([Item_Number], [Site_ID], [LineItem_Option], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'ITM0003', N'SITE0001', CAST(1.00000 AS Numeric(19, 5)), 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(1.00000 AS Numeric(19, 5)), N'S / GS', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00001001', N'00001001', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime), N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant] ([Item_Number], [Site_ID], [LineItem_Option], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'ITM0003', N'SITE0001', CAST(2.00000 AS Numeric(19, 5)), 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(2.00000 AS Numeric(19, 5)), N'S / SUPER', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00001002', N'00001002', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime), N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant] ([Item_Number], [Site_ID], [LineItem_Option], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'ITM0003', N'SITE0001', CAST(3.00000 AS Numeric(19, 5)), 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(3.00000 AS Numeric(19, 5)), N'M / GS', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00001003', N'00001003', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime), N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant] ([Item_Number], [Site_ID], [LineItem_Option], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'ITM0003', N'SITE0001', CAST(4.00000 AS Numeric(19, 5)), 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(4.00000 AS Numeric(19, 5)), N'M / SUPER', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00001004', N'00001004', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime), N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant] ([Item_Number], [Site_ID], [LineItem_Option], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'ITM0003', N'SITE0001', CAST(5.00000 AS Numeric(19, 5)), 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(5.00000 AS Numeric(19, 5)), N'L / GS', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00001005', N'00001005', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime), N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant] ([Item_Number], [Site_ID], [LineItem_Option], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'ITM0003', N'SITE0001', CAST(6.00000 AS Numeric(19, 5)), 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(6.00000 AS Numeric(19, 5)), N'L / SUPER', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00001006', N'00001006', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime), N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant] ([Item_Number], [Site_ID], [LineItem_Option], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'ITM0003', N'SITE0001', CAST(7.00000 AS Numeric(19, 5)), 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(7.00000 AS Numeric(19, 5)), N'XL / GS', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00001007', N'00001007', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime), N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant] ([Item_Number], [Site_ID], [LineItem_Option], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'ITM0003', N'SITE0001', CAST(8.00000 AS Numeric(19, 5)), 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(8.00000 AS Numeric(19, 5)), N'XL / SUPER', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00001008', N'00001008', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime), N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant] ([Item_Number], [Site_ID], [LineItem_Option], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'ITM0003', N'SITE0002', CAST(1.00000 AS Numeric(19, 5)), 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(1.00000 AS Numeric(19, 5)), N'S / GS', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00001001', N'00001001', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime), N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant] ([Item_Number], [Site_ID], [LineItem_Option], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'ITM0003', N'SITE0002', CAST(2.00000 AS Numeric(19, 5)), 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(2.00000 AS Numeric(19, 5)), N'S / SUPER', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00001002', N'00001002', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime), N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant] ([Item_Number], [Site_ID], [LineItem_Option], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'ITM0003', N'SITE0002', CAST(3.00000 AS Numeric(19, 5)), 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(3.00000 AS Numeric(19, 5)), N'M / GS', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00001003', N'00001003', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime), N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant] ([Item_Number], [Site_ID], [LineItem_Option], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'ITM0003', N'SITE0002', CAST(4.00000 AS Numeric(19, 5)), 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(4.00000 AS Numeric(19, 5)), N'M / SUPER', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00001004', N'00001004', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime), N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant] ([Item_Number], [Site_ID], [LineItem_Option], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'ITM0003', N'SITE0002', CAST(5.00000 AS Numeric(19, 5)), 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(5.00000 AS Numeric(19, 5)), N'L / GS', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00001005', N'00001005', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime), N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant] ([Item_Number], [Site_ID], [LineItem_Option], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'ITM0003', N'SITE0002', CAST(6.00000 AS Numeric(19, 5)), 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(6.00000 AS Numeric(19, 5)), N'L / SUPER', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00001006', N'00001006', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime), N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant] ([Item_Number], [Site_ID], [LineItem_Option], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'ITM0003', N'SITE0002', CAST(7.00000 AS Numeric(19, 5)), 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(7.00000 AS Numeric(19, 5)), N'XL / GS', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00001007', N'00001007', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime), N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant] ([Item_Number], [Site_ID], [LineItem_Option], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'ITM0003', N'SITE0002', CAST(8.00000 AS Numeric(19, 5)), 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(8.00000 AS Numeric(19, 5)), N'XL / SUPER', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00001008', N'00001008', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime), N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant] ([Item_Number], [Site_ID], [LineItem_Option], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'ITM0003', N'SITE0003', CAST(1.00000 AS Numeric(19, 5)), 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(1.00000 AS Numeric(19, 5)), N'S / GS', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00001001', N'00001001', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime), N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant] ([Item_Number], [Site_ID], [LineItem_Option], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'ITM0003', N'SITE0003', CAST(2.00000 AS Numeric(19, 5)), 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(2.00000 AS Numeric(19, 5)), N'S / SUPER', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00001002', N'00001002', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime), N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant] ([Item_Number], [Site_ID], [LineItem_Option], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'ITM0003', N'SITE0003', CAST(3.00000 AS Numeric(19, 5)), 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(3.00000 AS Numeric(19, 5)), N'M / GS', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00001003', N'00001003', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime), N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant] ([Item_Number], [Site_ID], [LineItem_Option], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'ITM0003', N'SITE0003', CAST(4.00000 AS Numeric(19, 5)), 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(4.00000 AS Numeric(19, 5)), N'M / SUPER', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00001004', N'00001004', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime), N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant] ([Item_Number], [Site_ID], [LineItem_Option], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'ITM0003', N'SITE0003', CAST(5.00000 AS Numeric(19, 5)), 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(5.00000 AS Numeric(19, 5)), N'L / GS', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00001005', N'00001005', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime), N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant] ([Item_Number], [Site_ID], [LineItem_Option], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'ITM0003', N'SITE0003', CAST(6.00000 AS Numeric(19, 5)), 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(6.00000 AS Numeric(19, 5)), N'L / SUPER', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00001006', N'00001006', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime), N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant] ([Item_Number], [Site_ID], [LineItem_Option], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'ITM0003', N'SITE0003', CAST(7.00000 AS Numeric(19, 5)), 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(7.00000 AS Numeric(19, 5)), N'XL / GS', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00001007', N'00001007', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime), N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant] ([Item_Number], [Site_ID], [LineItem_Option], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'ITM0003', N'SITE0003', CAST(8.00000 AS Numeric(19, 5)), 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(8.00000 AS Numeric(19, 5)), N'XL / SUPER', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00001008', N'00001008', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime), N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant] ([Item_Number], [Site_ID], [LineItem_Option], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'ITM0004', N'SITE0001', CAST(1.00000 AS Numeric(19, 5)), 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(1.00000 AS Numeric(19, 5)), N'S / GS', CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00002001', N'00002001', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime), N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant] ([Item_Number], [Site_ID], [LineItem_Option], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'ITM0004', N'SITE0001', CAST(2.00000 AS Numeric(19, 5)), 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(2.00000 AS Numeric(19, 5)), N'S / SUPER', CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00002002', N'00002002', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime), N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant] ([Item_Number], [Site_ID], [LineItem_Option], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'ITM0004', N'SITE0001', CAST(3.00000 AS Numeric(19, 5)), 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(3.00000 AS Numeric(19, 5)), N'M / GS', CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00002003', N'00002003', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime), N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant] ([Item_Number], [Site_ID], [LineItem_Option], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'ITM0004', N'SITE0001', CAST(4.00000 AS Numeric(19, 5)), 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(4.00000 AS Numeric(19, 5)), N'M / SUPER', CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00002004', N'00002004', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime), N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant] ([Item_Number], [Site_ID], [LineItem_Option], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'ITM0004', N'SITE0001', CAST(5.00000 AS Numeric(19, 5)), 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(5.00000 AS Numeric(19, 5)), N'L / GS', CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00002005', N'00002005', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime), N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant] ([Item_Number], [Site_ID], [LineItem_Option], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'ITM0004', N'SITE0001', CAST(6.00000 AS Numeric(19, 5)), 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(6.00000 AS Numeric(19, 5)), N'L / SUPER', CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00002006', N'00002006', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime), N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant] ([Item_Number], [Site_ID], [LineItem_Option], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'ITM0004', N'SITE0001', CAST(7.00000 AS Numeric(19, 5)), 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(7.00000 AS Numeric(19, 5)), N'XL / GS', CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00002007', N'00002007', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime), N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant] ([Item_Number], [Site_ID], [LineItem_Option], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'ITM0004', N'SITE0001', CAST(8.00000 AS Numeric(19, 5)), 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(8.00000 AS Numeric(19, 5)), N'XL / SUPER', CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00002008', N'00002008', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime), N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant] ([Item_Number], [Site_ID], [LineItem_Option], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'ITM0004', N'SITE0002', CAST(1.00000 AS Numeric(19, 5)), 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(1.00000 AS Numeric(19, 5)), N'S / GS', CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00002001', N'00002001', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime), N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant] ([Item_Number], [Site_ID], [LineItem_Option], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'ITM0004', N'SITE0002', CAST(2.00000 AS Numeric(19, 5)), 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(2.00000 AS Numeric(19, 5)), N'S / SUPER', CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00002002', N'00002002', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime), N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant] ([Item_Number], [Site_ID], [LineItem_Option], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'ITM0004', N'SITE0002', CAST(3.00000 AS Numeric(19, 5)), 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(3.00000 AS Numeric(19, 5)), N'M / GS', CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00002003', N'00002003', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime), N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant] ([Item_Number], [Site_ID], [LineItem_Option], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'ITM0004', N'SITE0002', CAST(4.00000 AS Numeric(19, 5)), 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(4.00000 AS Numeric(19, 5)), N'M / SUPER', CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00002004', N'00002004', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime), N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant] ([Item_Number], [Site_ID], [LineItem_Option], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'ITM0004', N'SITE0002', CAST(5.00000 AS Numeric(19, 5)), 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(5.00000 AS Numeric(19, 5)), N'L / GS', CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00002005', N'00002005', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime), N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant] ([Item_Number], [Site_ID], [LineItem_Option], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'ITM0004', N'SITE0002', CAST(6.00000 AS Numeric(19, 5)), 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(6.00000 AS Numeric(19, 5)), N'L / SUPER', CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00002006', N'00002006', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime), N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant] ([Item_Number], [Site_ID], [LineItem_Option], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'ITM0004', N'SITE0002', CAST(7.00000 AS Numeric(19, 5)), 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(7.00000 AS Numeric(19, 5)), N'XL / GS', CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00002007', N'00002007', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime), N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant] ([Item_Number], [Site_ID], [LineItem_Option], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'ITM0004', N'SITE0002', CAST(8.00000 AS Numeric(19, 5)), 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(8.00000 AS Numeric(19, 5)), N'XL / SUPER', CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00002008', N'00002008', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime), N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant] ([Item_Number], [Site_ID], [LineItem_Option], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'ITM0004', N'SITE0003', CAST(1.00000 AS Numeric(19, 5)), 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(1.00000 AS Numeric(19, 5)), N'S / GS', CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00002001', N'00002001', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime), N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant] ([Item_Number], [Site_ID], [LineItem_Option], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'ITM0004', N'SITE0003', CAST(2.00000 AS Numeric(19, 5)), 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(2.00000 AS Numeric(19, 5)), N'S / SUPER', CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00002002', N'00002002', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime), N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant] ([Item_Number], [Site_ID], [LineItem_Option], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'ITM0004', N'SITE0003', CAST(3.00000 AS Numeric(19, 5)), 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(3.00000 AS Numeric(19, 5)), N'M / GS', CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00002003', N'00002003', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime), N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant] ([Item_Number], [Site_ID], [LineItem_Option], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'ITM0004', N'SITE0003', CAST(4.00000 AS Numeric(19, 5)), 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(4.00000 AS Numeric(19, 5)), N'M / SUPER', CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00002004', N'00002004', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime), N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant] ([Item_Number], [Site_ID], [LineItem_Option], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'ITM0004', N'SITE0003', CAST(5.00000 AS Numeric(19, 5)), 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(5.00000 AS Numeric(19, 5)), N'L / GS', CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00002005', N'00002005', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime), N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant] ([Item_Number], [Site_ID], [LineItem_Option], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'ITM0004', N'SITE0003', CAST(6.00000 AS Numeric(19, 5)), 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(6.00000 AS Numeric(19, 5)), N'L / SUPER', CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00002006', N'00002006', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime), N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant] ([Item_Number], [Site_ID], [LineItem_Option], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'ITM0004', N'SITE0003', CAST(7.00000 AS Numeric(19, 5)), 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(7.00000 AS Numeric(19, 5)), N'XL / GS', CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00002007', N'00002007', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime), N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant] ([Item_Number], [Site_ID], [LineItem_Option], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'ITM0004', N'SITE0003', CAST(8.00000 AS Numeric(19, 5)), 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(8.00000 AS Numeric(19, 5)), N'XL / SUPER', CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00002008', N'00002008', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime), N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant] ([Item_Number], [Site_ID], [LineItem_Option], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'ITM0005', N'SITE0001', CAST(1.00000 AS Numeric(19, 5)), 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(1.00000 AS Numeric(19, 5)), N'S / GS', CAST(125000.00000 AS Numeric(19, 5)), CAST(85000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00003001', N'00003001', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime), N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant] ([Item_Number], [Site_ID], [LineItem_Option], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'ITM0005', N'SITE0001', CAST(2.00000 AS Numeric(19, 5)), 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(2.00000 AS Numeric(19, 5)), N'S / SUPER', CAST(125000.00000 AS Numeric(19, 5)), CAST(85000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00003002', N'00003002', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime), N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant] ([Item_Number], [Site_ID], [LineItem_Option], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'ITM0005', N'SITE0001', CAST(3.00000 AS Numeric(19, 5)), 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(3.00000 AS Numeric(19, 5)), N'M / GS', CAST(125000.00000 AS Numeric(19, 5)), CAST(85000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00003003', N'00003003', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime), N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant] ([Item_Number], [Site_ID], [LineItem_Option], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'ITM0005', N'SITE0001', CAST(4.00000 AS Numeric(19, 5)), 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(4.00000 AS Numeric(19, 5)), N'M / SUPER', CAST(125000.00000 AS Numeric(19, 5)), CAST(85000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00003004', N'00003004', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime), N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant] ([Item_Number], [Site_ID], [LineItem_Option], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'ITM0005', N'SITE0001', CAST(5.00000 AS Numeric(19, 5)), 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(5.00000 AS Numeric(19, 5)), N'L / GS', CAST(125000.00000 AS Numeric(19, 5)), CAST(85000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00003005', N'00003005', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime), N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant] ([Item_Number], [Site_ID], [LineItem_Option], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'ITM0005', N'SITE0001', CAST(6.00000 AS Numeric(19, 5)), 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(6.00000 AS Numeric(19, 5)), N'L / SUPER', CAST(125000.00000 AS Numeric(19, 5)), CAST(85000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00003006', N'00003006', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime), N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant] ([Item_Number], [Site_ID], [LineItem_Option], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'ITM0005', N'SITE0001', CAST(7.00000 AS Numeric(19, 5)), 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(7.00000 AS Numeric(19, 5)), N'XL / GS', CAST(125000.00000 AS Numeric(19, 5)), CAST(85000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00003007', N'00003007', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime), N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant] ([Item_Number], [Site_ID], [LineItem_Option], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'ITM0005', N'SITE0001', CAST(8.00000 AS Numeric(19, 5)), 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(8.00000 AS Numeric(19, 5)), N'XL / SUPER', CAST(125000.00000 AS Numeric(19, 5)), CAST(85000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00003008', N'00003008', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime), N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant] ([Item_Number], [Site_ID], [LineItem_Option], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'ITM0005', N'SITE0002', CAST(1.00000 AS Numeric(19, 5)), 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(1.00000 AS Numeric(19, 5)), N'S / GS', CAST(125000.00000 AS Numeric(19, 5)), CAST(85000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00003001', N'00003001', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime), N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant] ([Item_Number], [Site_ID], [LineItem_Option], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'ITM0005', N'SITE0002', CAST(2.00000 AS Numeric(19, 5)), 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(2.00000 AS Numeric(19, 5)), N'S / SUPER', CAST(125000.00000 AS Numeric(19, 5)), CAST(85000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00003002', N'00003002', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime), N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant] ([Item_Number], [Site_ID], [LineItem_Option], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'ITM0005', N'SITE0002', CAST(3.00000 AS Numeric(19, 5)), 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(3.00000 AS Numeric(19, 5)), N'M / GS', CAST(125000.00000 AS Numeric(19, 5)), CAST(85000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00003003', N'00003003', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime), N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant] ([Item_Number], [Site_ID], [LineItem_Option], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'ITM0005', N'SITE0002', CAST(4.00000 AS Numeric(19, 5)), 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(4.00000 AS Numeric(19, 5)), N'M / SUPER', CAST(125000.00000 AS Numeric(19, 5)), CAST(85000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00003004', N'00003004', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime), N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant] ([Item_Number], [Site_ID], [LineItem_Option], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'ITM0005', N'SITE0002', CAST(5.00000 AS Numeric(19, 5)), 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(5.00000 AS Numeric(19, 5)), N'L / GS', CAST(125000.00000 AS Numeric(19, 5)), CAST(85000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00003005', N'00003005', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime), N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant] ([Item_Number], [Site_ID], [LineItem_Option], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'ITM0005', N'SITE0002', CAST(6.00000 AS Numeric(19, 5)), 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(6.00000 AS Numeric(19, 5)), N'L / SUPER', CAST(125000.00000 AS Numeric(19, 5)), CAST(85000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00003006', N'00003006', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime), N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant] ([Item_Number], [Site_ID], [LineItem_Option], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'ITM0005', N'SITE0002', CAST(7.00000 AS Numeric(19, 5)), 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(7.00000 AS Numeric(19, 5)), N'XL / GS', CAST(125000.00000 AS Numeric(19, 5)), CAST(85000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00003007', N'00003007', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime), N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant] ([Item_Number], [Site_ID], [LineItem_Option], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'ITM0005', N'SITE0002', CAST(8.00000 AS Numeric(19, 5)), 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(8.00000 AS Numeric(19, 5)), N'XL / SUPER', CAST(125000.00000 AS Numeric(19, 5)), CAST(85000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00003008', N'00003008', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime), N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant] ([Item_Number], [Site_ID], [LineItem_Option], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'ITM0005', N'SITE0003', CAST(1.00000 AS Numeric(19, 5)), 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(1.00000 AS Numeric(19, 5)), N'S / GS', CAST(125000.00000 AS Numeric(19, 5)), CAST(85000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00003001', N'00003001', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime), N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant] ([Item_Number], [Site_ID], [LineItem_Option], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'ITM0005', N'SITE0003', CAST(2.00000 AS Numeric(19, 5)), 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(2.00000 AS Numeric(19, 5)), N'S / SUPER', CAST(125000.00000 AS Numeric(19, 5)), CAST(85000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00003002', N'00003002', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime), N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant] ([Item_Number], [Site_ID], [LineItem_Option], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'ITM0005', N'SITE0003', CAST(3.00000 AS Numeric(19, 5)), 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(3.00000 AS Numeric(19, 5)), N'M / GS', CAST(125000.00000 AS Numeric(19, 5)), CAST(85000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00003003', N'00003003', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime), N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant] ([Item_Number], [Site_ID], [LineItem_Option], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'ITM0005', N'SITE0003', CAST(4.00000 AS Numeric(19, 5)), 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(4.00000 AS Numeric(19, 5)), N'M / SUPER', CAST(125000.00000 AS Numeric(19, 5)), CAST(85000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00003004', N'00003004', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime), N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant] ([Item_Number], [Site_ID], [LineItem_Option], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'ITM0005', N'SITE0003', CAST(5.00000 AS Numeric(19, 5)), 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(5.00000 AS Numeric(19, 5)), N'L / GS', CAST(125000.00000 AS Numeric(19, 5)), CAST(85000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00003005', N'00003005', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime), N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant] ([Item_Number], [Site_ID], [LineItem_Option], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'ITM0005', N'SITE0003', CAST(6.00000 AS Numeric(19, 5)), 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(6.00000 AS Numeric(19, 5)), N'L / SUPER', CAST(125000.00000 AS Numeric(19, 5)), CAST(85000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00003006', N'00003006', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime), N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant] ([Item_Number], [Site_ID], [LineItem_Option], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'ITM0005', N'SITE0003', CAST(7.00000 AS Numeric(19, 5)), 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(7.00000 AS Numeric(19, 5)), N'XL / GS', CAST(125000.00000 AS Numeric(19, 5)), CAST(85000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00003007', N'00003007', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime), N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant] ([Item_Number], [Site_ID], [LineItem_Option], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'ITM0005', N'SITE0003', CAST(8.00000 AS Numeric(19, 5)), 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(8.00000 AS Numeric(19, 5)), N'XL / SUPER', CAST(125000.00000 AS Numeric(19, 5)), CAST(85000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00003008', N'00003008', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime), N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0001', CAST(1.00000 AS Numeric(19, 5)), 1, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(1.00000 AS Numeric(19, 5)), N'S / GS', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00001001', N'00001001', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0002', CAST(1.00000 AS Numeric(19, 5)), 1, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(1.00000 AS Numeric(19, 5)), N'S / GS', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00001001', N'00001001', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0003', CAST(1.00000 AS Numeric(19, 5)), 1, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(1.00000 AS Numeric(19, 5)), N'S / GS', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00001001', N'00001001', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0001', CAST(2.00000 AS Numeric(19, 5)), 1, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(2.00000 AS Numeric(19, 5)), N'S / SUPER', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00001002', N'00001002', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0002', CAST(2.00000 AS Numeric(19, 5)), 1, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(2.00000 AS Numeric(19, 5)), N'S / SUPER', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00001002', N'00001002', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0003', CAST(2.00000 AS Numeric(19, 5)), 1, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(2.00000 AS Numeric(19, 5)), N'S / SUPER', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00001002', N'00001002', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0001', CAST(3.00000 AS Numeric(19, 5)), 1, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(3.00000 AS Numeric(19, 5)), N'M / GS', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00001003', N'00001003', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0002', CAST(3.00000 AS Numeric(19, 5)), 1, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(3.00000 AS Numeric(19, 5)), N'M / GS', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00001003', N'00001003', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0003', CAST(3.00000 AS Numeric(19, 5)), 1, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(3.00000 AS Numeric(19, 5)), N'M / GS', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00001003', N'00001003', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0001', CAST(4.00000 AS Numeric(19, 5)), 1, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(4.00000 AS Numeric(19, 5)), N'M / SUPER', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00001004', N'00001004', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0002', CAST(4.00000 AS Numeric(19, 5)), 1, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(4.00000 AS Numeric(19, 5)), N'M / SUPER', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00001004', N'00001004', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0003', CAST(4.00000 AS Numeric(19, 5)), 1, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(4.00000 AS Numeric(19, 5)), N'M / SUPER', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00001004', N'00001004', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0001', CAST(5.00000 AS Numeric(19, 5)), 1, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(5.00000 AS Numeric(19, 5)), N'L / GS', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00001005', N'00001005', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0002', CAST(5.00000 AS Numeric(19, 5)), 1, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(5.00000 AS Numeric(19, 5)), N'L / GS', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00001005', N'00001005', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0003', CAST(5.00000 AS Numeric(19, 5)), 1, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(5.00000 AS Numeric(19, 5)), N'L / GS', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00001005', N'00001005', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0001', CAST(6.00000 AS Numeric(19, 5)), 1, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(6.00000 AS Numeric(19, 5)), N'L / SUPER', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00001006', N'00001006', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0002', CAST(6.00000 AS Numeric(19, 5)), 1, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(6.00000 AS Numeric(19, 5)), N'L / SUPER', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00001006', N'00001006', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0003', CAST(6.00000 AS Numeric(19, 5)), 1, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(6.00000 AS Numeric(19, 5)), N'L / SUPER', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00001006', N'00001006', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0001', CAST(7.00000 AS Numeric(19, 5)), 1, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(7.00000 AS Numeric(19, 5)), N'XL / GS', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00001007', N'00001007', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0002', CAST(7.00000 AS Numeric(19, 5)), 1, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(7.00000 AS Numeric(19, 5)), N'XL / GS', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00001007', N'00001007', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0003', CAST(7.00000 AS Numeric(19, 5)), 1, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(7.00000 AS Numeric(19, 5)), N'XL / GS', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00001007', N'00001007', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0001', CAST(8.00000 AS Numeric(19, 5)), 1, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(8.00000 AS Numeric(19, 5)), N'XL / SUPER', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00001008', N'00001008', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0002', CAST(8.00000 AS Numeric(19, 5)), 1, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(8.00000 AS Numeric(19, 5)), N'XL / SUPER', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00001008', N'00001008', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0003', CAST(8.00000 AS Numeric(19, 5)), 1, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(8.00000 AS Numeric(19, 5)), N'XL / SUPER', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00001008', N'00001008', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0004', N'SITE0001', CAST(1.00000 AS Numeric(19, 5)), 1, 0, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(1.00000 AS Numeric(19, 5)), N'S / GS', CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00002001', N'00002001', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0004', N'SITE0002', CAST(1.00000 AS Numeric(19, 5)), 1, 0, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(1.00000 AS Numeric(19, 5)), N'S / GS', CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00002001', N'00002001', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0004', N'SITE0003', CAST(1.00000 AS Numeric(19, 5)), 1, 0, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(1.00000 AS Numeric(19, 5)), N'S / GS', CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00002001', N'00002001', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0004', N'SITE0001', CAST(2.00000 AS Numeric(19, 5)), 1, 0, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(2.00000 AS Numeric(19, 5)), N'S / SUPER', CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00002002', N'00002002', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0004', N'SITE0002', CAST(2.00000 AS Numeric(19, 5)), 1, 0, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(2.00000 AS Numeric(19, 5)), N'S / SUPER', CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00002002', N'00002002', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0004', N'SITE0003', CAST(2.00000 AS Numeric(19, 5)), 1, 0, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(2.00000 AS Numeric(19, 5)), N'S / SUPER', CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00002002', N'00002002', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0004', N'SITE0001', CAST(3.00000 AS Numeric(19, 5)), 1, 0, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(3.00000 AS Numeric(19, 5)), N'M / GS', CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00002003', N'00002003', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0004', N'SITE0002', CAST(3.00000 AS Numeric(19, 5)), 1, 0, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(3.00000 AS Numeric(19, 5)), N'M / GS', CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00002003', N'00002003', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0004', N'SITE0003', CAST(3.00000 AS Numeric(19, 5)), 1, 0, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(3.00000 AS Numeric(19, 5)), N'M / GS', CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00002003', N'00002003', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0004', N'SITE0001', CAST(4.00000 AS Numeric(19, 5)), 1, 0, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(4.00000 AS Numeric(19, 5)), N'M / SUPER', CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00002004', N'00002004', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0004', N'SITE0002', CAST(4.00000 AS Numeric(19, 5)), 1, 0, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(4.00000 AS Numeric(19, 5)), N'M / SUPER', CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00002004', N'00002004', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0004', N'SITE0003', CAST(4.00000 AS Numeric(19, 5)), 1, 0, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(4.00000 AS Numeric(19, 5)), N'M / SUPER', CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00002004', N'00002004', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0004', N'SITE0001', CAST(5.00000 AS Numeric(19, 5)), 1, 0, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(5.00000 AS Numeric(19, 5)), N'L / GS', CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00002005', N'00002005', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0004', N'SITE0002', CAST(5.00000 AS Numeric(19, 5)), 1, 0, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(5.00000 AS Numeric(19, 5)), N'L / GS', CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00002005', N'00002005', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0004', N'SITE0003', CAST(5.00000 AS Numeric(19, 5)), 1, 0, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(5.00000 AS Numeric(19, 5)), N'L / GS', CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00002005', N'00002005', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0004', N'SITE0001', CAST(6.00000 AS Numeric(19, 5)), 1, 0, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(6.00000 AS Numeric(19, 5)), N'L / SUPER', CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00002006', N'00002006', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0004', N'SITE0002', CAST(6.00000 AS Numeric(19, 5)), 1, 0, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(6.00000 AS Numeric(19, 5)), N'L / SUPER', CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00002006', N'00002006', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0004', N'SITE0003', CAST(6.00000 AS Numeric(19, 5)), 1, 0, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(6.00000 AS Numeric(19, 5)), N'L / SUPER', CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00002006', N'00002006', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0004', N'SITE0001', CAST(7.00000 AS Numeric(19, 5)), 1, 0, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(7.00000 AS Numeric(19, 5)), N'XL / GS', CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00002007', N'00002007', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0004', N'SITE0002', CAST(7.00000 AS Numeric(19, 5)), 1, 0, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(7.00000 AS Numeric(19, 5)), N'XL / GS', CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00002007', N'00002007', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0004', N'SITE0003', CAST(7.00000 AS Numeric(19, 5)), 1, 0, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(7.00000 AS Numeric(19, 5)), N'XL / GS', CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00002007', N'00002007', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0004', N'SITE0001', CAST(8.00000 AS Numeric(19, 5)), 1, 0, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(8.00000 AS Numeric(19, 5)), N'XL / SUPER', CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00002008', N'00002008', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0004', N'SITE0002', CAST(8.00000 AS Numeric(19, 5)), 1, 0, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(8.00000 AS Numeric(19, 5)), N'XL / SUPER', CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00002008', N'00002008', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0004', N'SITE0003', CAST(8.00000 AS Numeric(19, 5)), 1, 0, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(8.00000 AS Numeric(19, 5)), N'XL / SUPER', CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00002008', N'00002008', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0005', N'SITE0001', CAST(1.00000 AS Numeric(19, 5)), 1, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(1.00000 AS Numeric(19, 5)), N'S / GS', CAST(125000.00000 AS Numeric(19, 5)), CAST(85000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00003001', N'00003001', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0005', N'SITE0002', CAST(1.00000 AS Numeric(19, 5)), 1, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(1.00000 AS Numeric(19, 5)), N'S / GS', CAST(125000.00000 AS Numeric(19, 5)), CAST(85000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00003001', N'00003001', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0005', N'SITE0003', CAST(1.00000 AS Numeric(19, 5)), 1, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(1.00000 AS Numeric(19, 5)), N'S / GS', CAST(125000.00000 AS Numeric(19, 5)), CAST(85000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00003001', N'00003001', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0005', N'SITE0001', CAST(2.00000 AS Numeric(19, 5)), 1, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(2.00000 AS Numeric(19, 5)), N'S / SUPER', CAST(125000.00000 AS Numeric(19, 5)), CAST(85000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00003002', N'00003002', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0005', N'SITE0002', CAST(2.00000 AS Numeric(19, 5)), 1, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(2.00000 AS Numeric(19, 5)), N'S / SUPER', CAST(125000.00000 AS Numeric(19, 5)), CAST(85000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00003002', N'00003002', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0005', N'SITE0003', CAST(2.00000 AS Numeric(19, 5)), 1, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(2.00000 AS Numeric(19, 5)), N'S / SUPER', CAST(125000.00000 AS Numeric(19, 5)), CAST(85000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00003002', N'00003002', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0005', N'SITE0001', CAST(3.00000 AS Numeric(19, 5)), 1, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(3.00000 AS Numeric(19, 5)), N'M / GS', CAST(125000.00000 AS Numeric(19, 5)), CAST(85000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00003003', N'00003003', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0005', N'SITE0002', CAST(3.00000 AS Numeric(19, 5)), 1, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(3.00000 AS Numeric(19, 5)), N'M / GS', CAST(125000.00000 AS Numeric(19, 5)), CAST(85000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00003003', N'00003003', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0005', N'SITE0003', CAST(3.00000 AS Numeric(19, 5)), 1, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(3.00000 AS Numeric(19, 5)), N'M / GS', CAST(125000.00000 AS Numeric(19, 5)), CAST(85000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00003003', N'00003003', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0005', N'SITE0001', CAST(4.00000 AS Numeric(19, 5)), 1, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(4.00000 AS Numeric(19, 5)), N'M / SUPER', CAST(125000.00000 AS Numeric(19, 5)), CAST(85000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00003004', N'00003004', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0005', N'SITE0002', CAST(4.00000 AS Numeric(19, 5)), 1, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(4.00000 AS Numeric(19, 5)), N'M / SUPER', CAST(125000.00000 AS Numeric(19, 5)), CAST(85000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00003004', N'00003004', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0005', N'SITE0003', CAST(4.00000 AS Numeric(19, 5)), 1, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(4.00000 AS Numeric(19, 5)), N'M / SUPER', CAST(125000.00000 AS Numeric(19, 5)), CAST(85000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00003004', N'00003004', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0005', N'SITE0001', CAST(5.00000 AS Numeric(19, 5)), 1, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(5.00000 AS Numeric(19, 5)), N'L / GS', CAST(125000.00000 AS Numeric(19, 5)), CAST(85000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00003005', N'00003005', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0005', N'SITE0002', CAST(5.00000 AS Numeric(19, 5)), 1, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(5.00000 AS Numeric(19, 5)), N'L / GS', CAST(125000.00000 AS Numeric(19, 5)), CAST(85000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00003005', N'00003005', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0005', N'SITE0003', CAST(5.00000 AS Numeric(19, 5)), 1, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(5.00000 AS Numeric(19, 5)), N'L / GS', CAST(125000.00000 AS Numeric(19, 5)), CAST(85000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00003005', N'00003005', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0005', N'SITE0001', CAST(6.00000 AS Numeric(19, 5)), 1, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(6.00000 AS Numeric(19, 5)), N'L / SUPER', CAST(125000.00000 AS Numeric(19, 5)), CAST(85000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00003006', N'00003006', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0005', N'SITE0002', CAST(6.00000 AS Numeric(19, 5)), 1, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(6.00000 AS Numeric(19, 5)), N'L / SUPER', CAST(125000.00000 AS Numeric(19, 5)), CAST(85000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00003006', N'00003006', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0005', N'SITE0003', CAST(6.00000 AS Numeric(19, 5)), 1, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(6.00000 AS Numeric(19, 5)), N'L / SUPER', CAST(125000.00000 AS Numeric(19, 5)), CAST(85000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00003006', N'00003006', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0005', N'SITE0001', CAST(7.00000 AS Numeric(19, 5)), 1, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(7.00000 AS Numeric(19, 5)), N'XL / GS', CAST(125000.00000 AS Numeric(19, 5)), CAST(85000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00003007', N'00003007', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0005', N'SITE0002', CAST(7.00000 AS Numeric(19, 5)), 1, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(7.00000 AS Numeric(19, 5)), N'XL / GS', CAST(125000.00000 AS Numeric(19, 5)), CAST(85000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00003007', N'00003007', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0005', N'SITE0003', CAST(7.00000 AS Numeric(19, 5)), 1, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(7.00000 AS Numeric(19, 5)), N'XL / GS', CAST(125000.00000 AS Numeric(19, 5)), CAST(85000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00003007', N'00003007', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0005', N'SITE0001', CAST(8.00000 AS Numeric(19, 5)), 1, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(8.00000 AS Numeric(19, 5)), N'XL / SUPER', CAST(125000.00000 AS Numeric(19, 5)), CAST(85000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00003008', N'00003008', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0005', N'SITE0002', CAST(8.00000 AS Numeric(19, 5)), 1, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(8.00000 AS Numeric(19, 5)), N'XL / SUPER', CAST(125000.00000 AS Numeric(19, 5)), CAST(85000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00003008', N'00003008', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0005', N'SITE0003', CAST(8.00000 AS Numeric(19, 5)), 1, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(8.00000 AS Numeric(19, 5)), N'XL / SUPER', CAST(125000.00000 AS Numeric(19, 5)), CAST(85000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00003008', N'00003008', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0001', CAST(1.00000 AS Numeric(19, 5)), 2, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(1.00000 AS Numeric(19, 5)), N'S / GS', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00001001', N'00001001', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0002', CAST(1.00000 AS Numeric(19, 5)), 2, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(1.00000 AS Numeric(19, 5)), N'S / GS', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00001001', N'00001001', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0003', CAST(1.00000 AS Numeric(19, 5)), 2, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(1.00000 AS Numeric(19, 5)), N'S / GS', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00001001', N'00001001', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0001', CAST(2.00000 AS Numeric(19, 5)), 2, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(2.00000 AS Numeric(19, 5)), N'S / SUPER', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00001002', N'00001002', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0002', CAST(2.00000 AS Numeric(19, 5)), 2, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(2.00000 AS Numeric(19, 5)), N'S / SUPER', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00001002', N'00001002', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0003', CAST(2.00000 AS Numeric(19, 5)), 2, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(2.00000 AS Numeric(19, 5)), N'S / SUPER', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00001002', N'00001002', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0001', CAST(3.00000 AS Numeric(19, 5)), 2, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(3.00000 AS Numeric(19, 5)), N'M / GS', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00001003', N'00001003', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0002', CAST(3.00000 AS Numeric(19, 5)), 2, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(3.00000 AS Numeric(19, 5)), N'M / GS', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00001003', N'00001003', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0003', CAST(3.00000 AS Numeric(19, 5)), 2, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(3.00000 AS Numeric(19, 5)), N'M / GS', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00001003', N'00001003', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0001', CAST(4.00000 AS Numeric(19, 5)), 2, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(4.00000 AS Numeric(19, 5)), N'M / SUPER', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00001004', N'00001004', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0002', CAST(4.00000 AS Numeric(19, 5)), 2, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(4.00000 AS Numeric(19, 5)), N'M / SUPER', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00001004', N'00001004', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0003', CAST(4.00000 AS Numeric(19, 5)), 2, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(4.00000 AS Numeric(19, 5)), N'M / SUPER', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00001004', N'00001004', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0001', CAST(5.00000 AS Numeric(19, 5)), 2, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(5.00000 AS Numeric(19, 5)), N'L / GS', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00001005', N'00001005', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0002', CAST(5.00000 AS Numeric(19, 5)), 2, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(5.00000 AS Numeric(19, 5)), N'L / GS', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00001005', N'00001005', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0003', CAST(5.00000 AS Numeric(19, 5)), 2, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(5.00000 AS Numeric(19, 5)), N'L / GS', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00001005', N'00001005', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0001', CAST(6.00000 AS Numeric(19, 5)), 2, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(6.00000 AS Numeric(19, 5)), N'L / SUPER', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00001006', N'00001006', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0002', CAST(6.00000 AS Numeric(19, 5)), 2, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(6.00000 AS Numeric(19, 5)), N'L / SUPER', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00001006', N'00001006', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0003', CAST(6.00000 AS Numeric(19, 5)), 2, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(6.00000 AS Numeric(19, 5)), N'L / SUPER', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00001006', N'00001006', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0001', CAST(7.00000 AS Numeric(19, 5)), 2, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(7.00000 AS Numeric(19, 5)), N'XL / GS', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00001007', N'00001007', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0002', CAST(7.00000 AS Numeric(19, 5)), 2, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(7.00000 AS Numeric(19, 5)), N'XL / GS', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00001007', N'00001007', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0003', CAST(7.00000 AS Numeric(19, 5)), 2, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(7.00000 AS Numeric(19, 5)), N'XL / GS', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00001007', N'00001007', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0001', CAST(8.00000 AS Numeric(19, 5)), 2, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(8.00000 AS Numeric(19, 5)), N'XL / SUPER', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00001008', N'00001008', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0002', CAST(8.00000 AS Numeric(19, 5)), 2, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(8.00000 AS Numeric(19, 5)), N'XL / SUPER', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00001008', N'00001008', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0003', CAST(8.00000 AS Numeric(19, 5)), 2, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(8.00000 AS Numeric(19, 5)), N'XL / SUPER', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00001008', N'00001008', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0004', N'SITE0001', CAST(1.00000 AS Numeric(19, 5)), 2, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(1.00000 AS Numeric(19, 5)), N'S / GS', CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00002001', N'00002001', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0004', N'SITE0002', CAST(1.00000 AS Numeric(19, 5)), 2, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(1.00000 AS Numeric(19, 5)), N'S / GS', CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00002001', N'00002001', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0004', N'SITE0003', CAST(1.00000 AS Numeric(19, 5)), 2, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(1.00000 AS Numeric(19, 5)), N'S / GS', CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00002001', N'00002001', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0004', N'SITE0001', CAST(2.00000 AS Numeric(19, 5)), 2, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(2.00000 AS Numeric(19, 5)), N'S / SUPER', CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00002002', N'00002002', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0004', N'SITE0002', CAST(2.00000 AS Numeric(19, 5)), 2, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(2.00000 AS Numeric(19, 5)), N'S / SUPER', CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00002002', N'00002002', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0004', N'SITE0003', CAST(2.00000 AS Numeric(19, 5)), 2, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(2.00000 AS Numeric(19, 5)), N'S / SUPER', CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00002002', N'00002002', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0004', N'SITE0001', CAST(3.00000 AS Numeric(19, 5)), 2, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(3.00000 AS Numeric(19, 5)), N'M / GS', CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00002003', N'00002003', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0004', N'SITE0002', CAST(3.00000 AS Numeric(19, 5)), 2, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(3.00000 AS Numeric(19, 5)), N'M / GS', CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00002003', N'00002003', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0004', N'SITE0003', CAST(3.00000 AS Numeric(19, 5)), 2, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(3.00000 AS Numeric(19, 5)), N'M / GS', CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00002003', N'00002003', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0004', N'SITE0001', CAST(4.00000 AS Numeric(19, 5)), 2, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(4.00000 AS Numeric(19, 5)), N'M / SUPER', CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00002004', N'00002004', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0004', N'SITE0002', CAST(4.00000 AS Numeric(19, 5)), 2, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(4.00000 AS Numeric(19, 5)), N'M / SUPER', CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00002004', N'00002004', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0004', N'SITE0003', CAST(4.00000 AS Numeric(19, 5)), 2, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(4.00000 AS Numeric(19, 5)), N'M / SUPER', CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00002004', N'00002004', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0004', N'SITE0001', CAST(5.00000 AS Numeric(19, 5)), 2, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(5.00000 AS Numeric(19, 5)), N'L / GS', CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00002005', N'00002005', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0004', N'SITE0002', CAST(5.00000 AS Numeric(19, 5)), 2, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(5.00000 AS Numeric(19, 5)), N'L / GS', CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00002005', N'00002005', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0004', N'SITE0003', CAST(5.00000 AS Numeric(19, 5)), 2, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(5.00000 AS Numeric(19, 5)), N'L / GS', CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00002005', N'00002005', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0004', N'SITE0001', CAST(6.00000 AS Numeric(19, 5)), 2, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(6.00000 AS Numeric(19, 5)), N'L / SUPER', CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00002006', N'00002006', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0004', N'SITE0002', CAST(6.00000 AS Numeric(19, 5)), 2, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(6.00000 AS Numeric(19, 5)), N'L / SUPER', CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00002006', N'00002006', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0004', N'SITE0003', CAST(6.00000 AS Numeric(19, 5)), 2, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(6.00000 AS Numeric(19, 5)), N'L / SUPER', CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00002006', N'00002006', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0004', N'SITE0001', CAST(7.00000 AS Numeric(19, 5)), 2, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(7.00000 AS Numeric(19, 5)), N'XL / GS', CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00002007', N'00002007', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0004', N'SITE0002', CAST(7.00000 AS Numeric(19, 5)), 2, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(7.00000 AS Numeric(19, 5)), N'XL / GS', CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00002007', N'00002007', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0004', N'SITE0003', CAST(7.00000 AS Numeric(19, 5)), 2, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(7.00000 AS Numeric(19, 5)), N'XL / GS', CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00002007', N'00002007', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0004', N'SITE0001', CAST(8.00000 AS Numeric(19, 5)), 2, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(8.00000 AS Numeric(19, 5)), N'XL / SUPER', CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00002008', N'00002008', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0004', N'SITE0002', CAST(8.00000 AS Numeric(19, 5)), 2, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(8.00000 AS Numeric(19, 5)), N'XL / SUPER', CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00002008', N'00002008', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0004', N'SITE0003', CAST(8.00000 AS Numeric(19, 5)), 2, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(8.00000 AS Numeric(19, 5)), N'XL / SUPER', CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00002008', N'00002008', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0001', CAST(1.00000 AS Numeric(19, 5)), 3, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(1.00000 AS Numeric(19, 5)), N'S / GS', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00001001', N'00001001', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0002', CAST(1.00000 AS Numeric(19, 5)), 3, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(1.00000 AS Numeric(19, 5)), N'S / GS', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00001001', N'00001001', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0003', CAST(1.00000 AS Numeric(19, 5)), 3, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(1.00000 AS Numeric(19, 5)), N'S / GS', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00001001', N'00001001', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0001', CAST(2.00000 AS Numeric(19, 5)), 3, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(2.00000 AS Numeric(19, 5)), N'S / SUPER', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00001002', N'00001002', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0002', CAST(2.00000 AS Numeric(19, 5)), 3, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(2.00000 AS Numeric(19, 5)), N'S / SUPER', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00001002', N'00001002', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0003', CAST(2.00000 AS Numeric(19, 5)), 3, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(2.00000 AS Numeric(19, 5)), N'S / SUPER', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00001002', N'00001002', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0001', CAST(3.00000 AS Numeric(19, 5)), 3, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(3.00000 AS Numeric(19, 5)), N'M / GS', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00001003', N'00001003', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0002', CAST(3.00000 AS Numeric(19, 5)), 3, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(3.00000 AS Numeric(19, 5)), N'M / GS', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00001003', N'00001003', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0003', CAST(3.00000 AS Numeric(19, 5)), 3, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(3.00000 AS Numeric(19, 5)), N'M / GS', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00001003', N'00001003', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0001', CAST(4.00000 AS Numeric(19, 5)), 3, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(4.00000 AS Numeric(19, 5)), N'M / SUPER', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00001004', N'00001004', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0002', CAST(4.00000 AS Numeric(19, 5)), 3, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(4.00000 AS Numeric(19, 5)), N'M / SUPER', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00001004', N'00001004', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0003', CAST(4.00000 AS Numeric(19, 5)), 3, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(4.00000 AS Numeric(19, 5)), N'M / SUPER', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00001004', N'00001004', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0001', CAST(5.00000 AS Numeric(19, 5)), 3, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(5.00000 AS Numeric(19, 5)), N'L / GS', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00001005', N'00001005', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0002', CAST(5.00000 AS Numeric(19, 5)), 3, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(5.00000 AS Numeric(19, 5)), N'L / GS', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00001005', N'00001005', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0003', CAST(5.00000 AS Numeric(19, 5)), 3, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(5.00000 AS Numeric(19, 5)), N'L / GS', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00001005', N'00001005', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0001', CAST(6.00000 AS Numeric(19, 5)), 3, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(6.00000 AS Numeric(19, 5)), N'L / SUPER', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00001006', N'00001006', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0002', CAST(6.00000 AS Numeric(19, 5)), 3, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(6.00000 AS Numeric(19, 5)), N'L / SUPER', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00001006', N'00001006', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0003', CAST(6.00000 AS Numeric(19, 5)), 3, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(6.00000 AS Numeric(19, 5)), N'L / SUPER', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00001006', N'00001006', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0001', CAST(7.00000 AS Numeric(19, 5)), 3, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(7.00000 AS Numeric(19, 5)), N'XL / GS', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00001007', N'00001007', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0002', CAST(7.00000 AS Numeric(19, 5)), 3, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(7.00000 AS Numeric(19, 5)), N'XL / GS', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00001007', N'00001007', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0003', CAST(7.00000 AS Numeric(19, 5)), 3, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(7.00000 AS Numeric(19, 5)), N'XL / GS', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00001007', N'00001007', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0001', CAST(8.00000 AS Numeric(19, 5)), 3, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(8.00000 AS Numeric(19, 5)), N'XL / SUPER', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00001008', N'00001008', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0002', CAST(8.00000 AS Numeric(19, 5)), 3, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(8.00000 AS Numeric(19, 5)), N'XL / SUPER', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00001008', N'00001008', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0003', CAST(8.00000 AS Numeric(19, 5)), 3, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(8.00000 AS Numeric(19, 5)), N'XL / SUPER', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00001008', N'00001008', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0004', N'SITE0001', CAST(1.00000 AS Numeric(19, 5)), 3, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(1.00000 AS Numeric(19, 5)), N'S / GS', CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00002001', N'00002001', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0004', N'SITE0002', CAST(1.00000 AS Numeric(19, 5)), 3, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(1.00000 AS Numeric(19, 5)), N'S / GS', CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00002001', N'00002001', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0004', N'SITE0003', CAST(1.00000 AS Numeric(19, 5)), 3, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(1.00000 AS Numeric(19, 5)), N'S / GS', CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00002001', N'00002001', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0004', N'SITE0001', CAST(2.00000 AS Numeric(19, 5)), 3, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(2.00000 AS Numeric(19, 5)), N'S / SUPER', CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00002002', N'00002002', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0004', N'SITE0002', CAST(2.00000 AS Numeric(19, 5)), 3, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(2.00000 AS Numeric(19, 5)), N'S / SUPER', CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00002002', N'00002002', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0004', N'SITE0003', CAST(2.00000 AS Numeric(19, 5)), 3, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(2.00000 AS Numeric(19, 5)), N'S / SUPER', CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00002002', N'00002002', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0004', N'SITE0001', CAST(3.00000 AS Numeric(19, 5)), 3, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(3.00000 AS Numeric(19, 5)), N'M / GS', CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00002003', N'00002003', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0004', N'SITE0002', CAST(3.00000 AS Numeric(19, 5)), 3, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(3.00000 AS Numeric(19, 5)), N'M / GS', CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00002003', N'00002003', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0004', N'SITE0003', CAST(3.00000 AS Numeric(19, 5)), 3, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(3.00000 AS Numeric(19, 5)), N'M / GS', CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00002003', N'00002003', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0004', N'SITE0001', CAST(4.00000 AS Numeric(19, 5)), 3, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(4.00000 AS Numeric(19, 5)), N'M / SUPER', CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00002004', N'00002004', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0004', N'SITE0002', CAST(4.00000 AS Numeric(19, 5)), 3, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(4.00000 AS Numeric(19, 5)), N'M / SUPER', CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00002004', N'00002004', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0004', N'SITE0003', CAST(4.00000 AS Numeric(19, 5)), 3, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(4.00000 AS Numeric(19, 5)), N'M / SUPER', CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00002004', N'00002004', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0004', N'SITE0001', CAST(5.00000 AS Numeric(19, 5)), 3, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(5.00000 AS Numeric(19, 5)), N'L / GS', CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00002005', N'00002005', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0004', N'SITE0002', CAST(5.00000 AS Numeric(19, 5)), 3, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(5.00000 AS Numeric(19, 5)), N'L / GS', CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00002005', N'00002005', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0004', N'SITE0003', CAST(5.00000 AS Numeric(19, 5)), 3, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(5.00000 AS Numeric(19, 5)), N'L / GS', CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00002005', N'00002005', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0004', N'SITE0001', CAST(6.00000 AS Numeric(19, 5)), 3, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(6.00000 AS Numeric(19, 5)), N'L / SUPER', CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00002006', N'00002006', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0004', N'SITE0002', CAST(6.00000 AS Numeric(19, 5)), 3, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(6.00000 AS Numeric(19, 5)), N'L / SUPER', CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00002006', N'00002006', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0004', N'SITE0003', CAST(6.00000 AS Numeric(19, 5)), 3, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(6.00000 AS Numeric(19, 5)), N'L / SUPER', CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00002006', N'00002006', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0004', N'SITE0001', CAST(7.00000 AS Numeric(19, 5)), 3, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(7.00000 AS Numeric(19, 5)), N'XL / GS', CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00002007', N'00002007', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0004', N'SITE0002', CAST(7.00000 AS Numeric(19, 5)), 3, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(7.00000 AS Numeric(19, 5)), N'XL / GS', CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00002007', N'00002007', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0004', N'SITE0003', CAST(7.00000 AS Numeric(19, 5)), 3, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(7.00000 AS Numeric(19, 5)), N'XL / GS', CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00002007', N'00002007', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0004', N'SITE0001', CAST(8.00000 AS Numeric(19, 5)), 3, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(8.00000 AS Numeric(19, 5)), N'XL / SUPER', CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00002008', N'00002008', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0004', N'SITE0002', CAST(8.00000 AS Numeric(19, 5)), 3, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(8.00000 AS Numeric(19, 5)), N'XL / SUPER', CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00002008', N'00002008', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0004', N'SITE0003', CAST(8.00000 AS Numeric(19, 5)), 3, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(8.00000 AS Numeric(19, 5)), N'XL / SUPER', CAST(85000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00002008', N'00002008', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0001', CAST(1.00000 AS Numeric(19, 5)), 4, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(1.00000 AS Numeric(19, 5)), N'S / GS', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00001001', N'00001001', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0002', CAST(1.00000 AS Numeric(19, 5)), 4, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(1.00000 AS Numeric(19, 5)), N'S / GS', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00001001', N'00001001', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0003', CAST(1.00000 AS Numeric(19, 5)), 4, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(1.00000 AS Numeric(19, 5)), N'S / GS', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00001001', N'00001001', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0001', CAST(2.00000 AS Numeric(19, 5)), 4, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(2.00000 AS Numeric(19, 5)), N'S / SUPER', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00001002', N'00001002', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0002', CAST(2.00000 AS Numeric(19, 5)), 4, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(2.00000 AS Numeric(19, 5)), N'S / SUPER', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00001002', N'00001002', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0003', CAST(2.00000 AS Numeric(19, 5)), 4, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(2.00000 AS Numeric(19, 5)), N'S / SUPER', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00001002', N'00001002', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0001', CAST(3.00000 AS Numeric(19, 5)), 4, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(3.00000 AS Numeric(19, 5)), N'M / GS', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00001003', N'00001003', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0002', CAST(3.00000 AS Numeric(19, 5)), 4, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(3.00000 AS Numeric(19, 5)), N'M / GS', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00001003', N'00001003', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0003', CAST(3.00000 AS Numeric(19, 5)), 4, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(3.00000 AS Numeric(19, 5)), N'M / GS', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00001003', N'00001003', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0001', CAST(4.00000 AS Numeric(19, 5)), 4, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(4.00000 AS Numeric(19, 5)), N'M / SUPER', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00001004', N'00001004', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0002', CAST(4.00000 AS Numeric(19, 5)), 4, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(4.00000 AS Numeric(19, 5)), N'M / SUPER', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00001004', N'00001004', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0003', CAST(4.00000 AS Numeric(19, 5)), 4, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(4.00000 AS Numeric(19, 5)), N'M / SUPER', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00001004', N'00001004', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0001', CAST(5.00000 AS Numeric(19, 5)), 4, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(5.00000 AS Numeric(19, 5)), N'L / GS', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00001005', N'00001005', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0002', CAST(5.00000 AS Numeric(19, 5)), 4, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(5.00000 AS Numeric(19, 5)), N'L / GS', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00001005', N'00001005', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0003', CAST(5.00000 AS Numeric(19, 5)), 4, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(5.00000 AS Numeric(19, 5)), N'L / GS', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00001005', N'00001005', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0001', CAST(6.00000 AS Numeric(19, 5)), 4, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(6.00000 AS Numeric(19, 5)), N'L / SUPER', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00001006', N'00001006', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0002', CAST(6.00000 AS Numeric(19, 5)), 4, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(6.00000 AS Numeric(19, 5)), N'L / SUPER', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00001006', N'00001006', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0003', CAST(6.00000 AS Numeric(19, 5)), 4, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(6.00000 AS Numeric(19, 5)), N'L / SUPER', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00001006', N'00001006', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0001', CAST(7.00000 AS Numeric(19, 5)), 4, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(7.00000 AS Numeric(19, 5)), N'XL / GS', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00001007', N'00001007', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0002', CAST(7.00000 AS Numeric(19, 5)), 4, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(7.00000 AS Numeric(19, 5)), N'XL / GS', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00001007', N'00001007', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0003', CAST(7.00000 AS Numeric(19, 5)), 4, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(7.00000 AS Numeric(19, 5)), N'XL / GS', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00001007', N'00001007', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0001', CAST(8.00000 AS Numeric(19, 5)), 4, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(8.00000 AS Numeric(19, 5)), N'XL / SUPER', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 100, 10, 50, N'00001008', N'00001008', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0002', CAST(8.00000 AS Numeric(19, 5)), 4, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(8.00000 AS Numeric(19, 5)), N'XL / SUPER', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00001008', N'00001008', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_ItemVariant_History] ([Item_Number], [Site_ID], [LineItem_Option], [Line_Item], [CB_Available], [Option_ID], [Option_Name], [LineItem_Variant], [Variant_Name], [Item_Price], [Item_Cost], [InStock], [LowStock], [OptimalStock], [Item_SKU], [Item_Barcode], [Created_User], [Created_Date]) VALUES (N'ITM0003', N'SITE0003', CAST(8.00000 AS Numeric(19, 5)), 4, 1, N'SIZE / QUALITY', N'SIZE / QUALITY', CAST(8.00000 AS Numeric(19, 5)), N'XL / SUPER', CAST(75000.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), 0, 10, 50, N'00001008', N'00001008', N'USER1', CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_Set_Site] ([Site_ID], [DefaultSite], [Site_Name], [Store_ID], [Store_Name], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'SITE0001', 1, N'SITE A', N'STR0001', N'STORE A', N'USER1', CAST(N'2023-12-16T00:00:00.000' AS DateTime), N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_Set_Site] ([Site_ID], [DefaultSite], [Site_Name], [Store_ID], [Store_Name], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'SITE0002', 0, N'SITE B', N'STR0001', N'STORE A', N'USER1', CAST(N'2024-01-07T00:00:00.000' AS DateTime), N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_Set_Site] ([Site_ID], [DefaultSite], [Site_Name], [Store_ID], [Store_Name], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'SITE0003', 0, N'SITE C', N'STR0001', N'STORE A', N'USER1', CAST(N'2024-01-07T00:00:00.000' AS DateTime), N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_Set_Site_History] ([Site_ID], [DefaultSite], [Site_Name], [Line_Item], [Store_ID], [Store_Name], [Created_User], [Created_Date]) VALUES (N'SITE0001', 1, N'SITE A', 0, N'STR0001', N'STORE A', N'USER1', CAST(N'2023-12-16T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_Set_Site_History] ([Site_ID], [DefaultSite], [Site_Name], [Line_Item], [Store_ID], [Store_Name], [Created_User], [Created_Date]) VALUES (N'SITE0002', 0, N'SITE B', 0, N'STR0001', N'STORE A', N'USER1', CAST(N'2024-01-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_Set_Site_History] ([Site_ID], [DefaultSite], [Site_Name], [Line_Item], [Store_ID], [Store_Name], [Created_User], [Created_Date]) VALUES (N'SITE0003', 0, N'SITE C', 0, N'STR0001', N'STORE A', N'USER1', CAST(N'2024-01-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_Set_Taxes] ([Tax_ID], [Tax_Name], [Tax_Rate], [Tax_Type], [Tax_Option], [Created_User], [Created_Date], [Modified_User], [Modified_Date]) VALUES (N'TAX0001', N'PPN 11%', CAST(11.00000 AS Numeric(19, 5)), 1, 1, N'USER1', CAST(N'2023-12-23T00:00:00.000' AS DateTime), N'USER1', CAST(N'2024-02-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_Set_Taxes_History] ([Tax_ID], [Tax_Name], [Line_Item], [Tax_Rate], [Tax_Type], [Tax_Option], [Created_User], [Created_Date]) VALUES (N'TAX0001', N'test', 0, CAST(10.00000 AS Numeric(19, 5)), 1, 1, N'USER1', CAST(N'2023-12-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_Set_Taxes_History] ([Tax_ID], [Tax_Name], [Line_Item], [Tax_Rate], [Tax_Type], [Tax_Option], [Created_User], [Created_Date]) VALUES (N'TAX0001', N'PPN 11%', 1, CAST(11.00000 AS Numeric(19, 5)), 1, 1, N'USER1', CAST(N'2024-02-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_TrxAdjustment_Detail] ([DOCNUMBER], [DOCDATE], [Reason], [Lineitmseq], [Item_Number], [LineItem_Option], [Item_Description], [Qty_Stock], [Qty_Add_Stock], [Qty_Remove_Stock], [Item_Cost], [Qty_After_Stock], [Expected_Stock], [Counted_Stock], [Created_User], [Created_Date], [Created_time], [Modified_User], [Modified_Date], [Modified_time]) VALUES (N'SA0005', CAST(N'2024-02-26T08:22:37.000' AS DateTime), N'Receive Items', 10, N'ITM0001', CAST(1.00000 AS Numeric(19, 5)), N'SERAGAM SD (S / GS)', CAST(100.00000 AS Numeric(19, 5)), CAST(10.00000 AS Numeric(19, 5)), CAST(0.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), CAST(110.00000 AS Numeric(19, 5)), CAST(0.00000 AS Numeric(19, 5)), CAST(0.00000 AS Numeric(19, 5)), N'USER1', CAST(N'2024-02-26T00:00:00.000' AS DateTime), CAST(N'1900-01-01T20:22:37.533' AS DateTime), N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_TrxAdjustment_Detail] ([DOCNUMBER], [DOCDATE], [Reason], [Lineitmseq], [Item_Number], [LineItem_Option], [Item_Description], [Qty_Stock], [Qty_Add_Stock], [Qty_Remove_Stock], [Item_Cost], [Qty_After_Stock], [Expected_Stock], [Counted_Stock], [Created_User], [Created_Date], [Created_time], [Modified_User], [Modified_Date], [Modified_time]) VALUES (N'SA0006', CAST(N'2024-02-26T08:25:45.000' AS DateTime), N'Damage', 10, N'ITM0001', CAST(1.00000 AS Numeric(19, 5)), N'SERAGAM SD (S / GS)', CAST(100.00000 AS Numeric(19, 5)), CAST(0.00000 AS Numeric(19, 5)), CAST(20.00000 AS Numeric(19, 5)), CAST(0.00000 AS Numeric(19, 5)), CAST(80.00000 AS Numeric(19, 5)), CAST(0.00000 AS Numeric(19, 5)), CAST(0.00000 AS Numeric(19, 5)), N'USER1', CAST(N'2024-02-26T00:00:00.000' AS DateTime), CAST(N'1900-01-01T20:25:45.867' AS DateTime), N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_TrxAdjustment_Detail] ([DOCNUMBER], [DOCDATE], [Reason], [Lineitmseq], [Item_Number], [LineItem_Option], [Item_Description], [Qty_Stock], [Qty_Add_Stock], [Qty_Remove_Stock], [Item_Cost], [Qty_After_Stock], [Expected_Stock], [Counted_Stock], [Created_User], [Created_Date], [Created_time], [Modified_User], [Modified_Date], [Modified_time]) VALUES (N'SA0007', CAST(N'2024-02-26T08:29:09.000' AS DateTime), N'Loss', 10, N'ITM0001', CAST(1.00000 AS Numeric(19, 5)), N'SERAGAM SD (S / GS)', CAST(100.00000 AS Numeric(19, 5)), CAST(0.00000 AS Numeric(19, 5)), CAST(10.00000 AS Numeric(19, 5)), CAST(0.00000 AS Numeric(19, 5)), CAST(90.00000 AS Numeric(19, 5)), CAST(0.00000 AS Numeric(19, 5)), CAST(0.00000 AS Numeric(19, 5)), N'USER1', CAST(N'2024-02-26T00:00:00.000' AS DateTime), CAST(N'1900-01-01T20:29:09.237' AS DateTime), N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_TrxAdjustment_Detail] ([DOCNUMBER], [DOCDATE], [Reason], [Lineitmseq], [Item_Number], [LineItem_Option], [Item_Description], [Qty_Stock], [Qty_Add_Stock], [Qty_Remove_Stock], [Item_Cost], [Qty_After_Stock], [Expected_Stock], [Counted_Stock], [Created_User], [Created_Date], [Created_time], [Modified_User], [Modified_Date], [Modified_time]) VALUES (N'SA0008', CAST(N'2024-02-26T08:30:01.000' AS DateTime), N'Inventory Count', 10, N'ITM0001', CAST(1.00000 AS Numeric(19, 5)), N'SERAGAM SD (S / GS)', CAST(0.00000 AS Numeric(19, 5)), CAST(0.00000 AS Numeric(19, 5)), CAST(0.00000 AS Numeric(19, 5)), CAST(0.00000 AS Numeric(19, 5)), CAST(0.00000 AS Numeric(19, 5)), CAST(100.00000 AS Numeric(19, 5)), CAST(80.00000 AS Numeric(19, 5)), N'USER1', CAST(N'2024-02-26T00:00:00.000' AS DateTime), CAST(N'1900-01-01T20:30:01.930' AS DateTime), N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_TrxAdjustment_Detail] ([DOCNUMBER], [DOCDATE], [Reason], [Lineitmseq], [Item_Number], [LineItem_Option], [Item_Description], [Qty_Stock], [Qty_Add_Stock], [Qty_Remove_Stock], [Item_Cost], [Qty_After_Stock], [Expected_Stock], [Counted_Stock], [Created_User], [Created_Date], [Created_time], [Modified_User], [Modified_Date], [Modified_time]) VALUES (N'SA0009', CAST(N'2024-02-29T08:53:15.000' AS DateTime), N'Damage', 10, N'ITM0001', CAST(1.00000 AS Numeric(19, 5)), N'SERAGAM SD (S / GS)', CAST(100.00000 AS Numeric(19, 5)), CAST(0.00000 AS Numeric(19, 5)), CAST(10.00000 AS Numeric(19, 5)), CAST(0.00000 AS Numeric(19, 5)), CAST(90.00000 AS Numeric(19, 5)), CAST(0.00000 AS Numeric(19, 5)), CAST(0.00000 AS Numeric(19, 5)), N'USER1', CAST(N'2024-02-29T00:00:00.000' AS DateTime), CAST(N'1900-01-01T20:53:16.083' AS DateTime), N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_TrxAdjustment_Detail] ([DOCNUMBER], [DOCDATE], [Reason], [Lineitmseq], [Item_Number], [LineItem_Option], [Item_Description], [Qty_Stock], [Qty_Add_Stock], [Qty_Remove_Stock], [Item_Cost], [Qty_After_Stock], [Expected_Stock], [Counted_Stock], [Created_User], [Created_Date], [Created_time], [Modified_User], [Modified_Date], [Modified_time]) VALUES (N'SA0010', CAST(N'2024-02-29T09:03:31.000' AS DateTime), N'Receive Items', 10, N'ITM0001', CAST(1.00000 AS Numeric(19, 5)), N'SERAGAM SD (S / GS)', CAST(100.00000 AS Numeric(19, 5)), CAST(10.00000 AS Numeric(19, 5)), CAST(0.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), CAST(110.00000 AS Numeric(19, 5)), CAST(0.00000 AS Numeric(19, 5)), CAST(0.00000 AS Numeric(19, 5)), N'USER1', CAST(N'2024-02-29T00:00:00.000' AS DateTime), CAST(N'1900-01-01T21:03:31.303' AS DateTime), N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_TrxAdjustment_Detail] ([DOCNUMBER], [DOCDATE], [Reason], [Lineitmseq], [Item_Number], [LineItem_Option], [Item_Description], [Qty_Stock], [Qty_Add_Stock], [Qty_Remove_Stock], [Item_Cost], [Qty_After_Stock], [Expected_Stock], [Counted_Stock], [Created_User], [Created_Date], [Created_time], [Modified_User], [Modified_Date], [Modified_time]) VALUES (N'SA0011', CAST(N'2024-02-29T09:11:23.000' AS DateTime), N'Loss', 10, N'ITM0001', CAST(1.00000 AS Numeric(19, 5)), N'SERAGAM SD (S / GS)', CAST(100.00000 AS Numeric(19, 5)), CAST(0.00000 AS Numeric(19, 5)), CAST(10.00000 AS Numeric(19, 5)), CAST(0.00000 AS Numeric(19, 5)), CAST(90.00000 AS Numeric(19, 5)), CAST(0.00000 AS Numeric(19, 5)), CAST(0.00000 AS Numeric(19, 5)), N'USER1', CAST(N'2024-02-29T00:00:00.000' AS DateTime), CAST(N'1900-01-01T21:11:23.960' AS DateTime), N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_TrxAdjustment_Detail] ([DOCNUMBER], [DOCDATE], [Reason], [Lineitmseq], [Item_Number], [LineItem_Option], [Item_Description], [Qty_Stock], [Qty_Add_Stock], [Qty_Remove_Stock], [Item_Cost], [Qty_After_Stock], [Expected_Stock], [Counted_Stock], [Created_User], [Created_Date], [Created_time], [Modified_User], [Modified_Date], [Modified_time]) VALUES (N'SA0012', CAST(N'2024-03-03T03:22:00.000' AS DateTime), N'Damage', 10, N'ITM0001', CAST(1.00000 AS Numeric(19, 5)), N'SERAGAM SD (S / GS)', CAST(100.00000 AS Numeric(19, 5)), CAST(0.00000 AS Numeric(19, 5)), CAST(10.00000 AS Numeric(19, 5)), CAST(0.00000 AS Numeric(19, 5)), CAST(90.00000 AS Numeric(19, 5)), CAST(0.00000 AS Numeric(19, 5)), CAST(0.00000 AS Numeric(19, 5)), N'USER1', CAST(N'2024-03-03T00:00:00.000' AS DateTime), CAST(N'1900-01-01T15:22:00.867' AS DateTime), N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_TrxAdjustment_Detail] ([DOCNUMBER], [DOCDATE], [Reason], [Lineitmseq], [Item_Number], [LineItem_Option], [Item_Description], [Qty_Stock], [Qty_Add_Stock], [Qty_Remove_Stock], [Item_Cost], [Qty_After_Stock], [Expected_Stock], [Counted_Stock], [Created_User], [Created_Date], [Created_time], [Modified_User], [Modified_Date], [Modified_time]) VALUES (N'SA0013', CAST(N'2024-03-03T03:36:21.000' AS DateTime), N'Loss', 10, N'ITM0001', CAST(1.00000 AS Numeric(19, 5)), N'SERAGAM SD (S / GS)', CAST(100.00000 AS Numeric(19, 5)), CAST(0.00000 AS Numeric(19, 5)), CAST(10.00000 AS Numeric(19, 5)), CAST(0.00000 AS Numeric(19, 5)), CAST(90.00000 AS Numeric(19, 5)), CAST(0.00000 AS Numeric(19, 5)), CAST(0.00000 AS Numeric(19, 5)), N'USER1', CAST(N'2024-03-03T00:00:00.000' AS DateTime), CAST(N'1900-01-01T15:36:21.147' AS DateTime), N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_TrxAdjustment_DetailHIST] ([DOCNUMBER], [DOCDATE], [Reason], [Lineitmseq], [Item_Number], [LineItem_Option], [Item_Description], [Qty_Stock], [Qty_Add_Stock], [Qty_Remove_Stock], [Item_Cost], [Qty_After_Stock], [Expected_Stock], [Counted_Stock], [Created_User], [Created_Date], [Created_time]) VALUES (N'SA0005', CAST(N'2024-02-26T08:22:37.000' AS DateTime), N'Receive Items', 10, N'ITM0001', CAST(1.00000 AS Numeric(19, 5)), N'SERAGAM SD (S / GS)', CAST(100.00000 AS Numeric(19, 5)), CAST(10.00000 AS Numeric(19, 5)), CAST(0.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), CAST(110.00000 AS Numeric(19, 5)), CAST(0.00000 AS Numeric(19, 5)), CAST(0.00000 AS Numeric(19, 5)), N'USER1', CAST(N'2024-02-26T00:00:00.000' AS DateTime), CAST(N'1900-01-01T20:22:37.560' AS DateTime))
GO
INSERT [dbo].[POS_TrxAdjustment_DetailHIST] ([DOCNUMBER], [DOCDATE], [Reason], [Lineitmseq], [Item_Number], [LineItem_Option], [Item_Description], [Qty_Stock], [Qty_Add_Stock], [Qty_Remove_Stock], [Item_Cost], [Qty_After_Stock], [Expected_Stock], [Counted_Stock], [Created_User], [Created_Date], [Created_time]) VALUES (N'SA0006', CAST(N'2024-02-26T08:25:45.000' AS DateTime), N'Damage', 10, N'ITM0001', CAST(1.00000 AS Numeric(19, 5)), N'SERAGAM SD (S / GS)', CAST(100.00000 AS Numeric(19, 5)), CAST(0.00000 AS Numeric(19, 5)), CAST(20.00000 AS Numeric(19, 5)), CAST(0.00000 AS Numeric(19, 5)), CAST(80.00000 AS Numeric(19, 5)), CAST(0.00000 AS Numeric(19, 5)), CAST(0.00000 AS Numeric(19, 5)), N'USER1', CAST(N'2024-02-26T00:00:00.000' AS DateTime), CAST(N'1900-01-01T20:25:45.873' AS DateTime))
GO
INSERT [dbo].[POS_TrxAdjustment_DetailHIST] ([DOCNUMBER], [DOCDATE], [Reason], [Lineitmseq], [Item_Number], [LineItem_Option], [Item_Description], [Qty_Stock], [Qty_Add_Stock], [Qty_Remove_Stock], [Item_Cost], [Qty_After_Stock], [Expected_Stock], [Counted_Stock], [Created_User], [Created_Date], [Created_time]) VALUES (N'SA0007', CAST(N'2024-02-26T08:29:09.000' AS DateTime), N'Loss', 10, N'ITM0001', CAST(1.00000 AS Numeric(19, 5)), N'SERAGAM SD (S / GS)', CAST(100.00000 AS Numeric(19, 5)), CAST(0.00000 AS Numeric(19, 5)), CAST(10.00000 AS Numeric(19, 5)), CAST(0.00000 AS Numeric(19, 5)), CAST(90.00000 AS Numeric(19, 5)), CAST(0.00000 AS Numeric(19, 5)), CAST(0.00000 AS Numeric(19, 5)), N'USER1', CAST(N'2024-02-26T00:00:00.000' AS DateTime), CAST(N'1900-01-01T20:29:09.240' AS DateTime))
GO
INSERT [dbo].[POS_TrxAdjustment_DetailHIST] ([DOCNUMBER], [DOCDATE], [Reason], [Lineitmseq], [Item_Number], [LineItem_Option], [Item_Description], [Qty_Stock], [Qty_Add_Stock], [Qty_Remove_Stock], [Item_Cost], [Qty_After_Stock], [Expected_Stock], [Counted_Stock], [Created_User], [Created_Date], [Created_time]) VALUES (N'SA0008', CAST(N'2024-02-26T08:30:01.000' AS DateTime), N'Inventory Count', 10, N'ITM0001', CAST(1.00000 AS Numeric(19, 5)), N'SERAGAM SD (S / GS)', CAST(0.00000 AS Numeric(19, 5)), CAST(0.00000 AS Numeric(19, 5)), CAST(0.00000 AS Numeric(19, 5)), CAST(0.00000 AS Numeric(19, 5)), CAST(0.00000 AS Numeric(19, 5)), CAST(100.00000 AS Numeric(19, 5)), CAST(80.00000 AS Numeric(19, 5)), N'USER1', CAST(N'2024-02-26T00:00:00.000' AS DateTime), CAST(N'1900-01-01T20:30:01.937' AS DateTime))
GO
INSERT [dbo].[POS_TrxAdjustment_DetailHIST] ([DOCNUMBER], [DOCDATE], [Reason], [Lineitmseq], [Item_Number], [LineItem_Option], [Item_Description], [Qty_Stock], [Qty_Add_Stock], [Qty_Remove_Stock], [Item_Cost], [Qty_After_Stock], [Expected_Stock], [Counted_Stock], [Created_User], [Created_Date], [Created_time]) VALUES (N'SA0009', CAST(N'2024-02-29T08:53:15.000' AS DateTime), N'Damage', 10, N'ITM0001', CAST(1.00000 AS Numeric(19, 5)), N'SERAGAM SD (S / GS)', CAST(100.00000 AS Numeric(19, 5)), CAST(0.00000 AS Numeric(19, 5)), CAST(10.00000 AS Numeric(19, 5)), CAST(0.00000 AS Numeric(19, 5)), CAST(90.00000 AS Numeric(19, 5)), CAST(0.00000 AS Numeric(19, 5)), CAST(0.00000 AS Numeric(19, 5)), N'USER1', CAST(N'2024-02-29T00:00:00.000' AS DateTime), CAST(N'1900-01-01T20:53:16.090' AS DateTime))
GO
INSERT [dbo].[POS_TrxAdjustment_DetailHIST] ([DOCNUMBER], [DOCDATE], [Reason], [Lineitmseq], [Item_Number], [LineItem_Option], [Item_Description], [Qty_Stock], [Qty_Add_Stock], [Qty_Remove_Stock], [Item_Cost], [Qty_After_Stock], [Expected_Stock], [Counted_Stock], [Created_User], [Created_Date], [Created_time]) VALUES (N'SA0010', CAST(N'2024-02-29T09:03:31.000' AS DateTime), N'Receive Items', 10, N'ITM0001', CAST(1.00000 AS Numeric(19, 5)), N'SERAGAM SD (S / GS)', CAST(100.00000 AS Numeric(19, 5)), CAST(10.00000 AS Numeric(19, 5)), CAST(0.00000 AS Numeric(19, 5)), CAST(50000.00000 AS Numeric(19, 5)), CAST(110.00000 AS Numeric(19, 5)), CAST(0.00000 AS Numeric(19, 5)), CAST(0.00000 AS Numeric(19, 5)), N'USER1', CAST(N'2024-02-29T00:00:00.000' AS DateTime), CAST(N'1900-01-01T21:03:31.310' AS DateTime))
GO
INSERT [dbo].[POS_TrxAdjustment_DetailHIST] ([DOCNUMBER], [DOCDATE], [Reason], [Lineitmseq], [Item_Number], [LineItem_Option], [Item_Description], [Qty_Stock], [Qty_Add_Stock], [Qty_Remove_Stock], [Item_Cost], [Qty_After_Stock], [Expected_Stock], [Counted_Stock], [Created_User], [Created_Date], [Created_time]) VALUES (N'SA0011', CAST(N'2024-02-29T09:11:23.000' AS DateTime), N'Loss', 10, N'ITM0001', CAST(1.00000 AS Numeric(19, 5)), N'SERAGAM SD (S / GS)', CAST(100.00000 AS Numeric(19, 5)), CAST(0.00000 AS Numeric(19, 5)), CAST(10.00000 AS Numeric(19, 5)), CAST(0.00000 AS Numeric(19, 5)), CAST(90.00000 AS Numeric(19, 5)), CAST(0.00000 AS Numeric(19, 5)), CAST(0.00000 AS Numeric(19, 5)), N'USER1', CAST(N'2024-02-29T00:00:00.000' AS DateTime), CAST(N'1900-01-01T21:11:23.960' AS DateTime))
GO
INSERT [dbo].[POS_TrxAdjustment_DetailHIST] ([DOCNUMBER], [DOCDATE], [Reason], [Lineitmseq], [Item_Number], [LineItem_Option], [Item_Description], [Qty_Stock], [Qty_Add_Stock], [Qty_Remove_Stock], [Item_Cost], [Qty_After_Stock], [Expected_Stock], [Counted_Stock], [Created_User], [Created_Date], [Created_time]) VALUES (N'SA0012', CAST(N'2024-03-03T03:22:00.000' AS DateTime), N'Damage', 10, N'ITM0001', CAST(1.00000 AS Numeric(19, 5)), N'SERAGAM SD (S / GS)', CAST(100.00000 AS Numeric(19, 5)), CAST(0.00000 AS Numeric(19, 5)), CAST(10.00000 AS Numeric(19, 5)), CAST(0.00000 AS Numeric(19, 5)), CAST(90.00000 AS Numeric(19, 5)), CAST(0.00000 AS Numeric(19, 5)), CAST(0.00000 AS Numeric(19, 5)), N'USER1', CAST(N'2024-03-03T00:00:00.000' AS DateTime), CAST(N'1900-01-01T15:22:00.870' AS DateTime))
GO
INSERT [dbo].[POS_TrxAdjustment_DetailHIST] ([DOCNUMBER], [DOCDATE], [Reason], [Lineitmseq], [Item_Number], [LineItem_Option], [Item_Description], [Qty_Stock], [Qty_Add_Stock], [Qty_Remove_Stock], [Item_Cost], [Qty_After_Stock], [Expected_Stock], [Counted_Stock], [Created_User], [Created_Date], [Created_time]) VALUES (N'SA0013', CAST(N'2024-03-03T03:36:21.000' AS DateTime), N'Loss', 10, N'ITM0001', CAST(1.00000 AS Numeric(19, 5)), N'SERAGAM SD (S / GS)', CAST(100.00000 AS Numeric(19, 5)), CAST(0.00000 AS Numeric(19, 5)), CAST(10.00000 AS Numeric(19, 5)), CAST(0.00000 AS Numeric(19, 5)), CAST(90.00000 AS Numeric(19, 5)), CAST(0.00000 AS Numeric(19, 5)), CAST(0.00000 AS Numeric(19, 5)), N'USER1', CAST(N'2024-03-03T00:00:00.000' AS DateTime), CAST(N'1900-01-01T15:36:21.150' AS DateTime))
GO
INSERT [dbo].[POS_TrxAdjustment_Header] ([DOCNUMBER], [DOCDATE], [Site_ID], [Site_Name], [Reason], [Total_Line_Item], [Notes], [Created_User], [Created_Date], [Created_time], [Modified_User], [Modified_Date], [Modified_time]) VALUES (N'SA0002', CAST(N'2024-02-24T03:10:35.000' AS DateTime), N'SITE0001', N'SITE A', N'Receive Items', 1, N'terima barang ', N'USER1', CAST(N'2024-02-24T00:00:00.000' AS DateTime), CAST(N'1900-01-01T15:10:36.153' AS DateTime), N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_TrxAdjustment_Header] ([DOCNUMBER], [DOCDATE], [Site_ID], [Site_Name], [Reason], [Total_Line_Item], [Notes], [Created_User], [Created_Date], [Created_time], [Modified_User], [Modified_Date], [Modified_time]) VALUES (N'SA0003', CAST(N'2024-02-24T03:22:48.000' AS DateTime), N'SITE0001', N'SITE A', N'Damage', 1, N'rusak', N'USER1', CAST(N'2024-02-24T00:00:00.000' AS DateTime), CAST(N'1900-01-01T15:22:49.140' AS DateTime), N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_TrxAdjustment_Header] ([DOCNUMBER], [DOCDATE], [Site_ID], [Site_Name], [Reason], [Total_Line_Item], [Notes], [Created_User], [Created_Date], [Created_time], [Modified_User], [Modified_Date], [Modified_time]) VALUES (N'SA0004', CAST(N'2024-02-24T03:28:24.000' AS DateTime), N'SITE0001', N'SITE A', N'Loss', 1, N'hilang', N'USER1', CAST(N'2024-02-24T00:00:00.000' AS DateTime), CAST(N'1900-01-01T15:28:24.773' AS DateTime), N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_TrxAdjustment_Header] ([DOCNUMBER], [DOCDATE], [Site_ID], [Site_Name], [Reason], [Total_Line_Item], [Notes], [Created_User], [Created_Date], [Created_time], [Modified_User], [Modified_Date], [Modified_time]) VALUES (N'SA0005', CAST(N'2024-02-26T08:22:37.000' AS DateTime), N'SITE0002', N'SITE B', N'Receive Items', 1, N'testting', N'USER1', CAST(N'2024-02-26T00:00:00.000' AS DateTime), CAST(N'1900-01-01T20:22:37.530' AS DateTime), N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_TrxAdjustment_Header] ([DOCNUMBER], [DOCDATE], [Site_ID], [Site_Name], [Reason], [Total_Line_Item], [Notes], [Created_User], [Created_Date], [Created_time], [Modified_User], [Modified_Date], [Modified_time]) VALUES (N'SA0006', CAST(N'2024-02-26T08:25:45.000' AS DateTime), N'SITE0001', N'SITE A', N'Damage', 1, N'', N'USER1', CAST(N'2024-02-26T00:00:00.000' AS DateTime), CAST(N'1900-01-01T20:25:45.860' AS DateTime), N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_TrxAdjustment_Header] ([DOCNUMBER], [DOCDATE], [Site_ID], [Site_Name], [Reason], [Total_Line_Item], [Notes], [Created_User], [Created_Date], [Created_time], [Modified_User], [Modified_Date], [Modified_time]) VALUES (N'SA0007', CAST(N'2024-02-26T08:29:09.000' AS DateTime), N'SITE0001', N'SITE A', N'Loss', 1, N'', N'USER1', CAST(N'2024-02-26T00:00:00.000' AS DateTime), CAST(N'1900-01-01T20:29:09.237' AS DateTime), N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_TrxAdjustment_Header] ([DOCNUMBER], [DOCDATE], [Site_ID], [Site_Name], [Reason], [Total_Line_Item], [Notes], [Created_User], [Created_Date], [Created_time], [Modified_User], [Modified_Date], [Modified_time]) VALUES (N'SA0008', CAST(N'2024-02-26T08:30:01.000' AS DateTime), N'SITE0001', N'SITE A', N'Inventory Count', 1, N'', N'USER1', CAST(N'2024-02-26T00:00:00.000' AS DateTime), CAST(N'1900-01-01T20:30:01.927' AS DateTime), N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_TrxAdjustment_Header] ([DOCNUMBER], [DOCDATE], [Site_ID], [Site_Name], [Reason], [Total_Line_Item], [Notes], [Created_User], [Created_Date], [Created_time], [Modified_User], [Modified_Date], [Modified_time]) VALUES (N'SA0009', CAST(N'2024-02-29T08:53:15.000' AS DateTime), N'SITE0001', N'SITE A', N'Damage', 1, N'TESTING', N'USER1', CAST(N'2024-02-29T00:00:00.000' AS DateTime), CAST(N'1900-01-01T20:53:16.077' AS DateTime), N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_TrxAdjustment_Header] ([DOCNUMBER], [DOCDATE], [Site_ID], [Site_Name], [Reason], [Total_Line_Item], [Notes], [Created_User], [Created_Date], [Created_time], [Modified_User], [Modified_Date], [Modified_time]) VALUES (N'SA0010', CAST(N'2024-02-29T09:03:31.000' AS DateTime), N'SITE0001', N'SITE A', N'Receive Items', 1, N'', N'USER1', CAST(N'2024-02-29T00:00:00.000' AS DateTime), CAST(N'1900-01-01T21:03:31.300' AS DateTime), N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_TrxAdjustment_Header] ([DOCNUMBER], [DOCDATE], [Site_ID], [Site_Name], [Reason], [Total_Line_Item], [Notes], [Created_User], [Created_Date], [Created_time], [Modified_User], [Modified_Date], [Modified_time]) VALUES (N'SA0011', CAST(N'2024-02-29T09:11:23.000' AS DateTime), N'SITE0001', N'SITE A', N'Loss', 1, N'', N'USER1', CAST(N'2024-02-29T00:00:00.000' AS DateTime), CAST(N'1900-01-01T21:11:23.957' AS DateTime), N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_TrxAdjustment_Header] ([DOCNUMBER], [DOCDATE], [Site_ID], [Site_Name], [Reason], [Total_Line_Item], [Notes], [Created_User], [Created_Date], [Created_time], [Modified_User], [Modified_Date], [Modified_time]) VALUES (N'SA0012', CAST(N'2024-03-03T03:22:00.000' AS DateTime), N'SITE0001', N'SITE A', N'Damage', 1, N'', N'USER1', CAST(N'2024-03-03T00:00:00.000' AS DateTime), CAST(N'1900-01-01T15:22:00.863' AS DateTime), N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_TrxAdjustment_Header] ([DOCNUMBER], [DOCDATE], [Site_ID], [Site_Name], [Reason], [Total_Line_Item], [Notes], [Created_User], [Created_Date], [Created_time], [Modified_User], [Modified_Date], [Modified_time]) VALUES (N'SA0013', CAST(N'2024-03-03T03:36:21.000' AS DateTime), N'SITE0001', N'SITE A', N'Loss', 1, N'test', N'USER1', CAST(N'2024-03-03T00:00:00.000' AS DateTime), CAST(N'1900-01-01T15:36:21.147' AS DateTime), N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_TrxAdjustment_Header] ([DOCNUMBER], [DOCDATE], [Site_ID], [Site_Name], [Reason], [Total_Line_Item], [Notes], [Created_User], [Created_Date], [Created_time], [Modified_User], [Modified_Date], [Modified_time]) VALUES (N'SA0001', CAST(N'2024-01-27T09:46:54.000' AS DateTime), N'SITE0001', N'SITE A', N'Receive Items', 1, N'tester', N'USER1', CAST(N'2024-01-27T00:00:00.000' AS DateTime), CAST(N'1900-01-01T21:46:54.667' AS DateTime), N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[POS_TrxAdjustment_HeaderHIST] ([DOCNUMBER], [DOCDATE], [Site_ID], [Site_Name], [Reason], [Total_Line_Item], [Notes], [Created_User], [Created_Date], [Created_time]) VALUES (N'SA0001', CAST(N'2024-01-27T09:46:54.000' AS DateTime), N'SITE0001', N'SITE A', N'Receive Items', 1, N'tester', N'USER1', CAST(N'2024-01-27T00:00:00.000' AS DateTime), CAST(N'1900-01-01T21:46:54.690' AS DateTime))
GO
INSERT [dbo].[POS_TrxAdjustment_HeaderHIST] ([DOCNUMBER], [DOCDATE], [Site_ID], [Site_Name], [Reason], [Total_Line_Item], [Notes], [Created_User], [Created_Date], [Created_time]) VALUES (N'SA0002', CAST(N'2024-02-24T03:10:35.000' AS DateTime), N'SITE0001', N'SITE A', N'Receive Items', 1, N'terima barang ', N'USER1', CAST(N'2024-02-24T00:00:00.000' AS DateTime), CAST(N'1900-01-01T15:10:36.177' AS DateTime))
GO
INSERT [dbo].[POS_TrxAdjustment_HeaderHIST] ([DOCNUMBER], [DOCDATE], [Site_ID], [Site_Name], [Reason], [Total_Line_Item], [Notes], [Created_User], [Created_Date], [Created_time]) VALUES (N'SA0003', CAST(N'2024-02-24T03:22:48.000' AS DateTime), N'SITE0001', N'SITE A', N'Damage', 1, N'rusak', N'USER1', CAST(N'2024-02-24T00:00:00.000' AS DateTime), CAST(N'1900-01-01T15:22:49.143' AS DateTime))
GO
INSERT [dbo].[POS_TrxAdjustment_HeaderHIST] ([DOCNUMBER], [DOCDATE], [Site_ID], [Site_Name], [Reason], [Total_Line_Item], [Notes], [Created_User], [Created_Date], [Created_time]) VALUES (N'SA0004', CAST(N'2024-02-24T03:28:24.000' AS DateTime), N'SITE0001', N'SITE A', N'Loss', 1, N'hilang', N'USER1', CAST(N'2024-02-24T00:00:00.000' AS DateTime), CAST(N'1900-01-01T15:28:24.780' AS DateTime))
GO
INSERT [dbo].[POS_TrxAdjustment_HeaderHIST] ([DOCNUMBER], [DOCDATE], [Site_ID], [Site_Name], [Reason], [Total_Line_Item], [Notes], [Created_User], [Created_Date], [Created_time]) VALUES (N'SA0005', CAST(N'2024-02-26T08:22:37.000' AS DateTime), N'SITE0002', N'SITE B', N'Receive Items', 1, N'testting', N'USER1', CAST(N'2024-02-26T00:00:00.000' AS DateTime), CAST(N'1900-01-01T20:22:37.560' AS DateTime))
GO
INSERT [dbo].[POS_TrxAdjustment_HeaderHIST] ([DOCNUMBER], [DOCDATE], [Site_ID], [Site_Name], [Reason], [Total_Line_Item], [Notes], [Created_User], [Created_Date], [Created_time]) VALUES (N'SA0006', CAST(N'2024-02-26T08:25:45.000' AS DateTime), N'SITE0001', N'SITE A', N'Damage', 1, N'', N'USER1', CAST(N'2024-02-26T00:00:00.000' AS DateTime), CAST(N'1900-01-01T20:25:45.870' AS DateTime))
GO
INSERT [dbo].[POS_TrxAdjustment_HeaderHIST] ([DOCNUMBER], [DOCDATE], [Site_ID], [Site_Name], [Reason], [Total_Line_Item], [Notes], [Created_User], [Created_Date], [Created_time]) VALUES (N'SA0007', CAST(N'2024-02-26T08:29:09.000' AS DateTime), N'SITE0001', N'SITE A', N'Loss', 1, N'', N'USER1', CAST(N'2024-02-26T00:00:00.000' AS DateTime), CAST(N'1900-01-01T20:29:09.240' AS DateTime))
GO
INSERT [dbo].[POS_TrxAdjustment_HeaderHIST] ([DOCNUMBER], [DOCDATE], [Site_ID], [Site_Name], [Reason], [Total_Line_Item], [Notes], [Created_User], [Created_Date], [Created_time]) VALUES (N'SA0008', CAST(N'2024-02-26T08:30:01.000' AS DateTime), N'SITE0001', N'SITE A', N'Inventory Count', 1, N'', N'USER1', CAST(N'2024-02-26T00:00:00.000' AS DateTime), CAST(N'1900-01-01T20:30:01.937' AS DateTime))
GO
INSERT [dbo].[POS_TrxAdjustment_HeaderHIST] ([DOCNUMBER], [DOCDATE], [Site_ID], [Site_Name], [Reason], [Total_Line_Item], [Notes], [Created_User], [Created_Date], [Created_time]) VALUES (N'SA0009', CAST(N'2024-02-29T08:53:15.000' AS DateTime), N'SITE0001', N'SITE A', N'Damage', 1, N'TESTING', N'USER1', CAST(N'2024-02-29T00:00:00.000' AS DateTime), CAST(N'1900-01-01T20:53:16.087' AS DateTime))
GO
INSERT [dbo].[POS_TrxAdjustment_HeaderHIST] ([DOCNUMBER], [DOCDATE], [Site_ID], [Site_Name], [Reason], [Total_Line_Item], [Notes], [Created_User], [Created_Date], [Created_time]) VALUES (N'SA0010', CAST(N'2024-02-29T09:03:31.000' AS DateTime), N'SITE0001', N'SITE A', N'Receive Items', 1, N'', N'USER1', CAST(N'2024-02-29T00:00:00.000' AS DateTime), CAST(N'1900-01-01T21:03:31.307' AS DateTime))
GO
INSERT [dbo].[POS_TrxAdjustment_HeaderHIST] ([DOCNUMBER], [DOCDATE], [Site_ID], [Site_Name], [Reason], [Total_Line_Item], [Notes], [Created_User], [Created_Date], [Created_time]) VALUES (N'SA0011', CAST(N'2024-02-29T09:11:23.000' AS DateTime), N'SITE0001', N'SITE A', N'Loss', 1, N'', N'USER1', CAST(N'2024-02-29T00:00:00.000' AS DateTime), CAST(N'1900-01-01T21:11:23.960' AS DateTime))
GO
INSERT [dbo].[POS_TrxAdjustment_HeaderHIST] ([DOCNUMBER], [DOCDATE], [Site_ID], [Site_Name], [Reason], [Total_Line_Item], [Notes], [Created_User], [Created_Date], [Created_time]) VALUES (N'SA0012', CAST(N'2024-03-03T03:22:00.000' AS DateTime), N'SITE0001', N'SITE A', N'Damage', 1, N'', N'USER1', CAST(N'2024-03-03T00:00:00.000' AS DateTime), CAST(N'1900-01-01T15:22:00.870' AS DateTime))
GO
INSERT [dbo].[POS_TrxAdjustment_HeaderHIST] ([DOCNUMBER], [DOCDATE], [Site_ID], [Site_Name], [Reason], [Total_Line_Item], [Notes], [Created_User], [Created_Date], [Created_time]) VALUES (N'SA0013', CAST(N'2024-03-03T03:36:21.000' AS DateTime), N'SITE0001', N'SITE A', N'Loss', 1, N'test', N'USER1', CAST(N'2024-03-03T00:00:00.000' AS DateTime), CAST(N'1900-01-01T15:36:21.150' AS DateTime))
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [PK_POS_CategoryItem]    Script Date: 3/5/2024 11:03:05 PM ******/
ALTER TABLE [dbo].[POS_CategoryItem] ADD  CONSTRAINT [PK_POS_CategoryItem] PRIMARY KEY NONCLUSTERED 
(
	[Category_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [PK_POS_CategoryItem_History]    Script Date: 3/5/2024 11:03:05 PM ******/
ALTER TABLE [dbo].[POS_CategoryItem_History] ADD  CONSTRAINT [PK_POS_CategoryItem_History] PRIMARY KEY NONCLUSTERED 
(
	[Category_ID] ASC,
	[Line_Item] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [PK_POS_CompositeItem]    Script Date: 3/5/2024 11:03:05 PM ******/
ALTER TABLE [dbo].[POS_CompositeItem] ADD  CONSTRAINT [PK_POS_CompositeItem] PRIMARY KEY NONCLUSTERED 
(
	[Item_Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [PK_POS_CompositeItem_History]    Script Date: 3/5/2024 11:03:05 PM ******/
ALTER TABLE [dbo].[POS_CompositeItem_History] ADD  CONSTRAINT [PK_POS_CompositeItem_History] PRIMARY KEY NONCLUSTERED 
(
	[Item_Number] ASC,
	[Line_Item] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [PK_POS_Customer]    Script Date: 3/5/2024 11:03:05 PM ******/
ALTER TABLE [dbo].[POS_Customer] ADD  CONSTRAINT [PK_POS_Customer] PRIMARY KEY NONCLUSTERED 
(
	[Customer_ID] ASC,
	[Customer_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [PK_POS_Customer_History]    Script Date: 3/5/2024 11:03:05 PM ******/
ALTER TABLE [dbo].[POS_Customer_History] ADD  CONSTRAINT [PK_POS_Customer_History] PRIMARY KEY NONCLUSTERED 
(
	[Customer_ID] ASC,
	[Customer_Code] ASC,
	[Line_Item] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [PK_POS_Device]    Script Date: 3/5/2024 11:03:05 PM ******/
ALTER TABLE [dbo].[POS_Device] ADD  CONSTRAINT [PK_POS_Device] PRIMARY KEY NONCLUSTERED 
(
	[POS_Device_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [PK_POS_Device_History]    Script Date: 3/5/2024 11:03:05 PM ******/
ALTER TABLE [dbo].[POS_Device_History] ADD  CONSTRAINT [PK_POS_Device_History] PRIMARY KEY NONCLUSTERED 
(
	[POS_Device_ID] ASC,
	[Line_Item] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [PK_POS_Discount]    Script Date: 3/5/2024 11:03:05 PM ******/
ALTER TABLE [dbo].[POS_Discount] ADD  CONSTRAINT [PK_POS_Discount] PRIMARY KEY NONCLUSTERED 
(
	[Discount_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [PK_POS_Discount_History]    Script Date: 3/5/2024 11:03:05 PM ******/
ALTER TABLE [dbo].[POS_Discount_History] ADD  CONSTRAINT [PK_POS_Discount_History] PRIMARY KEY NONCLUSTERED 
(
	[Discount_ID] ASC,
	[Line_Item] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [PK_POS_Employee]    Script Date: 3/5/2024 11:03:05 PM ******/
ALTER TABLE [dbo].[POS_Employee] ADD  CONSTRAINT [PK_POS_Employee] PRIMARY KEY NONCLUSTERED 
(
	[Employee_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [PK_POS_Employee_History]    Script Date: 3/5/2024 11:03:05 PM ******/
ALTER TABLE [dbo].[POS_Employee_History] ADD  CONSTRAINT [PK_POS_Employee_History] PRIMARY KEY NONCLUSTERED 
(
	[Employee_ID] ASC,
	[Line_Item] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [PK_POS_EmployeeRole]    Script Date: 3/5/2024 11:03:05 PM ******/
ALTER TABLE [dbo].[POS_EmployeeRole] ADD  CONSTRAINT [PK_POS_EmployeeRole] PRIMARY KEY NONCLUSTERED 
(
	[Role_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [PK_POS_EmployeeRole_History]    Script Date: 3/5/2024 11:03:05 PM ******/
ALTER TABLE [dbo].[POS_EmployeeRole_History] ADD  CONSTRAINT [PK_POS_EmployeeRole_History] PRIMARY KEY NONCLUSTERED 
(
	[Role_ID] ASC,
	[Line_Item] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [PK_POS_Item]    Script Date: 3/5/2024 11:03:05 PM ******/
ALTER TABLE [dbo].[POS_Item] ADD  CONSTRAINT [PK_POS_Item] PRIMARY KEY NONCLUSTERED 
(
	[Item_Number] ASC,
	[Site_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [PK_POS_Item_History]    Script Date: 3/5/2024 11:03:05 PM ******/
ALTER TABLE [dbo].[POS_Item_History] ADD  CONSTRAINT [PK_POS_Item_History] PRIMARY KEY NONCLUSTERED 
(
	[Item_Number] ASC,
	[Site_ID] ASC,
	[Line_Item] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [PK_POS_ItemInventory]    Script Date: 3/5/2024 11:03:05 PM ******/
ALTER TABLE [dbo].[POS_ItemInventory] ADD  CONSTRAINT [PK_POS_ItemInventory] PRIMARY KEY NONCLUSTERED 
(
	[Item_Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [PK_POS_ItemInventory_History]    Script Date: 3/5/2024 11:03:05 PM ******/
ALTER TABLE [dbo].[POS_ItemInventory_History] ADD  CONSTRAINT [PK_POS_ItemInventory_History] PRIMARY KEY NONCLUSTERED 
(
	[Item_Number] ASC,
	[Line_Item] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [PK_POS_ItemVariant]    Script Date: 3/5/2024 11:03:05 PM ******/
ALTER TABLE [dbo].[POS_ItemVariant] ADD  CONSTRAINT [PK_POS_ItemVariant] PRIMARY KEY NONCLUSTERED 
(
	[Item_Number] ASC,
	[Site_ID] ASC,
	[LineItem_Option] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [PK_POS_ItemVariant_History]    Script Date: 3/5/2024 11:03:05 PM ******/
ALTER TABLE [dbo].[POS_ItemVariant_History] ADD  CONSTRAINT [PK_POS_ItemVariant_History] PRIMARY KEY NONCLUSTERED 
(
	[Item_Number] ASC,
	[Site_ID] ASC,
	[LineItem_Option] ASC,
	[Line_Item] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [PK_POS_Set_Site]    Script Date: 3/5/2024 11:03:05 PM ******/
ALTER TABLE [dbo].[POS_Set_Site] ADD  CONSTRAINT [PK_POS_Set_Site] PRIMARY KEY NONCLUSTERED 
(
	[Site_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [PK_POS_Set_Site_History]    Script Date: 3/5/2024 11:03:05 PM ******/
ALTER TABLE [dbo].[POS_Set_Site_History] ADD  CONSTRAINT [PK_POS_Set_Site_History] PRIMARY KEY NONCLUSTERED 
(
	[Site_ID] ASC,
	[Line_Item] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [PK_POS_Set_Taxes]    Script Date: 3/5/2024 11:03:05 PM ******/
ALTER TABLE [dbo].[POS_Set_Taxes] ADD  CONSTRAINT [PK_POS_Set_Taxes] PRIMARY KEY NONCLUSTERED 
(
	[Tax_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [PK_POS_Set_Taxes_History]    Script Date: 3/5/2024 11:03:05 PM ******/
ALTER TABLE [dbo].[POS_Set_Taxes_History] ADD  CONSTRAINT [PK_POS_Set_Taxes_History] PRIMARY KEY NONCLUSTERED 
(
	[Tax_ID] ASC,
	[Line_Item] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [PK_POS_TrxAdjustment_Detail]    Script Date: 3/5/2024 11:03:05 PM ******/
ALTER TABLE [dbo].[POS_TrxAdjustment_Detail] ADD  CONSTRAINT [PK_POS_TrxAdjustment_Detail] PRIMARY KEY NONCLUSTERED 
(
	[DOCNUMBER] ASC,
	[Item_Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [PK_POS_TrxAdjustment_Header]    Script Date: 3/5/2024 11:03:05 PM ******/
ALTER TABLE [dbo].[POS_TrxAdjustment_Header] ADD  CONSTRAINT [PK_POS_TrxAdjustment_Header] PRIMARY KEY NONCLUSTERED 
(
	[DOCNUMBER] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [PK_POS_TrxItemTrf_DetailHIST]    Script Date: 3/5/2024 11:03:05 PM ******/
ALTER TABLE [dbo].[POS_TrxItemTrf_DetailHIST] ADD  CONSTRAINT [PK_POS_TrxItemTrf_DetailHIST] PRIMARY KEY NONCLUSTERED 
(
	[DOCNUMBER] ASC,
	[Lineitmseq] ASC,
	[Item_Number] ASC,
	[Created_Date] ASC,
	[Created_time] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [PK_POS_TrxItemTrf_DetailPOST]    Script Date: 3/5/2024 11:03:05 PM ******/
ALTER TABLE [dbo].[POS_TrxItemTrf_DetailPOST] ADD  CONSTRAINT [PK_POS_TrxItemTrf_DetailPOST] PRIMARY KEY NONCLUSTERED 
(
	[DOCNUMBER] ASC,
	[Lineitmseq] ASC,
	[Item_Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [PK_POS_TrxItemTrf_DetailTEMP]    Script Date: 3/5/2024 11:03:05 PM ******/
ALTER TABLE [dbo].[POS_TrxItemTrf_DetailTEMP] ADD  CONSTRAINT [PK_POS_TrxItemTrf_DetailTEMP] PRIMARY KEY NONCLUSTERED 
(
	[DOCNUMBER] ASC,
	[Lineitmseq] ASC,
	[Item_Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [PK_POS_TrxItemTrf_HeaderHIST]    Script Date: 3/5/2024 11:03:05 PM ******/
ALTER TABLE [dbo].[POS_TrxItemTrf_HeaderHIST] ADD  CONSTRAINT [PK_POS_TrxItemTrf_HeaderHIST] PRIMARY KEY NONCLUSTERED 
(
	[DOCNUMBER] ASC,
	[Created_Date] ASC,
	[Created_time] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [PK_POS_TrxItemTrf_HeaderPOST]    Script Date: 3/5/2024 11:03:05 PM ******/
ALTER TABLE [dbo].[POS_TrxItemTrf_HeaderPOST] ADD  CONSTRAINT [PK_POS_TrxItemTrf_HeaderPOST] PRIMARY KEY NONCLUSTERED 
(
	[DOCNUMBER] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [PK_POS_TrxItemTrf_HeaderTEMP]    Script Date: 3/5/2024 11:03:05 PM ******/
ALTER TABLE [dbo].[POS_TrxItemTrf_HeaderTEMP] ADD  CONSTRAINT [PK_POS_TrxItemTrf_HeaderTEMP] PRIMARY KEY NONCLUSTERED 
(
	[DOCNUMBER] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[POS_Device]  WITH CHECK ADD  CONSTRAINT [FK_POS_Device] FOREIGN KEY([Store_ID])
REFERENCES [dbo].[POS_Set_Stores] ([Store_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[POS_Device] CHECK CONSTRAINT [FK_POS_Device]
GO
ALTER TABLE [dbo].[POS_Employee]  WITH CHECK ADD  CONSTRAINT [FK_POS_Employee] FOREIGN KEY([Role_ID])
REFERENCES [dbo].[POS_EmployeeRole] ([Role_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[POS_Employee] CHECK CONSTRAINT [FK_POS_Employee]
GO
ALTER TABLE [dbo].[POS_Item]  WITH CHECK ADD  CONSTRAINT [FK_POS_Item_Cat] FOREIGN KEY([Category_ID])
REFERENCES [dbo].[POS_CategoryItem] ([Category_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[POS_Item] CHECK CONSTRAINT [FK_POS_Item_Cat]
GO
ALTER TABLE [dbo].[POS_ItemInventory]  WITH CHECK ADD  CONSTRAINT [FK_POS_ItemInventorySite] FOREIGN KEY([Site_ID])
REFERENCES [dbo].[POS_Set_Site] ([Site_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[POS_ItemInventory] CHECK CONSTRAINT [FK_POS_ItemInventorySite]
GO
ALTER TABLE [dbo].[POS_Set_Site]  WITH CHECK ADD  CONSTRAINT [FK_POS_Set_Site] FOREIGN KEY([Store_ID])
REFERENCES [dbo].[POS_Set_Stores] ([Store_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[POS_Set_Site] CHECK CONSTRAINT [FK_POS_Set_Site]
GO
ALTER TABLE [dbo].[POS_TrxAdjustment_Header]  WITH CHECK ADD  CONSTRAINT [FK_POS_TrxAdjustmentSites] FOREIGN KEY([Site_ID])
REFERENCES [dbo].[POS_Set_Site] ([Site_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[POS_TrxAdjustment_Header] CHECK CONSTRAINT [FK_POS_TrxAdjustmentSites]
GO
ALTER TABLE [dbo].[POS_TrxItemTrf_HeaderPOST]  WITH CHECK ADD  CONSTRAINT [FK_POS_TrxItemTrf_HeaderPOSTDst] FOREIGN KEY([DestSite_ID])
REFERENCES [dbo].[POS_Set_Site] ([Site_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[POS_TrxItemTrf_HeaderPOST] CHECK CONSTRAINT [FK_POS_TrxItemTrf_HeaderPOSTDst]
GO
ALTER TABLE [dbo].[POS_TrxItemTrf_HeaderPOST]  WITH CHECK ADD  CONSTRAINT [FK_POS_TrxItemTrf_HeaderPOSTSrc] FOREIGN KEY([SourceSite_ID])
REFERENCES [dbo].[POS_Set_Site] ([Site_ID])
GO
ALTER TABLE [dbo].[POS_TrxItemTrf_HeaderPOST] CHECK CONSTRAINT [FK_POS_TrxItemTrf_HeaderPOSTSrc]
GO
