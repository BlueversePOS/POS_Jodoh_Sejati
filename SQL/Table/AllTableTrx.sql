/*
ALTER TABLE [dbo].[POS_CashManagement] DROP CONSTRAINT [FK_POS_ItemInventorySite]
GO
ALTER TABLE [dbo].[POS_CloseShift] DROP CONSTRAINT [FK_POS_ItemInventorySite]
GO
ALTER TABLE [dbo].[POS_OpenShift] DROP CONSTRAINT [FK_POS_ItemInventorySite]
GO
ALTER TABLE [dbo].[POS_Summ_OpenCloseShift] DROP CONSTRAINT [FK_POS_ItemInventorySite]
GO
ALTER TABLE [dbo].[POS_TrxHeader_HIST] DROP CONSTRAINT [FK_POS_ItemInventorySite]
GO
ALTER TABLE [dbo].[POS_TrxHeader_POST] DROP CONSTRAINT [FK_POS_ItemInventorySite]
GO
*/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_CashManagement]') AND type in (N'U'))
DROP TABLE [dbo].[POS_CashManagement]
GO

/****** Object:  Table [dbo].[POS_CashManagement]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_CashManagement
(
	Batch_ID nvarchar(20) NOT NULL, 
	Type_CashManagement nvarchar(20) NOT NULL,
	Amount numeric(19,5) NOT NULL,
	Notes nvarchar(200) NOT NULL,
	POS_ID nvarchar(20) NOT NULL, 
	Created_User nvarchar(30) NOT NULL,
	Created_Date DATETIME NOT NULL,
	Created_time DATETIME,
	CONSTRAINT PK_POS_CashManagement PRIMARY KEY NONCLUSTERED (Batch_ID ASC)
)
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_CloseShift]') AND type in (N'U'))
DROP TABLE [dbo].[POS_CloseShift]
GO

/****** Object:  Table [dbo].[POS_CloseShift]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_CloseShift
(
	Batch_ID nvarchar(20) NOT NULL, 
	Lineitmseq int NOT NULL,
	Payment_ID nvarchar(20) NOT NULL,
	Payment_Type nvarchar(20) NOT NULL,
	Amount_Opening numeric(19,5) NOT NULL,
	Created_User nvarchar(30) NOT NULL,
	Created_Date DATETIME NOT NULL,
	Modified_User nvarchar(30),
	Modified_Date DATETIME,
	CONSTRAINT PK_POS_CloseShift PRIMARY KEY NONCLUSTERED (Batch_ID ASC)
)
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_OpenShift]') AND type in (N'U'))
DROP TABLE [dbo].[POS_OpenShift]
GO

/****** Object:  Table [dbo].[POS_OpenShift]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_OpenShift
(
	Batch_ID nvarchar(20) NOT NULL, 
	Lineitmseq int NOT NULL,
	Payment_ID nvarchar(20) NOT NULL,
	Payment_Type nvarchar(20) NOT NULL,
	Amount_Opening numeric(19,5) NOT NULL,
	Created_User nvarchar(30) NOT NULL,
	Created_Date DATETIME NOT NULL,
	Modified_User nvarchar(30),
	Modified_Date DATETIME,
	CONSTRAINT PK_POS_OpenShift PRIMARY KEY NONCLUSTERED (Batch_ID ASC),
)
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_PrinterSetup]') AND type in (N'U'))
DROP TABLE [dbo].[POS_PrinterSetup]
GO

/****** Object:  Table [dbo].[POS_PrinterSetup]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_PrinterSetup
(
	PrinterID nvarchar(20) NOT NULL, 
	PrinterName nvarchar(20) NOT NULL, 
	Printer_Checkbox1 int NOT NULL,
	Printer_Checkbox2 int NOT NULL,
	Printer_Checkbox3 int NOT NULL,
	Created_User nvarchar(30) NOT NULL,
	Created_Date DATETIME NOT NULL,
	Created_time DATETIME NOT NULL,
	Modified_User nvarchar(30) NOT NULL,
	Modified_Date DATETIME NOT NULL,
	Modified_time DATETIME NOT NULL,
	CONSTRAINT PK_POS_PrinterSetup PRIMARY KEY NONCLUSTERED (PrinterID ASC)
)
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_Summ_OpenCloseShift]') AND type in (N'U'))
DROP TABLE [dbo].[POS_Summ_OpenCloseShift]
GO

/****** Object:  Table [dbo].[POS_Summ_OpenCloseShift]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_Summ_OpenCloseShift
(
	Batch_ID nvarchar(20) NOT NULL, 
	LastEdit_Date DATETIME NOT NULL,
	LastEdit_time DATETIME NOT NULL,
	Store_ID nvarchar(20) NOT NULL, 
	POS_Device_ID nvarchar(20) NOT NULL, 
	Opening_Date DATETIME NOT NULL,
	Opening_time DATETIME NOT NULL,
	Closing_Date DATETIME NOT NULL,
	Closing_time DATETIME NOT NULL,
	Sum_Amount_Opening numeric(19,5) NOT NULL,
	Sum_Amount_Closing numeric(19,5) NOT NULL,
	Sum_Invoice_Posted numeric(19,5) NOT NULL,
	Sum_Tendered numeric(19,5) NOT NULL,
	Sum_Changes numeric(19,5) NOT NULL,
	Sum_Amount_Discount numeric(19,5) NOT NULL,
	Sum_Amount_Tax numeric(19,5) NOT NULL,
	Sum_Invoice_Refund_Posted numeric(19,5) NOT NULL,
	Sum_Amount_PayOut numeric(19,5) NOT NULL,
	Sum_Amount_PayIn numeric(19,5) NOT NULL,
	Count_Customers int NOT NULL,
	Status_Batch int NOT NULL,
	Created_User nvarchar(30) NOT NULL,
	Created_Date DATETIME NOT NULL,
	Created_time DATETIME,
	CONSTRAINT PK_POS_Summ_OpenCloseShift PRIMARY KEY NONCLUSTERED (Batch_ID ASC)
)

GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_TrxAdjustment_Detail]') AND type in (N'U'))
DROP TABLE [dbo].[POS_TrxAdjustment_Detail]
GO

/****** Object:  Table [dbo].[POS_TrxAdjustment_Detail]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_TrxAdjustment_Detail
(
	DOCNUMBER nvarchar(20) NOT NULL, 
	DOCDATE DATETIME NOT NULL,
	Reason nvarchar(30) NOT NULL,
	Lineitmseq int NOT NULL,
	Item_Number nvarchar(20) NOT NULL,
	LineItem_Option numeric(19,5) NOT NULL,
	Item_Description nvarchar(250) NOT NULL,
	Qty_Stock numeric(19,5) NOT NULL,
	Qty_Add_Stock numeric(19,5) NOT NULL,
	Qty_Remove_Stock numeric(19,5) NOT NULL,
	Item_Cost numeric(19,5) NOT NULL,
	Qty_After_Stock numeric(19,5) NOT NULL,
	Expected_Stock numeric(19,5) NOT NULL,
	Counted_Stock numeric(19,5) NOT NULL,
	Created_User nvarchar(30) NOT NULL,
	Created_Date DATETIME NOT NULL,
	Created_time DATETIME NOT NULL,
	Modified_User nvarchar(30) NOT NULL,
	Modified_Date DATETIME NOT NULL,
	Modified_time DATETIME NOT NULL,
	CONSTRAINT PK_POS_TrxAdjustment_Detail PRIMARY KEY NONCLUSTERED (DOCNUMBER ASC, Item_Number ASC, Lineitmseq ASC)
)

/*
DROP TABLE POS_Item
*/
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_TrxAdjustment_DetailHIST]') AND type in (N'U'))
DROP TABLE [dbo].[POS_TrxAdjustment_DetailHIST]
GO

