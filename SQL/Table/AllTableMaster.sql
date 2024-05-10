/*
ALTER TABLE [dbo].[POS_Account] DROP CONSTRAINT [FK_POS_User]
GO
ALTER TABLE [dbo].[POS_Item] DROP CONSTRAINT [FK_POS_Item_Cat]
GO
ALTER TABLE [dbo].[POS_Employee] DROP CONSTRAINT [FK_POS_Employee]
GO
ALTER TABLE [dbo].[POS_ItemInventory] DROP CONSTRAINT [FK_POS_ItemInventorySite]
GO
*/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_LoginUser]') AND type in (N'U'))
DROP TABLE [dbo].[POS_LoginUser]
GO

/****** Object:  Table [dbo].[POS_LoginUser]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_LoginUser
(
	UserID nvarchar(20) NOT NULL UNIQUE,
	EmailAddress nvarchar(250) NOT NULL,
	[PASSWORD] nvarchar(100) NOT NULL,
	Business_Name nvarchar(100) NOT NULL,
	Currency nvarchar(30) NOT NULL,
	Country nvarchar(100) NOT NULL,
	Verify int NOT NULL,
	Created_User nvarchar(100) NOT NULL,
	Created_Date DATETIME NOT NULL,
	Modified_User nvarchar(100) NOT NULL,
	Modified_Date DATETIME NOT NULL,
	CONSTRAINT PK_POS_LoginUser PRIMARY KEY NONCLUSTERED (UserID ASC, EmailAddress ASC),
)
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_Account]') AND type in (N'U'))
DROP TABLE [dbo].[POS_Account]
GO

/****** Object:  Table [dbo].[POS_Account]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_Account
(
	UserID nvarchar(20) NOT NULL, 
	Business_Name nvarchar(100) NOT NULL,
	EmailAddress nvarchar(250) NOT NULL,
	[Password] nvarchar(30) NOT NULL,
	CurrencyID nvarchar(20) NOT NULL,
	Currency nvarchar(30) NOT NULL,
	Timezone nvarchar(30) NOT NULL,
	Created_User nvarchar(30) NOT NULL,
	Created_Date DATETIME NOT NULL,
	Modified_User nvarchar(30),
	Modified_Date DATETIME,
	CONSTRAINT PK_POS_Account PRIMARY KEY NONCLUSTERED (UserID ASC),
	CONSTRAINT FK_POS_User FOREIGN KEY (UserID, EmailAddress)
	REFERENCES POS_LoginUser (UserID, EmailAddress)
	ON DELETE CASCADE
	ON UPDATE CASCADE
)
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_CategoryItem]') AND type in (N'U'))
DROP TABLE [dbo].[POS_CategoryItem]
GO

/****** Object:  Table [dbo].[POS_CategoryItem]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_CategoryItem
(
	Category_ID nvarchar(20) NOT NULL, 
	Category_Name nvarchar(250) NOT NULL,
	Category_Color nvarchar(20) NOT NULL, 
	Created_User nvarchar(30),
	Created_Date DATETIME,
	Modified_User nvarchar(30),
	Modified_Date DATETIME,
	CONSTRAINT PK_POS_CategoryItem PRIMARY KEY NONCLUSTERED (Category_ID),
)
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_CompositeItem]') AND type in (N'U'))
	DROP TABLE [dbo].[POS_CompositeItem]
GO

/****** Object:  Table [dbo].[POS_CompositeItem]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_CompositeItem
(
	Item_Number nvarchar(20) NOT NULL, 
	Item_Quantity numeric(19,5) NOT NULL,
	Item_Cost numeric(19,5) NOT NULL,
	Item_Composite int NOT NULL,
	Created_User nvarchar(30),
	Created_Date DATETIME,
	Modified_User nvarchar(30),
	Modified_Date DATETIME,
	CONSTRAINT PK_POS_CompositeItem PRIMARY KEY NONCLUSTERED (Item_Number),
)
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_Customer]') AND type in (N'U'))
DROP TABLE [dbo].[POS_Customer]
GO

/****** Object:  Table [dbo].[POS_Customer]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_Customer
(
	Customer_ID nvarchar(20) NOT NULL, 
	Customer_Name nvarchar(250) NOT NULL,
	Email nvarchar(250) NOT NULL,
	Phone nvarchar(20) NOT NULL,
	Address nvarchar(300) NOT NULL,
	Country nvarchar(100) NOT NULL,
	Province nvarchar(100) NOT NULL,
	City nvarchar(100) NOT NULL,
	Postal_Code nvarchar(10) NOT NULL,
	Customer_Code nvarchar(20) NOT NULL,
	Note nvarchar(255) NOT NULL,
	Created_User nvarchar(30),
	Created_Date DATETIME,
	Modified_User nvarchar(30),
	Modified_Date DATETIME,
	CONSTRAINT PK_POS_Customer PRIMARY KEY NONCLUSTERED (Customer_ID ASC, Customer_Code ASC),
)
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
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_Device]') AND type in (N'U'))
DROP TABLE [dbo].[POS_Device]
GO

/****** Object:  Table [dbo].[POS_Device]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_Device
(
	POS_Device_ID nvarchar(20) NOT NULL, 
	POS_Device_Name nvarchar(250) NOT NULL,
	Store_ID nvarchar(20) NOT NULL, 
	Store_Name nvarchar(100) NOT NULL, 
	Created_User nvarchar(30),
	Created_Date DATETIME,
	Modified_User nvarchar(30),
	Modified_Date DATETIME,
	CONSTRAINT PK_POS_Device PRIMARY KEY NONCLUSTERED (POS_Device_ID),
	CONSTRAINT FK_POS_Device FOREIGN KEY (Store_ID)
	REFERENCES POS_Set_Stores (Store_ID)
	ON DELETE CASCADE
	ON UPDATE CASCADE
)
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_Discount]') AND type in (N'U'))
DROP TABLE [dbo].[POS_Discount]
GO

/****** Object:  Table [dbo].[POS_Discount]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_Discount
(
	Discount_ID nvarchar(20) NOT NULL, 
	Discount_Name nvarchar(250) NOT NULL,
	Discount_Type int NOT NULL,
	Discount_Value numeric(19,5) NOT NULL,
	Restricted_Access int NOT NULL,
	Created_User nvarchar(30),
	Created_Date DATETIME,
	Modified_User nvarchar(30),
	Modified_Date DATETIME,
	CONSTRAINT PK_POS_Discount PRIMARY KEY NONCLUSTERED (Discount_ID),
)
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_EmployeeRole]') AND type in (N'U'))
DROP TABLE [dbo].[POS_EmployeeRole]
GO

/****** Object:  Table [dbo].[POS_EmployeeRole]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_EmployeeRole
(
	Role_ID nvarchar(20) NOT NULL,
	Role_Name nvarchar(100) NOT NULL,
	POS_Flag int NOT NULL,
	POS_AccessPayments int NOT NULL,
	POS_ApplyDiscount int NOT NULL,
	POS_ChangeTaxes int NOT NULL,
	POS_ViewReceipt int NOT NULL,
	POS_ReprintSendReceipt int NOT NULL,
	POS_ViewShift int NOT NULL,
	POS_ManageItemsPOS int NOT NULL,
	POS_ViewCostPOS int NOT NULL,
	POS_ChangeSetting int NOT NULL,
	BckOffice_Flag int NOT NULL,
	BckOffice_ViewSales int NOT NULL,
	BckOffice_ManageItemsOff int NOT NULL,
	BckOffice_ViewCostOff int NOT NULL,
	BckOffice_ManageEmployee int NOT NULL,
	BckOffice_ManageCustomers int NOT NULL,
	BckOffice_EditSetting int NOT NULL,
	BckOffice_ManagePayTypes int NOT NULL,
	BckOffice_ManageTaxes int NOT NULL,
	BckOffice_POSDevices int NOT NULL,
	Created_User nvarchar(30),
	Created_Date DATETIME,
	Modified_User nvarchar(30),
	Modified_Date DATETIME,
	CONSTRAINT PK_POS_EmployeeRole PRIMARY KEY NONCLUSTERED (Role_ID)
)
ALTER TABLE [dbo].[POS_Item] DROP CONSTRAINT [PK_POS_Item]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_Employee]') AND type in (N'U'))
DROP TABLE [dbo].[POS_Employee]
GO

/****** Object:  Table [dbo].[POS_Employee]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_Employee
(
	Employee_ID nvarchar(20) NOT NULL, 
	Employee_Name nvarchar(250) NOT NULL,
	Email nvarchar(250) NOT NULL,
	Phone nvarchar(20) NOT NULL,
	Role_ID nvarchar(20) NOT NULL,
	Created_User nvarchar(30),
	Created_Date DATETIME,
	Modified_User nvarchar(30),
	Modified_Date DATETIME,
	CONSTRAINT PK_POS_Employee PRIMARY KEY NONCLUSTERED (Employee_ID),
	CONSTRAINT FK_POS_Employee FOREIGN KEY (Role_ID)
	REFERENCES POS_EmployeeRole (Role_ID)
	ON DELETE CASCADE
	ON UPDATE CASCADE
)
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_Item]') AND type in (N'U'))
DROP TABLE [dbo].[POS_Item]
GO

/****** Object:  Table [dbo].[POS_Item]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_Item
(
	Item_Number nvarchar(20) NOT NULL, 
	Site_ID nvarchar(20) NOT NULL, 
	Item_Name nvarchar(50) NOT NULL, 
	Item_Description nvarchar(250) NOT NULL,
	UOFM nvarchar(30) NOT NULL,
	Category_ID nvarchar(20) NOT NULL,
	Item_Sales int NOT NULL,
	Item_SoldBy int NOT NULL,
	Item_Price numeric(19,5) NOT NULL,
	Item_Cost numeric(19,5) NOT NULL,
	Item_SKU nvarchar(10) NOT NULL,
	Item_Barcode nvarchar(MAX) NOT NULL,
	Composite_Item int NOT NULL,
	Track_Stock int NOT NULL,
	InStock int NOT NULL,
	LowStock int NOT NULL,
	Tax_ID nvarchar(20) NOT NULL,
	Representation int NOT NULL,
	Item_Color nvarchar(50) NOT NULL,
	Item_Shape nvarchar(50) NOT NULL,
	Item_Image nvarchar(MAX) NOT NULL,
	Created_User nvarchar(30),
	Created_Date DATETIME,
	Modified_User nvarchar(30),
	Modified_Date DATETIME,
	CONSTRAINT PK_POS_Item PRIMARY KEY NONCLUSTERED (Item_Number, Site_ID),
	CONSTRAINT FK_POS_Item_Cat FOREIGN KEY (Category_ID)
	REFERENCES POS_CategoryItem (Category_ID)
	--CONSTRAINT FK_POS_Item_Inventory FOREIGN KEY (Item_Number)
	--REFERENCES POS_ItemInventory (Item_Number),
	--CONSTRAINT FK_POS_Item_Composite FOREIGN KEY (Item_Number)
	--REFERENCES POS_CompositeItem (Item_Number),
	--CONSTRAINT FK_POS_Item_Variant FOREIGN KEY (Item_Number)
	--REFERENCES POS_ItemVariant (Item_Number)
	ON DELETE CASCADE
	ON UPDATE CASCADE
)

/*

begin tran

declare @p22 dbo.COMPTYPE

declare @p23 dbo.VARTYPE
insert into @p23 values(N'',1.0,0,N'Size / Color',N'Size / Color',1.0,N'S / Black',15000.0,12000.0,50,10,30,N'00001',N'')
insert into @p23 values(N'',2.0,0,N'Size / Color',N'Size / Color',2.0,N'S / White',15000.0,12000.0,50,10,30,N'00002',N'')
insert into @p23 values(N'',3.0,0,N'Size / Color',N'Size / Color',3.0,N'S / Red',15000.0,12000.0,50,10,30,N'00003',N'')
insert into @p23 values(N'',4.0,0,N'Size / Color',N'Size / Color',4.0,N'S / Blue',15000.0,12000.0,50,10,30,N'00004',N'')
insert into @p23 values(N'',5.0,0,N'Size / Color',N'Size / Color',5.0,N'M / Black',15000.0,12000.0,50,10,30,N'00005',N'')
insert into @p23 values(N'',6.0,0,N'Size / Color',N'Size / Color',6.0,N'M / White',15000.0,12000.0,50,10,30,N'00006',N'')
insert into @p23 values(N'',7.0,0,N'Size / Color',N'Size / Color',7.0,N'M / Red',15000.0,12000.0,50,10,30,N'00007',N'')
insert into @p23 values(N'',8.0,0,N'Size / Color',N'Size / Color',8.0,N'M / Blue',15000.0,12000.0,50,10,30,N'00008',N'')
insert into @p23 values(N'',9.0,0,N'Size / Color',N'Size / Color',9.0,N'L / Black',15000.0,12000.0,50,10,30,N'00009',N'')
insert into @p23 values(N'',10.0,0,N'Size / Color',N'Size / Color',10.0,N'L / White',15000.0,12000.0,50,10,30,N'00010',N'')
insert into @p23 values(N'',11.0,0,N'Size / Color',N'Size / Color',11.0,N'L / Red',15000.0,12000.0,50,10,30,N'00011',N'')
insert into @p23 values(N'',12.0,0,N'Size / Color',N'Size / Color',12.0,N'L / Blue',15000.0,12000.0,50,10,30,N'00012',N'')
insert into @p23 values(N'',13.0,0,N'Size / Color',N'Size / Color',13.0,N'XL / Black',15000.0,12000.0,50,10,30,N'00013',N'')
insert into @p23 values(N'',14.0,0,N'Size / Color',N'Size / Color',14.0,N'XL / White',15000.0,12000.0,50,10,30,N'00014',N'')
insert into @p23 values(N'',15.0,0,N'Size / Color',N'Size / Color',15.0,N'XL / Red',15000.0,12000.0,50,10,30,N'00015',N'')
insert into @p23 values(N'',16.0,0,N'Size / Color',N'Size / Color',16.0,N'XL / Blue',15000.0,12000.0,50,10,30,N'00016',N'')

exec Web_Items_SaveData @UserID=N'USER1',@Item_Number=N'',@Item_Name=N'Testing Item',@Item_Description=N'Tester',@UOFM=N'',@Category_ID=N'CAT0001',
@Item_Sales=0,@Item_SoldBy=1,@Item_Price=15000.0,@Item_Cost=12000.0,@Item_SKU=N'00001',@Item_Barcode=N'',@Composite_Item=0,@Track_Stock=1,@InStock=50,
@LowStock=10,@Tax_ID=N'TAX0001',@Representation=1,@Item_Color=N'bg-default',@Item_Shape=N'',@Item_Image=N'',@COMPTYPE=@p22,@VARTYPE=@p23

rollback

*/
--ALTER TABLE [dbo].[POS_ItemInventory] DROP CONSTRAINT [FK_POS_ItemInventorySite]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_Set_Site]') AND type in (N'U'))
DROP TABLE [dbo].[POS_Set_Site]
GO

