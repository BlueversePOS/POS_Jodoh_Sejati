IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_Account_History]') AND type in (N'U'))
DROP TABLE [dbo].[POS_Account_History]
GO

/****** Object:  Table [dbo].[POS_Account_History]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_Account_History
(
	UserID nvarchar(20) NOT NULL, 
	Line_Item int NOT NULL,
	Business_Name nvarchar(100) NOT NULL,
	EmailAddress nvarchar(250) NOT NULL,
	[Password] nvarchar(30) NOT NULL,
	CurrencyID nvarchar(20) NOT NULL,
	Currency nvarchar(30) NOT NULL,
	Timezone nvarchar(30) NOT NULL,
	Created_User nvarchar(30) NOT NULL,
	Created_Date DATETIME NOT NULL,
	CONSTRAINT PK_POS_Account_History PRIMARY KEY NONCLUSTERED (UserID ASC, Line_Item ASC),
)
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_CategoryItem_History]') AND type in (N'U'))
DROP TABLE [dbo].[POS_CategoryItem_History]
GO

/****** Object:  Table [dbo].[POS_CategoryItem_History]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_CategoryItem_History
(
	Category_ID nvarchar(20) NOT NULL, 
	Line_Item int NOT NULL,
	Category_Name nvarchar(250) NOT NULL,
	Category_Color nvarchar(20) NOT NULL, 
	Created_User nvarchar(30),
	Created_Date DATETIME,
	CONSTRAINT PK_POS_CategoryItem_History PRIMARY KEY NONCLUSTERED (Category_ID ASC, Line_Item ASC),
)
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_CompositeItem_History]') AND type in (N'U'))
	DROP TABLE [dbo].[POS_CompositeItem_History]
GO

/****** Object:  Table [dbo].[POS_CompositeItem_History]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_CompositeItem_History
(
	Item_Number nvarchar(20) NOT NULL, 
	Line_Item int NOT NULL,
	Item_Quantity numeric(19,5) NOT NULL,
	Item_Cost numeric(19,5) NOT NULL,
	Item_Composite int NOT NULL,
	Created_User nvarchar(30),
	Created_Date DATETIME,
	CONSTRAINT PK_POS_CompositeItem_History PRIMARY KEY NONCLUSTERED (Item_Number ASC, Line_Item ASC),
)
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_Customer_History]') AND type in (N'U'))
DROP TABLE [dbo].[POS_Customer_History]
GO

/****** Object:  Table [dbo].[POS_Customer_History]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_Customer_History
(
	Customer_ID nvarchar(20) NOT NULL, 
	Customer_Name nvarchar(250) NOT NULL,
	Line_Item int NOT NULL,
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
	CONSTRAINT PK_POS_Customer_History PRIMARY KEY NONCLUSTERED (Customer_ID ASC, Customer_Code ASC, Line_Item ASC),
)
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_Device_History]') AND type in (N'U'))
DROP TABLE [dbo].[POS_Device_History]
GO

/****** Object:  Table [dbo].[POS_Device]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_Device_History
(
	POS_Device_ID nvarchar(20) NOT NULL, 
	POS_Device_Name nvarchar(250) NOT NULL,
	Line_Item int NOT NULL,
	Store_ID nvarchar(20) NOT NULL, 
	Store_Name nvarchar(100) NOT NULL, 
	Created_User nvarchar(30),
	Created_Date DATETIME
	CONSTRAINT PK_POS_Device_History PRIMARY KEY NONCLUSTERED (POS_Device_ID ASC, Line_Item ASC),
)
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_Discount_History]') AND type in (N'U'))
DROP TABLE [dbo].[POS_Discount_History]
GO

/****** Object:  Table [dbo].[POS_Discount]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_Discount_History
(
	Discount_ID nvarchar(20) NOT NULL, 
	Discount_Name nvarchar(250) NOT NULL,
	Line_Item int NOT NULL,
	Discount_Type int NOT NULL,
	Discount_Value numeric(19,5) NOT NULL,
	Restricted_Access int NOT NULL,
	Created_User nvarchar(30),
	Created_Date DATETIME,
	CONSTRAINT PK_POS_Discount_History PRIMARY KEY NONCLUSTERED (Discount_ID ASC, Line_Item ASC),
)
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_EmployeeRole_History]') AND type in (N'U'))
DROP TABLE [dbo].[POS_EmployeeRole_History]
GO

/****** Object:  Table [dbo].[POS_EmployeeRole_History]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_EmployeeRole_History
(
	Role_ID nvarchar(20) NOT NULL,
	Role_Name nvarchar(100) NOT NULL,
	Line_Item int NOT NULL,
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
	CONSTRAINT PK_POS_EmployeeRole_History PRIMARY KEY NONCLUSTERED (Role_ID ASC, Line_Item ASC)
)
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_Employee_History]') AND type in (N'U'))
DROP TABLE [dbo].[POS_Employee_History]
GO

/****** Object:  Table [dbo].[POS_Employee_History]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_Employee_History
(
	Employee_ID nvarchar(20) NOT NULL, 
	Employee_Name nvarchar(250) NOT NULL,
	Line_Item int NOT NULL,
	Email nvarchar(250) NOT NULL,
	Phone nvarchar(20) NOT NULL,
	Role_ID nvarchar(20) NOT NULL,
	Created_User nvarchar(30),
	Created_Date DATETIME,
	CONSTRAINT PK_POS_Employee_History PRIMARY KEY NONCLUSTERED (Employee_ID ASC, Line_Item ASC),
)
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_ItemInventory_History]') AND type in (N'U'))
	DROP TABLE [dbo].[POS_ItemInventory_History]
GO

/****** Object:  Table [dbo].[POS_ItemInventory_History]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_ItemInventory_History
(
	Item_Number nvarchar(20) NOT NULL, 
	Line_Item int NOT NULL,
	Item_Quantity numeric(19,5) NOT NULL,
	Site_ID nvarchar(20) NOT NULL, 
	Low_Stock numeric(19,5) NOT NULL,
	UOFM nvarchar(30) NOT NULL,
	Created_User nvarchar(30),
	Created_Date DATETIME,
	CONSTRAINT PK_POS_ItemInventory_History PRIMARY KEY NONCLUSTERED (Item_Number ASC, Line_Item ASC),
)
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_ItemVariant_History]') AND type in (N'U'))
	DROP TABLE [dbo].[POS_ItemVariant_History]
GO

/****** Object:  Table [dbo].[POS_ItemVariant_History]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_ItemVariant_History
(
	Item_Number nvarchar(20) NOT NULL,
	Site_ID nvarchar(20) NOT NULL, 
	LineItem_Option numeric(19,5) NOT NULL,
	Line_Item int NOT NULL,
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
	CONSTRAINT PK_POS_ItemVariant_History PRIMARY KEY NONCLUSTERED (Item_Number ASC, Site_ID ASC, LineItem_Option ASC, Line_Item ASC),
)
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_Item_History]') AND type in (N'U'))
DROP TABLE [dbo].[POS_Item_History]
GO

/****** Object:  Table [dbo].[POS_Item_History]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_Item_History
(
	Item_Number nvarchar(20) NOT NULL, 
	Site_ID nvarchar(20) NOT NULL, 
	Item_Name nvarchar(50) NOT NULL, 
	Item_Description nvarchar(250) NOT NULL,
	Line_Item int NOT NULL,
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
	CONSTRAINT PK_POS_Item_History PRIMARY KEY NONCLUSTERED (Item_Number ASC, Site_ID ASC, Line_Item ASC),
)
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_RunningNumber_History]') AND type in (N'U'))
DROP TABLE [dbo].[POS_RunningNumber_History]
GO

/****** Object:  Table [dbo].[POS_RunningNumber_History]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_RunningNumber_History
(
	DocumentID nvarchar(4) NOT NULL, 
	LineItem int NOT NULL,
	CurrentNumber nvarchar(20) NOT NULL,
	CurrentDate DATETIME NOT NULL,
	CONSTRAINT PK_POS_RunningNumber_History PRIMARY KEY NONCLUSTERED (DocumentID ASC, LineItem ASC)
)
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_Set_Features_History]') AND type in (N'U'))
DROP TABLE [dbo].[POS_Set_Features_History]
GO

/****** Object:  Table [dbo].[POS_Set_Features_History]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_Set_Features_History
(
	Feature_ID nvarchar(20) NOT NULL,
	Line_Item int NOT NULL,
	Feature_Shift int NOT NULL, 
	Feature_TimeClock int NOT NULL,
	Feature_LowStock int NOT NULL,
	Feature_NegativeStock int NOT NULL,
	Created_User nvarchar(30),
	Created_Date DATETIME,
	CONSTRAINT PK_POS_Set_Features_History PRIMARY KEY NONCLUSTERED (Feature_ID ASC, Line_Item ASC),
)
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_Set_PayTypes_History]') AND type in (N'U'))
DROP TABLE [dbo].[POS_Set_PayTypes_History]
GO

/****** Object:  Table [dbo].[POS_Set_PayTypes_History]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_Set_PayTypes_History
(
	Payment_ID nvarchar(20) NOT NULL, 
	Line_Item int NOT NULL,
	Payment_Type nvarchar(100) NOT NULL,
	Payment_Name nvarchar(300) NOT NULL,
	LineItem int NOT NULL,
	AllStore int NOT NULL,
	Store_ID nvarchar(20) NOT NULL, 
	Store_Name nvarchar(100) NOT NULL, 
	Created_User nvarchar(30),
	Created_Date DATETIME,
	CONSTRAINT PK_POS_Set_PayTypes_History PRIMARY KEY NONCLUSTERED (Payment_ID ASC, Line_Item ASC, LineItem ASC),
)
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_Set_SalesType_History]') AND type in (N'U'))
DROP TABLE [dbo].[POS_Set_SalesType_History]
GO

/****** Object:  Table [dbo].[POS_Set_SalesType_History]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_Set_SalesType_History
(
	SalesType_ID nvarchar(20) NOT NULL, 
	SalesType_Name nvarchar(100) NOT NULL,
	Line_Item int NOT NULL,
	Store_ID nvarchar(20) NOT NULL, 
	Store_Name nvarchar(100) NOT NULL, 
	Created_User nvarchar(30),
	Created_Date DATETIME,
	CONSTRAINT PK_POS_Set_SalesType_History PRIMARY KEY NONCLUSTERED (SalesType_ID ASC, Line_Item ASC),
)
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_Set_Site_History]') AND type in (N'U'))
DROP TABLE [dbo].[POS_Set_Site_History]
GO

/****** Object:  Table [dbo].[POS_Set_Site_History]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_Set_Site_History
(
	Site_ID nvarchar(20) NOT NULL, 
	DefaultSite int NOT NULL,
	Site_Name nvarchar(100) NOT NULL,
	Line_Item int NOT NULL,
	Store_ID nvarchar(20) NOT NULL, 
	Store_Name nvarchar(100) NOT NULL, 
	Created_User nvarchar(30),
	Created_Date DATETIME,
	CONSTRAINT PK_POS_Set_Site_History PRIMARY KEY NONCLUSTERED (Site_ID ASC, Line_Item ASC),
)
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_Set_Stores_History]') AND type in (N'U'))
DROP TABLE [dbo].[POS_Set_Stores_History]
GO

/****** Object:  Table [dbo].[POS_Set_Stores_History]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_Set_Stores_History
(
	Store_ID nvarchar(20) NOT NULL, 
	Store_Name nvarchar(100) NOT NULL,
	Line_Item int NOT NULL,
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
	CONSTRAINT PK_POS_Set_Stores_History PRIMARY KEY NONCLUSTERED (Store_ID ASC, Line_Item ASC),
)
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_Set_Taxes_History]') AND type in (N'U'))
DROP TABLE [dbo].[POS_Set_Taxes_History]
GO

/****** Object:  Table [dbo].[POS_Set_Taxes_History]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_Set_Taxes_History
(
	Tax_ID nvarchar(20) NOT NULL, 
	Tax_Name nvarchar(100) NOT NULL,
	Line_Item int NOT NULL,
	Tax_Rate numeric(19,5) NOT NULL,
	Tax_Type int NOT NULL,
	Tax_Option int NOT NULL,
	Created_User nvarchar(30),
	Created_Date DATETIME,
	CONSTRAINT PK_POS_Set_Taxes_History PRIMARY KEY NONCLUSTERED (Tax_ID ASC, Line_Item ASC),
)