/****** Object:  Table [dbo].[POS_TrxAdjustment_DetailHIST]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_TrxAdjustment_DetailHIST
(
	DOCNUMBER nvarchar(20) NOT NULL, 
	DOCDATE DATETIME NOT NULL,
	Reason nvarchar(30) NOT NULL,
	Lineitmseq int NOT NULL,
	Item_Number nvarchar(20) NOT NULL,
	LineItem_Option numeric(19,5) NOT NULL,
	Item_Description nvarchar(250) NOT NULL,
	Qty_Stock numeric(19,5) NOT NULL,
	Qty_Add_Stock numeric(19,5) NOT NULL,
	Qty_Remove_Stock numeric(19,5) NOT NULL,
	Item_Cost numeric(19,5) NOT NULL,
	Qty_After_Stock numeric(19,5) NOT NULL,
	Expected_Stock numeric(19,5) NOT NULL,
	Counted_Stock numeric(19,5) NOT NULL,
	Created_User nvarchar(30) NOT NULL,
	Created_Date DATETIME NOT NULL,
	Created_time DATETIME NOT NULL,
	CONSTRAINT PK_POS_TrxAdjustment_DetailHIST PRIMARY KEY NONCLUSTERED (DOCNUMBER ASC, Item_Number ASC, Lineitmseq ASC, Created_Date ASC, Created_Time ASC)
)

/*
DROP TABLE POS_Set_Site
*/
--ALTER TABLE [dbo].[POS_TrxAdjustment_Header] DROP CONSTRAINT [FK_POS_TrxAdjustmentSites]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_TrxAdjustment_Header]') AND type in (N'U'))
DROP TABLE [dbo].[POS_TrxAdjustment_Header]
GO

/****** Object:  Table [dbo].[POS_TrxAdjustment_Header]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_TrxAdjustment_Header
(
	DOCNUMBER nvarchar(20) NOT NULL, 
	DOCDATE DATETIME NOT NULL,
	Site_ID nvarchar(20) NOT NULL, 
	Site_Name nvarchar(100) NOT NULL, 
	Reason nvarchar(30) NOT NULL, 
	Total_Line_Item int NOT NULL,
	Notes nvarchar(500) NOT NULL, 
	Created_User nvarchar(30) NOT NULL,
	Created_Date DATETIME NOT NULL,
	Created_time DATETIME NOT NULL,
	Modified_User nvarchar(30) NOT NULL,
	Modified_Date DATETIME NOT NULL,
	Modified_time DATETIME NOT NULL,
	CONSTRAINT PK_POS_TrxAdjustment_Header PRIMARY KEY NONCLUSTERED (DOCNUMBER ASC),
	CONSTRAINT FK_POS_TrxAdjustmentSites FOREIGN KEY (Site_ID)
	REFERENCES POS_Set_Site (Site_ID)
	ON DELETE CASCADE
	ON UPDATE CASCADE
)

/*
DROP TABLE POS_Set_Site
*/
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_TrxAdjustment_HeaderHIST]') AND type in (N'U'))
DROP TABLE [dbo].[POS_TrxAdjustment_HeaderHIST]
GO

/****** Object:  Table [dbo].[POS_TrxAdjustment_HeaderHIST]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_TrxAdjustment_HeaderHIST
(
	DOCNUMBER nvarchar(20) NOT NULL, 
	DOCDATE DATETIME NOT NULL,
	Site_ID nvarchar(20) NOT NULL, 
	Site_Name nvarchar(100) NOT NULL, 
	Reason nvarchar(30) NOT NULL, 
	Total_Line_Item int NOT NULL,
	Notes nvarchar(500) NOT NULL, 
	Created_User nvarchar(30) NOT NULL,
	Created_Date DATETIME NOT NULL,
	Created_time DATETIME NOT NULL,
	CONSTRAINT PK_POS_TrxAdjustment_HeaderHIST PRIMARY KEY NONCLUSTERED (DOCNUMBER ASC, Created_Date ASC, Created_Time ASC)
)

/*
DROP TABLE POS_Set_Site
*/
GO
/*
ALTER TABLE [dbo].[POS_TrxHeader_HIST] DROP CONSTRAINT [FK_POS_OpenShiftTrxHeaderHIST]
GO

ALTER TABLE [dbo].[POS_TrxHeader_HIST] DROP CONSTRAINT [FK_POS_CloseShiftTrxHeaderHIST]
GO

ALTER TABLE [dbo].[POS_TrxHeader_HIST] DROP CONSTRAINT [FK_POS_CashMgmtTrxHeaderHIST]
GO

ALTER TABLE [dbo].[POS_TrxHeader_HIST] DROP CONSTRAINT [FK_POS_SummShiftTrxHeaderHIST]
GO
*/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_TrxHeader_HIST]') AND type in (N'U'))
DROP TABLE [dbo].[POS_TrxHeader_HIST]
GO