/****** Object:  Table [dbo].[POS_Set_Site]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_Set_Site
(
	Site_ID nvarchar(20) NOT NULL, 
	DefaultSite int NOT NULL,
	Site_Name nvarchar(100) NOT NULL,
	Store_ID nvarchar(20) NOT NULL, 
	Store_Name nvarchar(100) NOT NULL, 
	Created_User nvarchar(30),
	Created_Date DATETIME,
	Modified_User nvarchar(30),
	Modified_Date DATETIME,
	CONSTRAINT PK_POS_Set_Site PRIMARY KEY NONCLUSTERED (Site_ID ASC),
	CONSTRAINT FK_POS_Set_Site FOREIGN KEY (Store_ID)
	REFERENCES POS_Set_Stores (Store_ID)
	ON DELETE CASCADE
	ON UPDATE CASCADE
)
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_ItemInventory]') AND type in (N'U'))
	DROP TABLE [dbo].[POS_ItemInventory]
GO

/****** Object:  Table [dbo].[POS_ItemInventory]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_ItemInventory
(
	Item_Number nvarchar(20) NOT NULL, 
	Item_Quantity numeric(19,5) NOT NULL,
	Site_ID nvarchar(20) NOT NULL, 
	Low_Stock numeric(19,5) NOT NULL,
	UOFM nvarchar(30) NOT NULL,
	Created_User nvarchar(30),
	Created_Date DATETIME,
	Modified_User nvarchar(30),
	Modified_Date DATETIME,
	CONSTRAINT PK_POS_ItemInventory PRIMARY KEY NONCLUSTERED (Item_Number),
	CONSTRAINT FK_POS_ItemInventorySite FOREIGN KEY (Site_ID)
	REFERENCES POS_Set_Site (Site_ID)
	ON DELETE CASCADE
	ON UPDATE CASCADE
)
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_ItemVariant]') AND type in (N'U'))
	DROP TABLE [dbo].[POS_ItemVariant]
GO

/****** Object:  Table [dbo].[POS_ItemVariant]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_ItemVariant
(
	Item_Number nvarchar(20) NOT NULL,
	Site_ID nvarchar(20) NOT NULL, 
	LineItem_Option numeric(19,5) NOT NULL,
	CB_Available int NOT NULL,
	Option_ID nvarchar(50) NOT NULL,
	Option_Name nvarchar(50) NOT NULL,
	LineItem_Variant numeric(19,5) NOT NULL,
	Variant_Name nvarchar(50) NOT NULL,
	Item_Price numeric(19,5) NOT NULL,
	Item_Cost numeric(19,5) NOT NULL,
	InStock int NOT NULL,
	LowStock int NOT NULL,
	OptimalStock int NOT NULL,
	Item_SKU nvarchar(10) NOT NULL,
	Item_Barcode nvarchar(MAX) NOT NULL,
	Created_User nvarchar(30),
	Created_Date DATETIME,
	Modified_User nvarchar(30),
	Modified_Date DATETIME,
	CONSTRAINT PK_POS_ItemVariant PRIMARY KEY NONCLUSTERED (Item_Number ASC, Site_ID ASC, LineItem_Option ASC),
)
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_RunningNumber]') AND type in (N'U'))
DROP TABLE [dbo].[POS_RunningNumber]
GO

/****** Object:  Table [dbo].[POS_RunningNumber]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_RunningNumber
(
	DocumentID nvarchar(4) NOT NULL, 
	CurrentNumber nvarchar(20) NOT NULL,
	CurrentDate DATETIME NOT NULL,
	CONSTRAINT PK_POS_RunningNumber PRIMARY KEY NONCLUSTERED (DocumentID ASC)
)
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_Set_Features]') AND type in (N'U'))
DROP TABLE [dbo].[POS_Set_Features]
GO

/****** Object:  Table [dbo].[POS_Set_Features]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_Set_Features
(
	Feature_ID nvarchar(20) NOT NULL,
	Feature_Shift int NOT NULL, 
	Feature_TimeClock int NOT NULL,
	Feature_LowStock int NOT NULL,
	Feature_NegativeStock int NOT NULL,
	Created_User nvarchar(30),
	Created_Date DATETIME,
	Modified_User nvarchar(30),
	Modified_Date DATETIME,
	CONSTRAINT PK_POS_Set_Features PRIMARY KEY NONCLUSTERED (Feature_ID ASC),
)
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_Set_PayTypes]') AND type in (N'U'))
DROP TABLE [dbo].[POS_Set_PayTypes]
GO

/****** Object:  Table [dbo].[POS_Set_PayTypes]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_Set_PayTypes
(
	Payment_ID nvarchar(20) NOT NULL, 
	Payment_Type nvarchar(100) NOT NULL,
	Payment_Name nvarchar(300) NOT NULL,
	LineItem int NOT NULL,
	AllStore int NOT NULL,
	Store_ID nvarchar(20) NOT NULL, 
	Store_Name nvarchar(100) NOT NULL, 
	Created_User nvarchar(30),
	Created_Date DATETIME,
	Modified_User nvarchar(30),
	Modified_Date DATETIME,
	CONSTRAINT PK_POS_Set_PayTypes PRIMARY KEY NONCLUSTERED (Payment_ID ASC, LineItem ASC),
	CONSTRAINT FK_POS_Set_PayTypes FOREIGN KEY (Store_ID)
	REFERENCES POS_Set_Stores (Store_ID)
	ON DELETE CASCADE
	ON UPDATE CASCADE
)
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_Set_SalesType]') AND type in (N'U'))
DROP TABLE [dbo].[POS_Set_SalesType]
GO

/****** Object:  Table [dbo].[POS_Set_SalesType]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_Set_SalesType
(
	SalesType_ID nvarchar(20) NOT NULL, 
	SalesType_Name nvarchar(100) NOT NULL,
	Store_ID nvarchar(20) NOT NULL, 
	Store_Name nvarchar(100) NOT NULL, 
	Created_User nvarchar(30),
	Created_Date DATETIME,
	Modified_User nvarchar(30),
	Modified_Date DATETIME,
	CONSTRAINT PK_POS_Set_SalesType PRIMARY KEY NONCLUSTERED (SalesType_ID ASC),
	CONSTRAINT FK_POS_Set_SalesType FOREIGN KEY (Store_ID)
	REFERENCES POS_Set_Stores (Store_ID)
	ON DELETE CASCADE
	ON UPDATE CASCADE
)
GO
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

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_Set_Taxes]') AND type in (N'U'))
DROP TABLE [dbo].[POS_Set_Taxes]
GO

/****** Object:  Table [dbo].[POS_Set_Taxes]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_Set_Taxes
(
	Tax_ID nvarchar(20) NOT NULL, 
	Tax_Name nvarchar(100) NOT NULL,
	Tax_Rate numeric(19,5) NOT NULL,
	Tax_Type int NOT NULL,
	Tax_Option int NOT NULL,
	Created_User nvarchar(30),
	Created_Date DATETIME,
	Modified_User nvarchar(30),
	Modified_Date DATETIME,
	CONSTRAINT PK_POS_Set_Taxes PRIMARY KEY NONCLUSTERED (Tax_ID ASC),
)
GO