/****** Object:  Table [dbo].[POS_TrxHeader_HIST]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_TrxHeader_HIST
(
	DOCNUMBER nvarchar(20) NOT NULL, 
	DOCTYPE int NOT NULL,
	DOCDATE DATETIME NOT NULL,
	Store_ID nvarchar(20) NOT NULL, 
	Site_ID nvarchar(20) NOT NULL, 
	SalesType_ID nvarchar(20) NOT NULL, 
	CustName nvarchar(200) NOT NULL, 
	Total_Line_Item int NOT NULL,
	ORIGTOTAL numeric(19,5) NOT NULL,
	SUBTOTAL numeric(19,5) NOT NULL,
	Tax_Amount numeric(19,5) NOT NULL,
	Discount_ID nvarchar(20) NOT NULL, 
	Discount_Amount numeric(19,5) NOT NULL,
	Amount_Tendered numeric(19,5) NOT NULL,
	Change_Amount numeric(19,5) NOT NULL,
	Batch_ID nvarchar(20) NOT NULL, 
	POS_Device_ID nvarchar(20) NOT NULL, 
	POS_Version nvarchar(20) NOT NULL, 
	SyncStatus int NOT NULL,
	Created_User nvarchar(30) NOT NULL,
	Created_Date DATETIME NOT NULL,
	Created_time DATETIME,
	Modified_User nvarchar(30) NOT NULL,
	Modified_Date DATETIME NOT NULL,
	Modified_time DATETIME NOT NULL,
	CONSTRAINT PK_POS_TrxHeader_HIST PRIMARY KEY NONCLUSTERED (DOCNUMBER ASC),
	CONSTRAINT FK_POS_OpenShiftTrxHeaderHIST FOREIGN KEY (Batch_ID)
	REFERENCES POS_OpenShift (Batch_ID),
	CONSTRAINT FK_POS_CloseShiftTrxHeaderHIST FOREIGN KEY (Batch_ID)
	REFERENCES POS_CloseShift (Batch_ID),
	CONSTRAINT FK_POS_CashMgmtTrxHeaderHIST FOREIGN KEY (Batch_ID)
	REFERENCES POS_CashManagement (Batch_ID),
	CONSTRAINT FK_POS_SummShiftTrxHeaderHIST FOREIGN KEY (Batch_ID)
	REFERENCES POS_Summ_OpenCloseShift (Batch_ID)
	ON DELETE CASCADE
	ON UPDATE CASCADE
)
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_TrxDetail_HIST]') AND type in (N'U'))
DROP TABLE [dbo].[POS_TrxDetail_HIST]
GO

/****** Object:  Table [dbo].[POS_TrxDetail_HIST]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_TrxDetail_HIST
(
	DOCNUMBER nvarchar(20) NOT NULL, 
	DOCTYPE int NOT NULL,
	DOCDATE DATETIME NOT NULL,
	Lineitmseq int NOT NULL,
	Item_Number nvarchar(20) NOT NULL, 
	Item_Description nvarchar(500) NOT NULL, 
	Quantity numeric(19,5) NOT NULL,
	UofM nvarchar(20) NOT NULL, 
	Item_Price numeric(19,5) NOT NULL,
	Item_Cost numeric(19,5) NOT NULL,
	Store_ID nvarchar(20) NOT NULL, 
	Site_ID nvarchar(20) NOT NULL, 
	SalesType_ID nvarchar(20) NOT NULL, 
	Discount_ID nvarchar(20) NOT NULL, 
	Discount_Amount numeric(19,5) NOT NULL,
	Notes nvarchar(200) NOT NULL, 
	POS_Device_ID nvarchar(20) NOT NULL, 
	POS_Version nvarchar(20) NOT NULL, 
	Created_User nvarchar(30) NOT NULL,
	Created_Date DATETIME NOT NULL,
	Created_time DATETIME,
	Modified_User nvarchar(30) NOT NULL,
	Modified_Date DATETIME NOT NULL,
	Modified_time DATETIME NOT NULL,
	CONSTRAINT PK_POS_TrxDetail_HIST PRIMARY KEY NONCLUSTERED (DOCNUMBER ASC, Lineitmseq ASC, Created_Date ASC, Created_time ASC),
	CONSTRAINT FK_POS_TrxHeaderDetailHIST FOREIGN KEY (DOCNUMBER)
	REFERENCES POS_TrxHeader_HIST (DOCNUMBER)
)

GO
/*
ALTER TABLE [dbo].[POS_TrxHeader_POST] DROP CONSTRAINT [FK_POS_OpenShiftTrxHeaderPOST]
GO

ALTER TABLE [dbo].[POS_TrxHeader_POST] DROP CONSTRAINT [FK_POS_CloseShiftTrxHeaderPOST]
GO

ALTER TABLE [dbo].[POS_TrxHeader_POST] DROP CONSTRAINT [FK_POS_CashMgmtTrxHeaderPOST]
GO

ALTER TABLE [dbo].[POS_TrxHeader_POST] DROP CONSTRAINT [FK_POS_SummShiftTrxHeaderPOST]
GO
*/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_TrxHeader_POST]') AND type in (N'U'))
DROP TABLE [dbo].[POS_TrxHeader_POST]
GO

/****** Object:  Table [dbo].[POS_TrxHeader_POST]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_TrxHeader_POST
(
	DOCNUMBER nvarchar(20) NOT NULL, 
	DOCTYPE int NOT NULL,
	DOCDATE DATETIME NOT NULL,
	Store_ID nvarchar(20) NOT NULL, 
	Site_ID nvarchar(20) NOT NULL, 
	SalesType_ID nvarchar(20) NOT NULL, 
	CustName nvarchar(200) NOT NULL, 
	Total_Line_Item int NOT NULL,
	ORIGTOTAL numeric(19,5) NOT NULL,
	SUBTOTAL numeric(19,5) NOT NULL,
	Tax_Amount numeric(19,5) NOT NULL,
	Discount_ID nvarchar(20) NOT NULL, 
	Discount_Amount numeric(19,5) NOT NULL,
	Amount_Tendered numeric(19,5) NOT NULL,
	Change_Amount numeric(19,5) NOT NULL,
	Batch_ID nvarchar(20) NOT NULL, 
	POS_Device_ID nvarchar(20) NOT NULL, 
	POS_Version nvarchar(20) NOT NULL, 
	SyncStatus int NOT NULL,
	Created_User nvarchar(30) NOT NULL,
	Created_Date DATETIME NOT NULL,
	Created_time DATETIME,
	Modified_User nvarchar(30) NOT NULL,
	Modified_Date DATETIME NOT NULL,
	Modified_time DATETIME NOT NULL,
	CONSTRAINT PK_POS_TrxHeader_POST PRIMARY KEY NONCLUSTERED (DOCNUMBER ASC),
	CONSTRAINT FK_POS_OpenShiftTrxHeaderPOST FOREIGN KEY (Batch_ID)
	REFERENCES POS_OpenShift (Batch_ID),
	CONSTRAINT FK_POS_CloseShiftTrxHeaderPOST FOREIGN KEY (Batch_ID)
	REFERENCES POS_CloseShift (Batch_ID),
	CONSTRAINT FK_POS_CashMgmtTrxHeaderPOST FOREIGN KEY (Batch_ID)
	REFERENCES POS_CashManagement (Batch_ID),
	CONSTRAINT FK_POS_SummShiftTrxHeaderPOST FOREIGN KEY (Batch_ID)
	REFERENCES POS_Summ_OpenCloseShift (Batch_ID)
	ON DELETE CASCADE
	ON UPDATE CASCADE
)

GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_TrxDetail_POST]') AND type in (N'U'))
DROP TABLE [dbo].[POS_TrxDetail_POST]
GO

/****** Object:  Table [dbo].[POS_TrxDetail_POST]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_TrxDetail_POST
(
	DOCNUMBER nvarchar(20) NOT NULL, 
	DOCTYPE int NOT NULL,
	DOCDATE DATETIME NOT NULL,
	Lineitmseq int NOT NULL,
	Item_Number nvarchar(20) NOT NULL, 
	Item_Description nvarchar(500) NOT NULL, 
	Quantity numeric(19,5) NOT NULL,
	UofM nvarchar(20) NOT NULL, 
	Item_Price numeric(19,5) NOT NULL,
	Item_Cost numeric(19,5) NOT NULL,
	Store_ID nvarchar(20) NOT NULL, 
	Site_ID nvarchar(20) NOT NULL, 
	SalesType_ID nvarchar(20) NOT NULL, 
	Discount_ID nvarchar(20) NOT NULL, 
	Discount_Amount numeric(19,5) NOT NULL,
	Notes nvarchar(200) NOT NULL, 
	POS_Device_ID nvarchar(20) NOT NULL, 
	POS_Version nvarchar(20) NOT NULL, 
	Created_User nvarchar(30) NOT NULL,
	Created_Date DATETIME NOT NULL,
	Created_time DATETIME,
	Modified_User nvarchar(30) NOT NULL,
	Modified_Date DATETIME NOT NULL,
	Modified_time DATETIME NOT NULL,
	CONSTRAINT PK_POS_TrxDetail_POST PRIMARY KEY NONCLUSTERED (DOCNUMBER ASC, Lineitmseq ASC),
	CONSTRAINT FK_POS_TrxHeaderDetailPOST FOREIGN KEY (DOCNUMBER)
	REFERENCES POS_TrxHeader_POST (DOCNUMBER)
)

GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_TrxDetail_TEMP]') AND type in (N'U'))
DROP TABLE [dbo].[POS_TrxDetail_TEMP]
GO

/****** Object:  Table [dbo].[POS_TrxDetail_TEMP]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_TrxDetail_TEMP
(
	DOCNUMBER nvarchar(20) NOT NULL, 
	DOCTYPE int NOT NULL,
	DOCDATE DATETIME NOT NULL,
	Lineitmseq int NOT NULL,
	Item_Number nvarchar(20) NOT NULL, 
	Item_Description nvarchar(500) NOT NULL, 
	Quantity numeric(19,5) NOT NULL,
	UofM nvarchar(20) NOT NULL, 
	Item_Price numeric(19,5) NOT NULL,
	Item_Cost numeric(19,5) NOT NULL,
	Store_ID nvarchar(20) NOT NULL, 
	Site_ID nvarchar(20) NOT NULL, 
	SalesType_ID nvarchar(20) NOT NULL, 
	Discount_ID nvarchar(20) NOT NULL, 
	Discount_Amount numeric(19,5) NOT NULL,
	Notes nvarchar(200) NOT NULL, 
	POS_Device_ID nvarchar(20) NOT NULL, 
	POS_Version nvarchar(20) NOT NULL, 
	Created_User nvarchar(30) NOT NULL,
	Created_Date DATETIME NOT NULL,
	Created_time DATETIME,
	Modified_User nvarchar(30) NOT NULL,
	Modified_Date DATETIME NOT NULL,
	Modified_time DATETIME NOT NULL,
	CONSTRAINT PK_POS_TrxDetail_TEMP PRIMARY KEY NONCLUSTERED (DOCNUMBER ASC)
)

GO

/*
DROP TABLE POS_OpenShift
DROP TABLE POS_CloseShift
DROP TABLE POS_CashManagement
DROP TABLE POS_Summ_OpenCloseShift
DROP TABLE POS_TrxHeader_HIST
DROP TABLE POS_TrxDetail_HIST
DROP TABLE POS_TrxPayTypes_HIST
DROP TABLE POS_TrxRefund_HIST
*/

/*
DROP TABLE POS_OpenShift
DROP TABLE POS_CloseShift
DROP TABLE POS_CashManagement
DROP TABLE POS_Summ_OpenCloseShift
DROP TABLE POS_TrxHeader_POST
DROP TABLE POS_TrxDetail_POST
DROP TABLE POS_TrxPayTypes_POST
DROP TABLE POS_TrxRefund_POST
*/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_TrxHeader_TEMP]') AND type in (N'U'))
DROP TABLE [dbo].[POS_TrxHeader_TEMP]
GO

/****** Object:  Table [dbo].[POS_TrxHeader_TEMP]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_TrxHeader_TEMP
(
	DOCNUMBER nvarchar(20) NOT NULL, 
	DOCTYPE int NOT NULL,
	DOCDATE DATETIME NOT NULL,
	Store_ID nvarchar(20) NOT NULL, 
	Site_ID nvarchar(20) NOT NULL, 
	SalesType_ID nvarchar(20) NOT NULL, 
	CustName nvarchar(200) NOT NULL, 
	Total_Line_Item int NOT NULL,
	ORIGTOTAL numeric(19,5) NOT NULL,
	SUBTOTAL numeric(19,5) NOT NULL,
	Tax_Amount numeric(19,5) NOT NULL,
	Discount_ID nvarchar(20) NOT NULL, 
	Discount_Amount numeric(19,5) NOT NULL,
	Amount_Tendered numeric(19,5) NOT NULL,
	Change_Amount numeric(19,5) NOT NULL,
	Batch_ID nvarchar(20) NOT NULL, 
	POS_Device_ID nvarchar(20) NOT NULL, 
	POS_Version nvarchar(20) NOT NULL, 
	SyncStatus int NOT NULL,
	Created_User nvarchar(30) NOT NULL,
	Created_Date DATETIME NOT NULL,
	Created_time DATETIME,
	Modified_User nvarchar(30) NOT NULL,
	Modified_Date DATETIME NOT NULL,
	Modified_time DATETIME NOT NULL,
	CONSTRAINT PK_POS_TrxHeader_TEMP PRIMARY KEY NONCLUSTERED (DOCNUMBER ASC),
)
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_TrxInvCount_DetailHIST]') AND type in (N'U'))
DROP TABLE [dbo].[POS_TrxInvCount_DetailHIST]
GO

/****** Object:  Table [dbo].[POS_TrxInvCount_DetailHIST]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_TrxInvCount_DetailHIST
(
	DOCNUMBER nvarchar(20) NOT NULL, 
	DOCDATE DATETIME NOT NULL,
	Lineitmseq int NOT NULL,
	Item_Number nvarchar(20) NOT NULL,
	Item_Description nvarchar(250) NOT NULL,
	Item_SKU nvarchar(20) NOT NULL,
	Expected_Stock numeric(19,5) NOT NULL,
	Counted_Stock numeric(19,5) NOT NULL,
	Different_Stock numeric(19,5) NOT NULL,
	Item_Cost numeric(19,5) NOT NULL,
	Item_Cost_Different numeric(19,5) NOT NULL,
	Created_User nvarchar(30) NOT NULL,
	Created_Date DATETIME NOT NULL,
	Created_time DATETIME NOT NULL,
	Modified_User nvarchar(30) NOT NULL,
	Modified_Date DATETIME NOT NULL,
	Modified_time DATETIME NOT NULL,
	CONSTRAINT PK_POS_TrxInvCount_DetailHIST PRIMARY KEY NONCLUSTERED (DOCNUMBER ASC, Lineitmseq ASC, Item_Number ASC, Item_SKU ASC, Created_Date ASC, Created_time ASC)
)
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_TrxInvCount_DetailPOST]') AND type in (N'U'))
DROP TABLE [dbo].[POS_TrxInvCount_DetailPOST]
GO

/****** Object:  Table [dbo].[POS_TrxInvCount_DetailPOST]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_TrxInvCount_DetailPOST
(
	DOCNUMBER nvarchar(20) NOT NULL, 
	DOCDATE DATETIME NOT NULL,
	Lineitmseq int NOT NULL,
	Item_Number nvarchar(20) NOT NULL,
	Item_Description nvarchar(250) NOT NULL,
	Item_SKU nvarchar(20) NOT NULL,
	Expected_Stock numeric(19,5) NOT NULL,
	Counted_Stock numeric(19,5) NOT NULL,
	Different_Stock numeric(19,5) NOT NULL,
	Item_Cost numeric(19,5) NOT NULL,
	Item_Cost_Different numeric(19,5) NOT NULL,
	Created_User nvarchar(30) NOT NULL,
	Created_Date DATETIME NOT NULL,
	Created_time DATETIME NOT NULL,
	Modified_User nvarchar(30) NOT NULL,
	Modified_Date DATETIME NOT NULL,
	Modified_time DATETIME NOT NULL,
	CONSTRAINT PK_POS_TrxInvCount_DetailPOST PRIMARY KEY NONCLUSTERED (DOCNUMBER ASC, Lineitmseq ASC, Item_Number ASC, Item_SKU ASC)
)
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_TrxInvCount_DetailTEMP]') AND type in (N'U'))
DROP TABLE [dbo].[POS_TrxInvCount_DetailTEMP]
GO

/****** Object:  Table [dbo].[POS_TrxInvCount_DetailTEMP]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_TrxInvCount_DetailTEMP
(
	DOCNUMBER nvarchar(20) NOT NULL, 
	DOCDATE DATETIME NOT NULL,
	Lineitmseq int NOT NULL,
	Item_Number nvarchar(20) NOT NULL,
	Item_Description nvarchar(250) NOT NULL,
	Item_SKU nvarchar(20) NOT NULL,
	Expected_Stock numeric(19,5) NOT NULL,
	Counted_Stock numeric(19,5) NOT NULL,
	Different_Stock numeric(19,5) NOT NULL,
	Item_Cost numeric(19,5) NOT NULL,
	Item_Cost_Different numeric(19,5) NOT NULL,
	Created_User nvarchar(30) NOT NULL,
	Created_Date DATETIME NOT NULL,
	Created_time DATETIME NOT NULL,
	Modified_User nvarchar(30) NOT NULL,
	Modified_Date DATETIME NOT NULL,
	Modified_time DATETIME NOT NULL,
	CONSTRAINT PK_POS_TrxInvCount_DetailTEMP PRIMARY KEY NONCLUSTERED (DOCNUMBER ASC, Lineitmseq ASC)
)
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_TrxInvCount_HeaderHIST]') AND type in (N'U'))
DROP TABLE [dbo].[POS_TrxInvCount_HeaderHIST]
GO

/****** Object:  Table [dbo].[POS_TrxInvCount_HeaderHIST]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_TrxInvCount_HeaderHIST
(
	DOCNUMBER nvarchar(20) NOT NULL, 
	DOCDATE DATETIME NOT NULL,
	Completed_Date DATETIME NOT NULL,
	Site_ID nvarchar(20) NOT NULL, 
	Site_Name nvarchar(100) NOT NULL, 
	Type_Inventory_Count int NOT NULL,
	Total_Line_Item int NOT NULL,
	Notes nvarchar(500) NOT NULL, 
	[Status] int NOT NULL,
	Created_User nvarchar(30) NOT NULL,
	Created_Date DATETIME NOT NULL,
	Created_time DATETIME NOT NULL
	CONSTRAINT PK_POS_TrxInvCount_HeaderHIST PRIMARY KEY NONCLUSTERED (DOCNUMBER ASC, Created_Date ASC, Created_Time ASC)
)

--ALTER TABLE [dbo].[POS_TrxInvCount_HeaderPOST] DROP CONSTRAINT [FK_POS_TrxInvCount_HeaderPOSTSite]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_TrxInvCount_HeaderPOST]') AND type in (N'U'))
DROP TABLE [dbo].[POS_TrxInvCount_HeaderPOST]
GO

/****** Object:  Table [dbo].[POS_TrxInvCount_HeaderPOST]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_TrxInvCount_HeaderPOST
(
	DOCNUMBER nvarchar(20) NOT NULL, 
	DOCDATE DATETIME NOT NULL,
	Completed_Date DATETIME NOT NULL,
	Site_ID nvarchar(20) NOT NULL, 
	Site_Name nvarchar(100) NOT NULL, 
	Type_Inventory_Count int NOT NULL,
	Total_Line_Item int NOT NULL,
	Notes nvarchar(500) NOT NULL, 
	[Status] int NOT NULL,
	Created_User nvarchar(30) NOT NULL,
	Created_Date DATETIME NOT NULL,
	Created_time DATETIME NOT NULL,
	Modified_User nvarchar(30) NOT NULL,
	Modified_Date DATETIME NOT NULL,
	Modified_time DATETIME NOT NULL,
	CONSTRAINT PK_POS_TrxInvCount_HeaderPOST PRIMARY KEY NONCLUSTERED (DOCNUMBER ASC),
	CONSTRAINT FK_POS_TrxInvCount_HeaderPOSTSite FOREIGN KEY (Site_ID)
	REFERENCES POS_Set_Site (Site_ID)
	ON DELETE CASCADE
	ON UPDATE CASCADE
)
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_TrxInvCount_HeaderTEMP]') AND type in (N'U'))
DROP TABLE [dbo].[POS_TrxInvCount_HeaderTEMP]
GO

/****** Object:  Table [dbo].[POS_TrxInvCount_HeaderTEMP]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_TrxInvCount_HeaderTEMP
(
	DOCNUMBER nvarchar(20) NOT NULL, 
	DOCDATE DATETIME NOT NULL,
	Completed_Date DATETIME NOT NULL,
	Site_ID nvarchar(20) NOT NULL, 
	Site_Name nvarchar(100) NOT NULL, 
	Type_Inventory_Count int NOT NULL,
	Total_Line_Item int NOT NULL,
	Notes nvarchar(500) NOT NULL, 
	[Status] int NOT NULL,
	Created_User nvarchar(30) NOT NULL,
	Created_Date DATETIME NOT NULL,
	Created_time DATETIME NOT NULL,
	Modified_User nvarchar(30) NOT NULL,
	Modified_Date DATETIME NOT NULL,
	Modified_time DATETIME NOT NULL,
	CONSTRAINT PK_POS_TrxInvCount_HeaderTEMP PRIMARY KEY NONCLUSTERED (DOCNUMBER ASC)
)
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_TrxItemTrf_DetailHIST]') AND type in (N'U'))
DROP TABLE [dbo].[POS_TrxItemTrf_DetailHIST]
GO

/****** Object:  Table [dbo].[POS_TrxItemTrf_DetailHIST]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_TrxItemTrf_DetailHIST
(
	DOCNUMBER nvarchar(20) NOT NULL, 
	DOCDATE DATETIME NOT NULL,
	Lineitmseq int NOT NULL,
	Item_Number nvarchar(20) NOT NULL,
	Item_Description nvarchar(250) NOT NULL,
	Item_SKU nvarchar(20) NOT NULL,
	Source_Stock numeric(19,5) NOT NULL,
	Dest_Stock numeric(19,5) NOT NULL,
	Qty_Transfer numeric(19,5) NOT NULL,
	Created_User nvarchar(30) NOT NULL,
	Created_Date DATETIME NOT NULL,
	Created_time DATETIME NOT NULL,
	CONSTRAINT PK_POS_TrxItemTrf_DetailHIST PRIMARY KEY NONCLUSTERED (DOCNUMBER ASC, Lineitmseq ASC, Item_Number ASC, Created_Date ASC, Created_time ASC)
)

GO

/*
DROP TABLE POS_Item
*/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_TrxItemTrf_DetailPOST]') AND type in (N'U'))
DROP TABLE [dbo].[POS_TrxItemTrf_DetailPOST]
GO

/****** Object:  Table [dbo].[POS_TrxItemTrf_DetailPOST]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
--select * from POS_TrxItemTrf_DetailPOST
CREATE TABLE POS_TrxItemTrf_DetailPOST
(
	DOCNUMBER nvarchar(20) NOT NULL, 
	DOCDATE DATETIME NOT NULL,
	Lineitmseq int NOT NULL,
	Item_Number nvarchar(20) NOT NULL,
	Item_Description nvarchar(250) NOT NULL,
	Item_SKU nvarchar(20) NOT NULL,
	Source_Stock numeric(19,5) NOT NULL,
	Dest_Stock numeric(19,5) NOT NULL,
	Qty_Transfer numeric(19,5) NOT NULL,
	Created_User nvarchar(30) NOT NULL,
	Created_Date DATETIME NOT NULL,
	Created_time DATETIME NOT NULL,
	Modified_User nvarchar(30) NOT NULL,
	Modified_Date DATETIME NOT NULL,
	Modified_time DATETIME NOT NULL,
	CONSTRAINT PK_POS_TrxItemTrf_DetailPOST PRIMARY KEY NONCLUSTERED (DOCNUMBER ASC, Lineitmseq ASC, Item_Number ASC, Item_SKU ASC)
)

GO

/*
DROP TABLE POS_Item
*/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_TrxItemTrf_DetailTEMP]') AND type in (N'U'))
DROP TABLE [dbo].[POS_TrxItemTrf_DetailTEMP]
GO

/****** Object:  Table [dbo].[POS_TrxItemTrf_DetailTEMP]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_TrxItemTrf_DetailTEMP
(
	DOCNUMBER nvarchar(20) NOT NULL, 
	DOCDATE DATETIME NOT NULL,
	Lineitmseq int NOT NULL,
	Item_Number nvarchar(20) NOT NULL,
	Item_Description nvarchar(250) NOT NULL,
	Item_SKU nvarchar(20) NOT NULL,
	Source_Stock numeric(19,5) NOT NULL,
	Dest_Stock numeric(19,5) NOT NULL,
	Qty_Transfer numeric(19,5) NOT NULL,
	Created_User nvarchar(30) NOT NULL,
	Created_Date DATETIME NOT NULL,
	Created_time DATETIME NOT NULL,
	Modified_User nvarchar(30) NOT NULL,
	Modified_Date DATETIME NOT NULL,
	Modified_time DATETIME NOT NULL,
	CONSTRAINT PK_POS_TrxItemTrf_DetailTEMP PRIMARY KEY NONCLUSTERED (DOCNUMBER ASC, Lineitmseq ASC, Item_Number ASC)
)

GO

/*
DROP TABLE POS_Item
*/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_TrxItemTrf_HeaderHIST]') AND type in (N'U'))
DROP TABLE [dbo].[POS_TrxItemTrf_HeaderHIST]
GO

/****** Object:  Table [dbo].[POS_TrxItemTrf_HeaderHIST]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_TrxItemTrf_HeaderHIST
(
	DOCNUMBER nvarchar(20) NOT NULL, 
	DOCDATE DATETIME NOT NULL,
	SourceSite_ID nvarchar(20) NOT NULL, 
	SourceSite_Name nvarchar(100) NOT NULL, 
	DestSite_ID nvarchar(20) NOT NULL, 
	DestSite_Name nvarchar(100) NOT NULL, 
	Total_Line_Item int NOT NULL,
	Notes nvarchar(500) NOT NULL, 
	[Status] int NOT NULL,
	Created_User nvarchar(30) NOT NULL,
	Created_Date DATETIME NOT NULL,
	Created_time DATETIME NOT NULL,
	CONSTRAINT PK_POS_TrxItemTrf_HeaderHIST PRIMARY KEY NONCLUSTERED (DOCNUMBER ASC, Created_Date ASC, Created_time ASC)
)

GO

/*
DROP TABLE POS_Set_Site
*/
/*
ALTER TABLE [dbo].[POS_TrxItemTrf_HeaderPOST] DROP CONSTRAINT [FK_POS_TrxItemTrf_HeaderPOSTSrc]
GO

ALTER TABLE [dbo].[POS_TrxItemTrf_HeaderPOST] DROP CONSTRAINT [FK_POS_TrxItemTrf_HeaderPOSTDst]
GO
*/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_TrxItemTrf_HeaderPOST]') AND type in (N'U'))
DROP TABLE [dbo].[POS_TrxItemTrf_HeaderPOST]
GO

/****** Object:  Table [dbo].[POS_TrxItemTrf_HeaderPOST]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_TrxItemTrf_HeaderPOST
(
	DOCNUMBER nvarchar(20) NOT NULL, 
	DOCDATE DATETIME NOT NULL,
	SourceSite_ID nvarchar(20) NOT NULL, 
	SourceSite_Name nvarchar(100) NOT NULL, 
	DestSite_ID nvarchar(20) NOT NULL, 
	DestSite_Name nvarchar(100) NOT NULL, 
	Total_Line_Item int NOT NULL,
	Notes nvarchar(500) NOT NULL, 
	[Status] int NOT NULL,
	Created_User nvarchar(30) NOT NULL,
	Created_Date DATETIME NOT NULL,
	Created_time DATETIME NOT NULL,
	Modified_User nvarchar(30) NOT NULL,
	Modified_Date DATETIME NOT NULL,
	Modified_time DATETIME NOT NULL,
	CONSTRAINT PK_POS_TrxItemTrf_HeaderPOST PRIMARY KEY NONCLUSTERED (DOCNUMBER ASC),
	CONSTRAINT FK_POS_TrxItemTrf_HeaderPOSTSrc FOREIGN KEY (SourceSite_ID)
	REFERENCES POS_Set_Site (Site_ID),
	CONSTRAINT FK_POS_TrxItemTrf_HeaderPOSTDst FOREIGN KEY (DestSite_ID)
	REFERENCES POS_Set_Site (Site_ID)
	ON DELETE CASCADE
	ON UPDATE CASCADE
)

GO

/*
DROP TABLE POS_Set_Site
*/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_TrxItemTrf_HeaderTEMP]') AND type in (N'U'))
DROP TABLE [dbo].[POS_TrxItemTrf_HeaderTEMP]
GO

/****** Object:  Table [dbo].[POS_TrxItemTrf_HeaderTEMP]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_TrxItemTrf_HeaderTEMP
(
	DOCNUMBER nvarchar(20) NOT NULL, 
	DOCDATE DATETIME NOT NULL,
	SourceSite_ID nvarchar(20) NOT NULL, 
	SourceSite_Name nvarchar(100) NOT NULL, 
	DestSite_ID nvarchar(20) NOT NULL, 
	DestSite_Name nvarchar(100) NOT NULL, 
	Total_Line_Item int NOT NULL,
	Notes nvarchar(500) NOT NULL, 
	[Status] int NOT NULL,
	Created_User nvarchar(30) NOT NULL,
	Created_Date DATETIME NOT NULL,
	Created_time DATETIME NOT NULL,
	Modified_User nvarchar(30) NOT NULL,
	Modified_Date DATETIME NOT NULL,
	Modified_time DATETIME NOT NULL,
	CONSTRAINT PK_POS_TrxItemTrf_HeaderTEMP PRIMARY KEY NONCLUSTERED (DOCNUMBER ASC)
)

GO

/*
DROP TABLE POS_Set_Site
*/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_TrxPayTypes_HIST]') AND type in (N'U'))
DROP TABLE [dbo].[POS_TrxPayTypes_HIST]
GO

/****** Object:  Table [dbo].[POS_TrxPayTypes_HIST]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_TrxPayTypes_HIST
(
	DOCNUMBER nvarchar(20) NOT NULL, 
	DOCTYPE int NOT NULL,
	DOCDATE DATETIME NOT NULL,
	Lnitmseq int NOT NULL,
	Payment_ID nvarchar(20) NOT NULL,
	Payment_Type nvarchar(20) NOT NULL,
	ORIGTOTAL numeric(19,5) NOT NULL,
	SUBTOTAL numeric(19,5) NOT NULL,
	Amount_Tendered numeric(19,5) NOT NULL,
	Change_Amount numeric(19,5) NOT NULL,
	Store_ID nvarchar(20) NOT NULL, 
	POS_Device_ID nvarchar(20) NOT NULL, 
	POS_Version nvarchar(20) NOT NULL, 
	Created_User nvarchar(30) NOT NULL,
	Created_Date DATETIME NOT NULL,
	Created_time DATETIME,
	Modified_User nvarchar(30) NOT NULL,
	Modified_Date DATETIME NOT NULL,
	Modified_time DATETIME NOT NULL,
	CONSTRAINT PK_POS_TrxPayTypes_HIST PRIMARY KEY NONCLUSTERED (DOCNUMBER ASC),
	CONSTRAINT FK_POS_TrxHeaderPayTypesHIST FOREIGN KEY (DOCNUMBER)
	REFERENCES POS_TrxHeader_HIST (DOCNUMBER)
)

GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_TrxPayTypes_POST]') AND type in (N'U'))
DROP TABLE [dbo].[POS_TrxPayTypes_POST]
GO

/****** Object:  Table [dbo].[POS_TrxPayTypes_POST]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_TrxPayTypes_POST
(
	DOCNUMBER nvarchar(20) NOT NULL, 
	DOCTYPE int NOT NULL,
	DOCDATE DATETIME NOT NULL,
	Lnitmseq int NOT NULL,
	Payment_ID nvarchar(20) NOT NULL,
	Payment_Type nvarchar(20) NOT NULL,
	ORIGTOTAL numeric(19,5) NOT NULL,
	SUBTOTAL numeric(19,5) NOT NULL,
	Amount_Tendered numeric(19,5) NOT NULL,
	Change_Amount numeric(19,5) NOT NULL,
	Store_ID nvarchar(20) NOT NULL, 
	POS_Device_ID nvarchar(20) NOT NULL, 
	POS_Version nvarchar(20) NOT NULL, 
	Created_User nvarchar(30) NOT NULL,
	Created_Date DATETIME NOT NULL,
	Created_time DATETIME,
	Modified_User nvarchar(30) NOT NULL,
	Modified_Date DATETIME NOT NULL,
	Modified_time DATETIME NOT NULL,
	CONSTRAINT PK_POS_TrxPayTypes_POST PRIMARY KEY NONCLUSTERED (DOCNUMBER ASC),
	CONSTRAINT FK_POS_TrxHeaderPayTypesPOST FOREIGN KEY (DOCNUMBER)
	REFERENCES POS_TrxHeader_POST (DOCNUMBER)
)

GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_TrxPayTypes_TEMP]') AND type in (N'U'))
DROP TABLE [dbo].[POS_TrxPayTypes_TEMP]
GO

/****** Object:  Table [dbo].[POS_TrxPayTypes_TEMP]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_TrxPayTypes_TEMP
(
	DOCNUMBER nvarchar(20) NOT NULL, 
	DOCTYPE int NOT NULL,
	DOCDATE DATETIME NOT NULL,
	Lnitmseq int NOT NULL,
	Payment_ID nvarchar(20) NOT NULL,
	Payment_Type nvarchar(20) NOT NULL,
	ORIGTOTAL numeric(19,5) NOT NULL,
	SUBTOTAL numeric(19,5) NOT NULL,
	Amount_Tendered numeric(19,5) NOT NULL,
	Change_Amount numeric(19,5) NOT NULL,
	Store_ID nvarchar(20) NOT NULL, 
	POS_Device_ID nvarchar(20) NOT NULL, 
	POS_Version nvarchar(20) NOT NULL, 
	Created_User nvarchar(30) NOT NULL,
	Created_Date DATETIME NOT NULL,
	Created_time DATETIME,
	Modified_User nvarchar(30) NOT NULL,
	Modified_Date DATETIME NOT NULL,
	Modified_time DATETIME NOT NULL,
	CONSTRAINT PK_POS_TrxPayTypes_TEMP PRIMARY KEY NONCLUSTERED (DOCNUMBER ASC)
)

GO
/*
ALTER TABLE [dbo].[POS_TrxRefund_HIST] DROP CONSTRAINT [FK_POS_TrxRefundHeaderHIST]
GO

ALTER TABLE [dbo].[POS_TrxRefund_HIST] DROP CONSTRAINT [FK_POS_OpenShiftTrxRefundHIST]
GO

ALTER TABLE [dbo].[POS_TrxRefund_HIST] DROP CONSTRAINT [FK_POS_CloseShiftTrxRefundHIST]
GO

ALTER TABLE [dbo].[POS_TrxRefund_HIST] DROP CONSTRAINT [FK_POS_CashMgmtTrxRefundHIST]
GO

ALTER TABLE [dbo].[POS_TrxRefund_HIST] DROP CONSTRAINT [FK_POS_SummShiftTrxRefundHIST]
GO
*/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_TrxRefund_HIST]') AND type in (N'U'))
DROP TABLE [dbo].[POS_TrxRefund_HIST]
GO

/****** Object:  Table [dbo].[POS_TrxRefund_HIST]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_TrxRefund_HIST
(
	REFUNDNUMBER nvarchar(20) NOT NULL, 
	DOCNUMBER nvarchar(20) NOT NULL, 
	DOCTYPE int NOT NULL,
	DOCDATE DATETIME NOT NULL,
	Refund_Date int NOT NULL,
	Refund_Time DATETIME NOT NULL,
	Refund_User nvarchar(100) NOT NULL, 
	Store_ID nvarchar(20) NOT NULL, 
	Site_ID nvarchar(20) NOT NULL, 
	SalesType_ID nvarchar(20) NOT NULL, 
	CustName nvarchar(200) NOT NULL, 
	Total_Line_Item int NOT NULL,
	ORIGTOTAL numeric(19,5) NOT NULL,
	SUBTOTAL numeric(19,5) NOT NULL,
	Tax_Amount numeric(19,5) NOT NULL,
	Discount_ID nvarchar(20) NOT NULL, 
	Discount_Amount numeric(19,5) NOT NULL,
	Amount_Tendered numeric(19,5) NOT NULL,
	Change_Amount numeric(19,5) NOT NULL,
	Batch_ID nvarchar(20) NOT NULL, 
	POS_Device_ID nvarchar(20) NOT NULL, 
	POS_Version nvarchar(20) NOT NULL, 
	SyncStatus int NOT NULL,
	Created_User nvarchar(30) NOT NULL,
	Created_Date DATETIME NOT NULL,
	Created_time DATETIME,
	Modified_User nvarchar(30) NOT NULL,
	Modified_Date DATETIME NOT NULL,
	Modified_time DATETIME NOT NULL,
	CONSTRAINT PK_POS_TrxRefund_HIST PRIMARY KEY NONCLUSTERED (REFUNDNUMBER ASC),
	CONSTRAINT FK_POS_TrxRefundHeaderHIST FOREIGN KEY (DOCNUMBER)
	REFERENCES POS_TrxHeader_HIST (DOCNUMBER),
	CONSTRAINT FK_POS_OpenShiftTrxRefundHIST FOREIGN KEY (Batch_ID)
	REFERENCES POS_OpenShift (Batch_ID),
	CONSTRAINT FK_POS_CloseShiftTrxRefundHIST FOREIGN KEY (Batch_ID)
	REFERENCES POS_CloseShift (Batch_ID),
	CONSTRAINT FK_POS_CashMgmtTrxRefundHIST FOREIGN KEY (Batch_ID)
	REFERENCES POS_CashManagement (Batch_ID),
	CONSTRAINT FK_POS_SummShiftTrxRefundHIST FOREIGN KEY (Batch_ID)
	REFERENCES POS_Summ_OpenCloseShift (Batch_ID)
	ON DELETE CASCADE
	ON UPDATE CASCADE
)

GO

/*
DROP TABLE POS_OpenShift
DROP TABLE POS_CloseShift
DROP TABLE POS_CashManagement
DROP TABLE POS_Summ_OpenCloseShift
DROP TABLE POS_TrxHeader_HIST
*/

/*
ALTER TABLE [dbo].[POS_TrxRefund_POST] DROP CONSTRAINT [FK_POS_TrxRefundHeaderPOST]
GO

ALTER TABLE [dbo].[POS_TrxRefund_POST] DROP CONSTRAINT [FK_POS_OpenShiftTrxRefundPOST]
GO

ALTER TABLE [dbo].[POS_TrxRefund_POST] DROP CONSTRAINT [FK_POS_CloseShiftTrxRefundPOST]
GO

ALTER TABLE [dbo].[POS_TrxRefund_POST] DROP CONSTRAINT [FK_POS_CashMgmtTrxRefundPOST]
GO

ALTER TABLE [dbo].[POS_TrxRefund_POST] DROP CONSTRAINT [FK_POS_SummShiftTrxRefundPOST]
GO
*/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_TrxRefund_POST]') AND type in (N'U'))
DROP TABLE [dbo].[POS_TrxRefund_POST]
GO

/****** Object:  Table [dbo].[POS_TrxRefund_POST]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_TrxRefund_POST
(
	REFUNDNUMBER nvarchar(20) NOT NULL, 
	DOCNUMBER nvarchar(20) NOT NULL, 
	DOCTYPE int NOT NULL,
	DOCDATE DATETIME NOT NULL,
	Refund_Date int NOT NULL,
	Refund_Time DATETIME NOT NULL,
	Refund_User nvarchar(100) NOT NULL, 
	Store_ID nvarchar(20) NOT NULL, 
	Site_ID nvarchar(20) NOT NULL, 
	SalesType_ID nvarchar(20) NOT NULL, 
	CustName nvarchar(200) NOT NULL, 
	Total_Line_Item int NOT NULL,
	ORIGTOTAL numeric(19,5) NOT NULL,
	SUBTOTAL numeric(19,5) NOT NULL,
	Tax_Amount numeric(19,5) NOT NULL,
	Discount_ID nvarchar(20) NOT NULL, 
	Discount_Amount numeric(19,5) NOT NULL,
	Amount_Tendered numeric(19,5) NOT NULL,
	Change_Amount numeric(19,5) NOT NULL,
	Batch_ID nvarchar(20) NOT NULL, 
	POS_Device_ID nvarchar(20) NOT NULL, 
	POS_Version nvarchar(20) NOT NULL, 
	SyncStatus int NOT NULL,
	Created_User nvarchar(30) NOT NULL,
	Created_Date DATETIME NOT NULL,
	Created_time DATETIME,
	Modified_User nvarchar(30) NOT NULL,
	Modified_Date DATETIME NOT NULL,
	Modified_time DATETIME NOT NULL,
	CONSTRAINT PK_POS_TrxRefund_POST PRIMARY KEY NONCLUSTERED (REFUNDNUMBER ASC),
	CONSTRAINT FK_POS_TrxRefundHeaderPOST FOREIGN KEY (DOCNUMBER)
	REFERENCES POS_TrxHeader_POST (DOCNUMBER),
	CONSTRAINT FK_POS_OpenShiftTrxRefundPOST FOREIGN KEY (Batch_ID)
	REFERENCES POS_OpenShift (Batch_ID),
	CONSTRAINT FK_POS_CloseShiftTrxRefundPOST FOREIGN KEY (Batch_ID)
	REFERENCES POS_CloseShift (Batch_ID),
	CONSTRAINT FK_POS_CashMgmtTrxRefundPOST FOREIGN KEY (Batch_ID)
	REFERENCES POS_CashManagement (Batch_ID),
	CONSTRAINT FK_POS_SummShiftTrxRefundPOST FOREIGN KEY (Batch_ID)
	REFERENCES POS_Summ_OpenCloseShift (Batch_ID)
	ON DELETE CASCADE
	ON UPDATE CASCADE
)

GO

/*
DROP TABLE POS_OpenShift
DROP TABLE POS_CloseShift
DROP TABLE POS_CashManagement
DROP TABLE POS_Summ_OpenCloseShift
DROP TABLE POS_TrxHeader_POST
*/


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_TrxRefund_TEMP]') AND type in (N'U'))
DROP TABLE [dbo].[POS_TrxRefund_TEMP]
GO

/****** Object:  Table [dbo].[POS_TrxRefund_TEMP]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_TrxRefund_TEMP
(
	REFUNDNUMBER nvarchar(20) NOT NULL, 
	DOCNUMBER nvarchar(20) NOT NULL, 
	DOCTYPE int NOT NULL,
	DOCDATE DATETIME NOT NULL,
	Refund_Date int NOT NULL,
	Refund_Time DATETIME NOT NULL,
	Refund_User nvarchar(100) NOT NULL, 
	Store_ID nvarchar(20) NOT NULL, 
	Site_ID nvarchar(20) NOT NULL, 
	SalesType_ID nvarchar(20) NOT NULL, 
	CustName nvarchar(200) NOT NULL, 
	Total_Line_Item int NOT NULL,
	ORIGTOTAL numeric(19,5) NOT NULL,
	SUBTOTAL numeric(19,5) NOT NULL,
	Tax_Amount numeric(19,5) NOT NULL,
	Discount_ID nvarchar(20) NOT NULL, 
	Discount_Amount numeric(19,5) NOT NULL,
	Amount_Tendered numeric(19,5) NOT NULL,
	Change_Amount numeric(19,5) NOT NULL,
	Batch_ID nvarchar(20) NOT NULL, 
	POS_Device_ID nvarchar(20) NOT NULL, 
	POS_Version nvarchar(20) NOT NULL, 
	SyncStatus int NOT NULL,
	Created_User nvarchar(30) NOT NULL,
	Created_Date DATETIME NOT NULL,
	Created_time DATETIME,
	Modified_User nvarchar(30) NOT NULL,
	Modified_Date DATETIME NOT NULL,
	Modified_time DATETIME NOT NULL,
	CONSTRAINT PK_POS_TrxRefund_TEMP PRIMARY KEY NONCLUSTERED (REFUNDNUMBER ASC, DOCNUMBER ASC)
)

GO
