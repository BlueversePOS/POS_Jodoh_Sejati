USE [Blueverse_POS]
GO
ALTER TABLE [dbo].[POS_TrxRefund_POST] DROP CONSTRAINT [FK_POS_TrxRefundHeaderPOST]
GO
ALTER TABLE [dbo].[POS_TrxRefund_POST] DROP CONSTRAINT [FK_POS_SummShiftTrxRefundPOST]
GO
ALTER TABLE [dbo].[POS_TrxRefund_POST] DROP CONSTRAINT [FK_POS_OpenShiftTrxRefundPOST]
GO
ALTER TABLE [dbo].[POS_TrxRefund_POST] DROP CONSTRAINT [FK_POS_CloseShiftTrxRefundPOST]
GO
ALTER TABLE [dbo].[POS_TrxRefund_POST] DROP CONSTRAINT [FK_POS_CashMgmtTrxRefundPOST]
GO
ALTER TABLE [dbo].[POS_TrxRefund_HIST] DROP CONSTRAINT [FK_POS_TrxRefundHeaderHIST]
GO
ALTER TABLE [dbo].[POS_TrxRefund_HIST] DROP CONSTRAINT [FK_POS_SummShiftTrxRefundHIST]
GO
ALTER TABLE [dbo].[POS_TrxRefund_HIST] DROP CONSTRAINT [FK_POS_OpenShiftTrxRefundHIST]
GO
ALTER TABLE [dbo].[POS_TrxRefund_HIST] DROP CONSTRAINT [FK_POS_CloseShiftTrxRefundHIST]
GO
ALTER TABLE [dbo].[POS_TrxRefund_HIST] DROP CONSTRAINT [FK_POS_CashMgmtTrxRefundHIST]
GO
ALTER TABLE [dbo].[POS_TrxPayTypes_POST] DROP CONSTRAINT [FK_POS_TrxHeaderPayTypesPOST]
GO
ALTER TABLE [dbo].[POS_TrxPayTypes_HIST] DROP CONSTRAINT [FK_POS_TrxHeaderPayTypesHIST]
GO
ALTER TABLE [dbo].[POS_TrxDetail_POST] DROP CONSTRAINT [FK_POS_TrxHeaderDetailPOST]
GO
ALTER TABLE [dbo].[POS_TrxDetail_HIST] DROP CONSTRAINT [FK_POS_TrxHeaderDetailHIST]
GO
/****** Object:  Index [PK_POS_TrxRefund_TEMP]    Script Date: 13/01/2024 23:38:30 ******/
ALTER TABLE [dbo].[POS_TrxRefund_TEMP] DROP CONSTRAINT [PK_POS_TrxRefund_TEMP]
GO
/****** Object:  Index [PK_POS_TrxRefund_POST]    Script Date: 13/01/2024 23:38:30 ******/
ALTER TABLE [dbo].[POS_TrxRefund_POST] DROP CONSTRAINT [PK_POS_TrxRefund_POST]
GO
/****** Object:  Index [PK_POS_TrxRefund_HIST]    Script Date: 13/01/2024 23:38:30 ******/
ALTER TABLE [dbo].[POS_TrxRefund_HIST] DROP CONSTRAINT [PK_POS_TrxRefund_HIST]
GO
/****** Object:  Index [PK_POS_TrxPayTypes_TEMP]    Script Date: 13/01/2024 23:38:30 ******/
ALTER TABLE [dbo].[POS_TrxPayTypes_TEMP] DROP CONSTRAINT [PK_POS_TrxPayTypes_TEMP]
GO
/****** Object:  Index [PK_POS_TrxPayTypes_POST]    Script Date: 13/01/2024 23:38:30 ******/
ALTER TABLE [dbo].[POS_TrxPayTypes_POST] DROP CONSTRAINT [PK_POS_TrxPayTypes_POST]
GO
/****** Object:  Index [PK_POS_TrxPayTypes_HIST]    Script Date: 13/01/2024 23:38:30 ******/
ALTER TABLE [dbo].[POS_TrxPayTypes_HIST] DROP CONSTRAINT [PK_POS_TrxPayTypes_HIST]
GO
/****** Object:  Index [PK_POS_TrxHeader_TEMP]    Script Date: 13/01/2024 23:38:30 ******/
ALTER TABLE [dbo].[POS_TrxHeader_TEMP] DROP CONSTRAINT [PK_POS_TrxHeader_TEMP]
GO
/****** Object:  Index [PK_POS_TrxHeader_POST]    Script Date: 13/01/2024 23:38:30 ******/
ALTER TABLE [dbo].[POS_TrxHeader_POST] DROP CONSTRAINT [PK_POS_TrxHeader_POST]
GO
/****** Object:  Index [PK_POS_TrxHeader_HIST]    Script Date: 13/01/2024 23:38:30 ******/
ALTER TABLE [dbo].[POS_TrxHeader_HIST] DROP CONSTRAINT [PK_POS_TrxHeader_HIST]
GO
/****** Object:  Index [PK_POS_TrxDetail_TEMP]    Script Date: 13/01/2024 23:38:30 ******/
ALTER TABLE [dbo].[POS_TrxDetail_TEMP] DROP CONSTRAINT [PK_POS_TrxDetail_TEMP]
GO
/****** Object:  Index [PK_POS_TrxDetail_POST]    Script Date: 13/01/2024 23:38:30 ******/
ALTER TABLE [dbo].[POS_TrxDetail_POST] DROP CONSTRAINT [PK_POS_TrxDetail_POST]
GO
/****** Object:  Index [PK_POS_TrxDetail_HIST]    Script Date: 13/01/2024 23:38:30 ******/
ALTER TABLE [dbo].[POS_TrxDetail_HIST] DROP CONSTRAINT [PK_POS_TrxDetail_HIST]
GO
/****** Object:  Index [PK_POS_Summ_OpenCloseShift]    Script Date: 13/01/2024 23:38:30 ******/
ALTER TABLE [dbo].[POS_Summ_OpenCloseShift] DROP CONSTRAINT [PK_POS_Summ_OpenCloseShift]
GO
/****** Object:  Index [PK_POS_PrinterSetup]    Script Date: 13/01/2024 23:38:30 ******/
ALTER TABLE [dbo].[POS_PrinterSetup] DROP CONSTRAINT [PK_POS_PrinterSetup]
GO
/****** Object:  Index [PK_POS_OpenShift]    Script Date: 13/01/2024 23:38:30 ******/
ALTER TABLE [dbo].[POS_OpenShift] DROP CONSTRAINT [PK_POS_OpenShift]
GO
/****** Object:  Index [PK_POS_CloseShift]    Script Date: 13/01/2024 23:38:30 ******/
ALTER TABLE [dbo].[POS_CloseShift] DROP CONSTRAINT [PK_POS_CloseShift]
GO
/****** Object:  Index [PK_POS_CashManagement]    Script Date: 13/01/2024 23:38:30 ******/
ALTER TABLE [dbo].[POS_CashManagement] DROP CONSTRAINT [PK_POS_CashManagement]
GO
/****** Object:  Table [dbo].[POS_TrxRefund_TEMP]    Script Date: 13/01/2024 23:38:30 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_TrxRefund_TEMP]') AND type in (N'U'))
DROP TABLE [dbo].[POS_TrxRefund_TEMP]
GO
/****** Object:  Table [dbo].[POS_TrxRefund_POST]    Script Date: 13/01/2024 23:38:30 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_TrxRefund_POST]') AND type in (N'U'))
DROP TABLE [dbo].[POS_TrxRefund_POST]
GO
/****** Object:  Table [dbo].[POS_TrxRefund_HIST]    Script Date: 13/01/2024 23:38:30 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_TrxRefund_HIST]') AND type in (N'U'))
DROP TABLE [dbo].[POS_TrxRefund_HIST]
GO
/****** Object:  Table [dbo].[POS_TrxPayTypes_TEMP]    Script Date: 13/01/2024 23:38:30 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_TrxPayTypes_TEMP]') AND type in (N'U'))
DROP TABLE [dbo].[POS_TrxPayTypes_TEMP]
GO
/****** Object:  Table [dbo].[POS_TrxPayTypes_POST]    Script Date: 13/01/2024 23:38:30 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_TrxPayTypes_POST]') AND type in (N'U'))
DROP TABLE [dbo].[POS_TrxPayTypes_POST]
GO
/****** Object:  Table [dbo].[POS_TrxPayTypes_HIST]    Script Date: 13/01/2024 23:38:30 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_TrxPayTypes_HIST]') AND type in (N'U'))
DROP TABLE [dbo].[POS_TrxPayTypes_HIST]
GO
/****** Object:  Table [dbo].[POS_TrxHeader_TEMP]    Script Date: 13/01/2024 23:38:30 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_TrxHeader_TEMP]') AND type in (N'U'))
DROP TABLE [dbo].[POS_TrxHeader_TEMP]
GO
/****** Object:  Table [dbo].[POS_TrxHeader_POST]    Script Date: 13/01/2024 23:38:30 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_TrxHeader_POST]') AND type in (N'U'))
DROP TABLE [dbo].[POS_TrxHeader_POST]
GO
/****** Object:  Table [dbo].[POS_TrxHeader_HIST]    Script Date: 13/01/2024 23:38:30 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_TrxHeader_HIST]') AND type in (N'U'))
DROP TABLE [dbo].[POS_TrxHeader_HIST]
GO
/****** Object:  Table [dbo].[POS_TrxDetail_TEMP]    Script Date: 13/01/2024 23:38:30 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_TrxDetail_TEMP]') AND type in (N'U'))
DROP TABLE [dbo].[POS_TrxDetail_TEMP]
GO
/****** Object:  Table [dbo].[POS_TrxDetail_POST]    Script Date: 13/01/2024 23:38:30 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_TrxDetail_POST]') AND type in (N'U'))
DROP TABLE [dbo].[POS_TrxDetail_POST]
GO
/****** Object:  Table [dbo].[POS_TrxDetail_HIST]    Script Date: 13/01/2024 23:38:30 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_TrxDetail_HIST]') AND type in (N'U'))
DROP TABLE [dbo].[POS_TrxDetail_HIST]
GO
/****** Object:  Table [dbo].[POS_Summ_OpenCloseShift]    Script Date: 13/01/2024 23:38:30 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_Summ_OpenCloseShift]') AND type in (N'U'))
DROP TABLE [dbo].[POS_Summ_OpenCloseShift]
GO
/****** Object:  Table [dbo].[POS_PrinterSetup]    Script Date: 13/01/2024 23:38:30 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_PrinterSetup]') AND type in (N'U'))
DROP TABLE [dbo].[POS_PrinterSetup]
GO
/****** Object:  Table [dbo].[POS_OpenShift]    Script Date: 13/01/2024 23:38:30 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_OpenShift]') AND type in (N'U'))
DROP TABLE [dbo].[POS_OpenShift]
GO
/****** Object:  Table [dbo].[POS_CloseShift]    Script Date: 13/01/2024 23:38:30 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_CloseShift]') AND type in (N'U'))
DROP TABLE [dbo].[POS_CloseShift]
GO
/****** Object:  Table [dbo].[POS_CashManagement]    Script Date: 13/01/2024 23:38:30 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_CashManagement]') AND type in (N'U'))
DROP TABLE [dbo].[POS_CashManagement]
GO
/****** Object:  Table [dbo].[POS_CashManagement]    Script Date: 13/01/2024 23:38:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POS_CashManagement](
	[Batch_ID] [nvarchar](20) NOT NULL,
	[Type_CashManagement] [nvarchar](20) NOT NULL,
	[Amount] [numeric](19, 5) NOT NULL,
	[Notes] [nvarchar](200) NOT NULL,
	[POS_ID] [nvarchar](20) NOT NULL,
	[Created_User] [nvarchar](30) NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Created_time] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[POS_CloseShift]    Script Date: 13/01/2024 23:38:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POS_CloseShift](
	[Batch_ID] [nvarchar](20) NOT NULL,
	[Lineitmseq] [int] NOT NULL,
	[Payment_ID] [nvarchar](20) NOT NULL,
	[Payment_Type] [nvarchar](20) NOT NULL,
	[Amount_Opening] [numeric](19, 5) NOT NULL,
	[Created_User] [nvarchar](30) NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Modified_User] [nvarchar](30) NULL,
	[Modified_Date] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[POS_OpenShift]    Script Date: 13/01/2024 23:38:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POS_OpenShift](
	[Batch_ID] [nvarchar](20) NOT NULL,
	[Lineitmseq] [int] NOT NULL,
	[Payment_ID] [nvarchar](20) NOT NULL,
	[Payment_Type] [nvarchar](20) NOT NULL,
	[Amount_Opening] [numeric](19, 5) NOT NULL,
	[Created_User] [nvarchar](30) NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Modified_User] [nvarchar](30) NULL,
	[Modified_Date] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[POS_PrinterSetup]    Script Date: 13/01/2024 23:38:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POS_PrinterSetup](
	[PrinterID] [nvarchar](20) NOT NULL,
	[PrinterName] [nvarchar](20) NOT NULL,
	[Printer_Checkbox1] [int] NOT NULL,
	[Printer_Checkbox2] [int] NOT NULL,
	[Printer_Checkbox3] [int] NOT NULL,
	[Created_User] [nvarchar](30) NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Created_time] [datetime] NOT NULL,
	[Modified_User] [nvarchar](30) NOT NULL,
	[Modified_Date] [datetime] NOT NULL,
	[Modified_time] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[POS_Summ_OpenCloseShift]    Script Date: 13/01/2024 23:38:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POS_Summ_OpenCloseShift](
	[Batch_ID] [nvarchar](20) NOT NULL,
	[LastEdit_Date] [datetime] NOT NULL,
	[LastEdit_time] [datetime] NOT NULL,
	[Store_ID] [nvarchar](20) NOT NULL,
	[POS_Device_ID] [nvarchar](20) NOT NULL,
	[Opening_Date] [datetime] NOT NULL,
	[Opening_time] [datetime] NOT NULL,
	[Closing_Date] [datetime] NOT NULL,
	[Closing_time] [datetime] NOT NULL,
	[Sum_Amount_Opening] [numeric](19, 5) NOT NULL,
	[Sum_Amount_Closing] [numeric](19, 5) NOT NULL,
	[Sum_Invoice_Posted] [numeric](19, 5) NOT NULL,
	[Sum_Tendered] [numeric](19, 5) NOT NULL,
	[Sum_Changes] [numeric](19, 5) NOT NULL,
	[Sum_Amount_Discount] [numeric](19, 5) NOT NULL,
	[Sum_Amount_Tax] [numeric](19, 5) NOT NULL,
	[Sum_Invoice_Refund_Posted] [numeric](19, 5) NOT NULL,
	[Sum_Amount_PayOut] [numeric](19, 5) NOT NULL,
	[Sum_Amount_PayIn] [numeric](19, 5) NOT NULL,
	[Count_Customers] [int] NOT NULL,
	[Status_Batch] [int] NOT NULL,
	[Created_User] [nvarchar](30) NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Created_time] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[POS_TrxDetail_HIST]    Script Date: 13/01/2024 23:38:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POS_TrxDetail_HIST](
	[DOCNUMBER] [nvarchar](20) NOT NULL,
	[DOCTYPE] [int] NOT NULL,
	[DOCDATE] [datetime] NOT NULL,
	[Lineitmseq] [int] NOT NULL,
	[Item_Number] [nvarchar](20) NOT NULL,
	[Item_Description] [nvarchar](500) NOT NULL,
	[Quantity] [numeric](19, 5) NOT NULL,
	[UofM] [nvarchar](20) NOT NULL,
	[Item_Price] [numeric](19, 5) NOT NULL,
	[Item_Cost] [numeric](19, 5) NOT NULL,
	[Store_ID] [nvarchar](20) NOT NULL,
	[Site_ID] [nvarchar](20) NOT NULL,
	[SalesType_ID] [nvarchar](20) NOT NULL,
	[Discount_ID] [nvarchar](20) NOT NULL,
	[Discount_Amount] [numeric](19, 5) NOT NULL,
	[Notes] [nvarchar](200) NOT NULL,
	[POS_Device_ID] [nvarchar](20) NOT NULL,
	[POS_Version] [nvarchar](20) NOT NULL,
	[Created_User] [nvarchar](30) NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Created_time] [datetime] NULL,
	[Modified_User] [nvarchar](30) NOT NULL,
	[Modified_Date] [datetime] NOT NULL,
	[Modified_time] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[POS_TrxDetail_POST]    Script Date: 13/01/2024 23:38:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POS_TrxDetail_POST](
	[DOCNUMBER] [nvarchar](20) NOT NULL,
	[DOCTYPE] [int] NOT NULL,
	[DOCDATE] [datetime] NOT NULL,
	[Lineitmseq] [int] NOT NULL,
	[Item_Number] [nvarchar](20) NOT NULL,
	[Item_Description] [nvarchar](500) NOT NULL,
	[Quantity] [numeric](19, 5) NOT NULL,
	[UofM] [nvarchar](20) NOT NULL,
	[Item_Price] [numeric](19, 5) NOT NULL,
	[Item_Cost] [numeric](19, 5) NOT NULL,
	[Store_ID] [nvarchar](20) NOT NULL,
	[Site_ID] [nvarchar](20) NOT NULL,
	[SalesType_ID] [nvarchar](20) NOT NULL,
	[Discount_ID] [nvarchar](20) NOT NULL,
	[Discount_Amount] [numeric](19, 5) NOT NULL,
	[Notes] [nvarchar](200) NOT NULL,
	[POS_Device_ID] [nvarchar](20) NOT NULL,
	[POS_Version] [nvarchar](20) NOT NULL,
	[Created_User] [nvarchar](30) NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Created_time] [datetime] NULL,
	[Modified_User] [nvarchar](30) NOT NULL,
	[Modified_Date] [datetime] NOT NULL,
	[Modified_time] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[POS_TrxDetail_TEMP]    Script Date: 13/01/2024 23:38:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POS_TrxDetail_TEMP](
	[DOCNUMBER] [nvarchar](20) NOT NULL,
	[DOCTYPE] [int] NOT NULL,
	[DOCDATE] [datetime] NOT NULL,
	[Lineitmseq] [int] NOT NULL,
	[Item_Number] [nvarchar](20) NOT NULL,
	[Item_Description] [nvarchar](500) NOT NULL,
	[Quantity] [numeric](19, 5) NOT NULL,
	[UofM] [nvarchar](20) NOT NULL,
	[Item_Price] [numeric](19, 5) NOT NULL,
	[Item_Cost] [numeric](19, 5) NOT NULL,
	[Store_ID] [nvarchar](20) NOT NULL,
	[Site_ID] [nvarchar](20) NOT NULL,
	[SalesType_ID] [nvarchar](20) NOT NULL,
	[Discount_ID] [nvarchar](20) NOT NULL,
	[Discount_Amount] [numeric](19, 5) NOT NULL,
	[Notes] [nvarchar](200) NOT NULL,
	[POS_Device_ID] [nvarchar](20) NOT NULL,
	[POS_Version] [nvarchar](20) NOT NULL,
	[Created_User] [nvarchar](30) NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Created_time] [datetime] NULL,
	[Modified_User] [nvarchar](30) NOT NULL,
	[Modified_Date] [datetime] NOT NULL,
	[Modified_time] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[POS_TrxHeader_HIST]    Script Date: 13/01/2024 23:38:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POS_TrxHeader_HIST](
	[DOCNUMBER] [nvarchar](20) NOT NULL,
	[DOCTYPE] [int] NOT NULL,
	[DOCDATE] [datetime] NOT NULL,
	[Store_ID] [nvarchar](20) NOT NULL,
	[Site_ID] [nvarchar](20) NOT NULL,
	[SalesType_ID] [nvarchar](20) NOT NULL,
	[CustName] [nvarchar](200) NOT NULL,
	[Total_Line_Item] [int] NOT NULL,
	[ORIGTOTAL] [numeric](19, 5) NOT NULL,
	[SUBTOTAL] [numeric](19, 5) NOT NULL,
	[Tax_Amount] [numeric](19, 5) NOT NULL,
	[Discount_ID] [nvarchar](20) NOT NULL,
	[Discount_Amount] [numeric](19, 5) NOT NULL,
	[Amount_Tendered] [numeric](19, 5) NOT NULL,
	[Change_Amount] [numeric](19, 5) NOT NULL,
	[Batch_ID] [nvarchar](20) NOT NULL,
	[POS_Device_ID] [nvarchar](20) NOT NULL,
	[POS_Version] [nvarchar](20) NOT NULL,
	[SyncStatus] [int] NOT NULL,
	[Created_User] [nvarchar](30) NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Created_time] [datetime] NULL,
	[Modified_User] [nvarchar](30) NOT NULL,
	[Modified_Date] [datetime] NOT NULL,
	[Modified_time] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[POS_TrxHeader_POST]    Script Date: 13/01/2024 23:38:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POS_TrxHeader_POST](
	[DOCNUMBER] [nvarchar](20) NOT NULL,
	[DOCTYPE] [int] NOT NULL,
	[DOCDATE] [datetime] NOT NULL,
	[Store_ID] [nvarchar](20) NOT NULL,
	[Site_ID] [nvarchar](20) NOT NULL,
	[SalesType_ID] [nvarchar](20) NOT NULL,
	[CustName] [nvarchar](200) NOT NULL,
	[Total_Line_Item] [int] NOT NULL,
	[ORIGTOTAL] [numeric](19, 5) NOT NULL,
	[SUBTOTAL] [numeric](19, 5) NOT NULL,
	[Tax_Amount] [numeric](19, 5) NOT NULL,
	[Discount_ID] [nvarchar](20) NOT NULL,
	[Discount_Amount] [numeric](19, 5) NOT NULL,
	[Amount_Tendered] [numeric](19, 5) NOT NULL,
	[Change_Amount] [numeric](19, 5) NOT NULL,
	[Batch_ID] [nvarchar](20) NOT NULL,
	[POS_Device_ID] [nvarchar](20) NOT NULL,
	[POS_Version] [nvarchar](20) NOT NULL,
	[SyncStatus] [int] NOT NULL,
	[Created_User] [nvarchar](30) NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Created_time] [datetime] NULL,
	[Modified_User] [nvarchar](30) NOT NULL,
	[Modified_Date] [datetime] NOT NULL,
	[Modified_time] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[POS_TrxHeader_TEMP]    Script Date: 13/01/2024 23:38:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POS_TrxHeader_TEMP](
	[DOCNUMBER] [nvarchar](20) NOT NULL,
	[DOCTYPE] [int] NOT NULL,
	[DOCDATE] [datetime] NOT NULL,
	[Store_ID] [nvarchar](20) NOT NULL,
	[Site_ID] [nvarchar](20) NOT NULL,
	[SalesType_ID] [nvarchar](20) NOT NULL,
	[CustName] [nvarchar](200) NOT NULL,
	[Total_Line_Item] [int] NOT NULL,
	[ORIGTOTAL] [numeric](19, 5) NOT NULL,
	[SUBTOTAL] [numeric](19, 5) NOT NULL,
	[Tax_Amount] [numeric](19, 5) NOT NULL,
	[Discount_ID] [nvarchar](20) NOT NULL,
	[Discount_Amount] [numeric](19, 5) NOT NULL,
	[Amount_Tendered] [numeric](19, 5) NOT NULL,
	[Change_Amount] [numeric](19, 5) NOT NULL,
	[Batch_ID] [nvarchar](20) NOT NULL,
	[POS_Device_ID] [nvarchar](20) NOT NULL,
	[POS_Version] [nvarchar](20) NOT NULL,
	[SyncStatus] [int] NOT NULL,
	[Created_User] [nvarchar](30) NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Created_time] [datetime] NULL,
	[Modified_User] [nvarchar](30) NOT NULL,
	[Modified_Date] [datetime] NOT NULL,
	[Modified_time] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[POS_TrxPayTypes_HIST]    Script Date: 13/01/2024 23:38:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POS_TrxPayTypes_HIST](
	[DOCNUMBER] [nvarchar](20) NOT NULL,
	[DOCTYPE] [int] NOT NULL,
	[DOCDATE] [datetime] NOT NULL,
	[Lnitmseq] [int] NOT NULL,
	[Payment_ID] [nvarchar](20) NOT NULL,
	[Payment_Type] [nvarchar](20) NOT NULL,
	[ORIGTOTAL] [numeric](19, 5) NOT NULL,
	[SUBTOTAL] [numeric](19, 5) NOT NULL,
	[Amount_Tendered] [numeric](19, 5) NOT NULL,
	[Change_Amount] [numeric](19, 5) NOT NULL,
	[Store_ID] [nvarchar](20) NOT NULL,
	[POS_Device_ID] [nvarchar](20) NOT NULL,
	[POS_Version] [nvarchar](20) NOT NULL,
	[Created_User] [nvarchar](30) NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Created_time] [datetime] NULL,
	[Modified_User] [nvarchar](30) NOT NULL,
	[Modified_Date] [datetime] NOT NULL,
	[Modified_time] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[POS_TrxPayTypes_POST]    Script Date: 13/01/2024 23:38:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POS_TrxPayTypes_POST](
	[DOCNUMBER] [nvarchar](20) NOT NULL,
	[DOCTYPE] [int] NOT NULL,
	[DOCDATE] [datetime] NOT NULL,
	[Lnitmseq] [int] NOT NULL,
	[Payment_ID] [nvarchar](20) NOT NULL,
	[Payment_Type] [nvarchar](20) NOT NULL,
	[ORIGTOTAL] [numeric](19, 5) NOT NULL,
	[SUBTOTAL] [numeric](19, 5) NOT NULL,
	[Amount_Tendered] [numeric](19, 5) NOT NULL,
	[Change_Amount] [numeric](19, 5) NOT NULL,
	[Store_ID] [nvarchar](20) NOT NULL,
	[POS_Device_ID] [nvarchar](20) NOT NULL,
	[POS_Version] [nvarchar](20) NOT NULL,
	[Created_User] [nvarchar](30) NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Created_time] [datetime] NULL,
	[Modified_User] [nvarchar](30) NOT NULL,
	[Modified_Date] [datetime] NOT NULL,
	[Modified_time] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[POS_TrxPayTypes_TEMP]    Script Date: 13/01/2024 23:38:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POS_TrxPayTypes_TEMP](
	[DOCNUMBER] [nvarchar](20) NOT NULL,
	[DOCTYPE] [int] NOT NULL,
	[DOCDATE] [datetime] NOT NULL,
	[Lnitmseq] [int] NOT NULL,
	[Payment_ID] [nvarchar](20) NOT NULL,
	[Payment_Type] [nvarchar](20) NOT NULL,
	[ORIGTOTAL] [numeric](19, 5) NOT NULL,
	[SUBTOTAL] [numeric](19, 5) NOT NULL,
	[Amount_Tendered] [numeric](19, 5) NOT NULL,
	[Change_Amount] [numeric](19, 5) NOT NULL,
	[Store_ID] [nvarchar](20) NOT NULL,
	[POS_Device_ID] [nvarchar](20) NOT NULL,
	[POS_Version] [nvarchar](20) NOT NULL,
	[Created_User] [nvarchar](30) NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Created_time] [datetime] NULL,
	[Modified_User] [nvarchar](30) NOT NULL,
	[Modified_Date] [datetime] NOT NULL,
	[Modified_time] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[POS_TrxRefund_HIST]    Script Date: 13/01/2024 23:38:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POS_TrxRefund_HIST](
	[REFUNDNUMBER] [nvarchar](20) NOT NULL,
	[DOCNUMBER] [nvarchar](20) NOT NULL,
	[DOCTYPE] [int] NOT NULL,
	[DOCDATE] [datetime] NOT NULL,
	[Refund_Date] [int] NOT NULL,
	[Refund_Time] [datetime] NOT NULL,
	[Refund_User] [nvarchar](100) NOT NULL,
	[Store_ID] [nvarchar](20) NOT NULL,
	[Site_ID] [nvarchar](20) NOT NULL,
	[SalesType_ID] [nvarchar](20) NOT NULL,
	[CustName] [nvarchar](200) NOT NULL,
	[Total_Line_Item] [int] NOT NULL,
	[ORIGTOTAL] [numeric](19, 5) NOT NULL,
	[SUBTOTAL] [numeric](19, 5) NOT NULL,
	[Tax_Amount] [numeric](19, 5) NOT NULL,
	[Discount_ID] [nvarchar](20) NOT NULL,
	[Discount_Amount] [numeric](19, 5) NOT NULL,
	[Amount_Tendered] [numeric](19, 5) NOT NULL,
	[Change_Amount] [numeric](19, 5) NOT NULL,
	[Batch_ID] [nvarchar](20) NOT NULL,
	[POS_Device_ID] [nvarchar](20) NOT NULL,
	[POS_Version] [nvarchar](20) NOT NULL,
	[SyncStatus] [int] NOT NULL,
	[Created_User] [nvarchar](30) NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Created_time] [datetime] NULL,
	[Modified_User] [nvarchar](30) NOT NULL,
	[Modified_Date] [datetime] NOT NULL,
	[Modified_time] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[POS_TrxRefund_POST]    Script Date: 13/01/2024 23:38:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POS_TrxRefund_POST](
	[REFUNDNUMBER] [nvarchar](20) NOT NULL,
	[DOCNUMBER] [nvarchar](20) NOT NULL,
	[DOCTYPE] [int] NOT NULL,
	[DOCDATE] [datetime] NOT NULL,
	[Refund_Date] [int] NOT NULL,
	[Refund_Time] [datetime] NOT NULL,
	[Refund_User] [nvarchar](100) NOT NULL,
	[Store_ID] [nvarchar](20) NOT NULL,
	[Site_ID] [nvarchar](20) NOT NULL,
	[SalesType_ID] [nvarchar](20) NOT NULL,
	[CustName] [nvarchar](200) NOT NULL,
	[Total_Line_Item] [int] NOT NULL,
	[ORIGTOTAL] [numeric](19, 5) NOT NULL,
	[SUBTOTAL] [numeric](19, 5) NOT NULL,
	[Tax_Amount] [numeric](19, 5) NOT NULL,
	[Discount_ID] [nvarchar](20) NOT NULL,
	[Discount_Amount] [numeric](19, 5) NOT NULL,
	[Amount_Tendered] [numeric](19, 5) NOT NULL,
	[Change_Amount] [numeric](19, 5) NOT NULL,
	[Batch_ID] [nvarchar](20) NOT NULL,
	[POS_Device_ID] [nvarchar](20) NOT NULL,
	[POS_Version] [nvarchar](20) NOT NULL,
	[SyncStatus] [int] NOT NULL,
	[Created_User] [nvarchar](30) NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Created_time] [datetime] NULL,
	[Modified_User] [nvarchar](30) NOT NULL,
	[Modified_Date] [datetime] NOT NULL,
	[Modified_time] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[POS_TrxRefund_TEMP]    Script Date: 13/01/2024 23:38:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POS_TrxRefund_TEMP](
	[REFUNDNUMBER] [nvarchar](20) NOT NULL,
	[DOCNUMBER] [nvarchar](20) NOT NULL,
	[DOCTYPE] [int] NOT NULL,
	[DOCDATE] [datetime] NOT NULL,
	[Refund_Date] [int] NOT NULL,
	[Refund_Time] [datetime] NOT NULL,
	[Refund_User] [nvarchar](100) NOT NULL,
	[Store_ID] [nvarchar](20) NOT NULL,
	[Site_ID] [nvarchar](20) NOT NULL,
	[SalesType_ID] [nvarchar](20) NOT NULL,
	[CustName] [nvarchar](200) NOT NULL,
	[Total_Line_Item] [int] NOT NULL,
	[ORIGTOTAL] [numeric](19, 5) NOT NULL,
	[SUBTOTAL] [numeric](19, 5) NOT NULL,
	[Tax_Amount] [numeric](19, 5) NOT NULL,
	[Discount_ID] [nvarchar](20) NOT NULL,
	[Discount_Amount] [numeric](19, 5) NOT NULL,
	[Amount_Tendered] [numeric](19, 5) NOT NULL,
	[Change_Amount] [numeric](19, 5) NOT NULL,
	[Batch_ID] [nvarchar](20) NOT NULL,
	[POS_Device_ID] [nvarchar](20) NOT NULL,
	[POS_Version] [nvarchar](20) NOT NULL,
	[SyncStatus] [int] NOT NULL,
	[Created_User] [nvarchar](30) NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Created_time] [datetime] NULL,
	[Modified_User] [nvarchar](30) NOT NULL,
	[Modified_Date] [datetime] NOT NULL,
	[Modified_time] [datetime] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [PK_POS_CashManagement]    Script Date: 13/01/2024 23:38:30 ******/
ALTER TABLE [dbo].[POS_CashManagement] ADD  CONSTRAINT [PK_POS_CashManagement] PRIMARY KEY NONCLUSTERED 
(
	[Batch_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [PK_POS_CloseShift]    Script Date: 13/01/2024 23:38:30 ******/
ALTER TABLE [dbo].[POS_CloseShift] ADD  CONSTRAINT [PK_POS_CloseShift] PRIMARY KEY NONCLUSTERED 
(
	[Batch_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [PK_POS_OpenShift]    Script Date: 13/01/2024 23:38:30 ******/
ALTER TABLE [dbo].[POS_OpenShift] ADD  CONSTRAINT [PK_POS_OpenShift] PRIMARY KEY NONCLUSTERED 
(
	[Batch_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [PK_POS_PrinterSetup]    Script Date: 13/01/2024 23:38:30 ******/
ALTER TABLE [dbo].[POS_PrinterSetup] ADD  CONSTRAINT [PK_POS_PrinterSetup] PRIMARY KEY NONCLUSTERED 
(
	[PrinterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [PK_POS_Summ_OpenCloseShift]    Script Date: 13/01/2024 23:38:30 ******/
ALTER TABLE [dbo].[POS_Summ_OpenCloseShift] ADD  CONSTRAINT [PK_POS_Summ_OpenCloseShift] PRIMARY KEY NONCLUSTERED 
(
	[Batch_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [PK_POS_TrxDetail_HIST]    Script Date: 13/01/2024 23:38:30 ******/
ALTER TABLE [dbo].[POS_TrxDetail_HIST] ADD  CONSTRAINT [PK_POS_TrxDetail_HIST] PRIMARY KEY NONCLUSTERED 
(
	[DOCNUMBER] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [PK_POS_TrxDetail_POST]    Script Date: 13/01/2024 23:38:30 ******/
ALTER TABLE [dbo].[POS_TrxDetail_POST] ADD  CONSTRAINT [PK_POS_TrxDetail_POST] PRIMARY KEY NONCLUSTERED 
(
	[DOCNUMBER] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [PK_POS_TrxDetail_TEMP]    Script Date: 13/01/2024 23:38:30 ******/
ALTER TABLE [dbo].[POS_TrxDetail_TEMP] ADD  CONSTRAINT [PK_POS_TrxDetail_TEMP] PRIMARY KEY NONCLUSTERED 
(
	[DOCNUMBER] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [PK_POS_TrxHeader_HIST]    Script Date: 13/01/2024 23:38:30 ******/
ALTER TABLE [dbo].[POS_TrxHeader_HIST] ADD  CONSTRAINT [PK_POS_TrxHeader_HIST] PRIMARY KEY NONCLUSTERED 
(
	[DOCNUMBER] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [PK_POS_TrxHeader_POST]    Script Date: 13/01/2024 23:38:30 ******/
ALTER TABLE [dbo].[POS_TrxHeader_POST] ADD  CONSTRAINT [PK_POS_TrxHeader_POST] PRIMARY KEY NONCLUSTERED 
(
	[DOCNUMBER] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [PK_POS_TrxHeader_TEMP]    Script Date: 13/01/2024 23:38:30 ******/
ALTER TABLE [dbo].[POS_TrxHeader_TEMP] ADD  CONSTRAINT [PK_POS_TrxHeader_TEMP] PRIMARY KEY NONCLUSTERED 
(
	[DOCNUMBER] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [PK_POS_TrxPayTypes_HIST]    Script Date: 13/01/2024 23:38:30 ******/
ALTER TABLE [dbo].[POS_TrxPayTypes_HIST] ADD  CONSTRAINT [PK_POS_TrxPayTypes_HIST] PRIMARY KEY NONCLUSTERED 
(
	[DOCNUMBER] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [PK_POS_TrxPayTypes_POST]    Script Date: 13/01/2024 23:38:30 ******/
ALTER TABLE [dbo].[POS_TrxPayTypes_POST] ADD  CONSTRAINT [PK_POS_TrxPayTypes_POST] PRIMARY KEY NONCLUSTERED 
(
	[DOCNUMBER] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [PK_POS_TrxPayTypes_TEMP]    Script Date: 13/01/2024 23:38:30 ******/
ALTER TABLE [dbo].[POS_TrxPayTypes_TEMP] ADD  CONSTRAINT [PK_POS_TrxPayTypes_TEMP] PRIMARY KEY NONCLUSTERED 
(
	[DOCNUMBER] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [PK_POS_TrxRefund_HIST]    Script Date: 13/01/2024 23:38:30 ******/
ALTER TABLE [dbo].[POS_TrxRefund_HIST] ADD  CONSTRAINT [PK_POS_TrxRefund_HIST] PRIMARY KEY NONCLUSTERED 
(
	[REFUNDNUMBER] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [PK_POS_TrxRefund_POST]    Script Date: 13/01/2024 23:38:30 ******/
ALTER TABLE [dbo].[POS_TrxRefund_POST] ADD  CONSTRAINT [PK_POS_TrxRefund_POST] PRIMARY KEY NONCLUSTERED 
(
	[REFUNDNUMBER] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [PK_POS_TrxRefund_TEMP]    Script Date: 13/01/2024 23:38:30 ******/
ALTER TABLE [dbo].[POS_TrxRefund_TEMP] ADD  CONSTRAINT [PK_POS_TrxRefund_TEMP] PRIMARY KEY NONCLUSTERED 
(
	[REFUNDNUMBER] ASC,
	[DOCNUMBER] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[POS_TrxDetail_HIST]  WITH CHECK ADD  CONSTRAINT [FK_POS_TrxHeaderDetailHIST] FOREIGN KEY([DOCNUMBER])
REFERENCES [dbo].[POS_TrxHeader_HIST] ([DOCNUMBER])
GO
ALTER TABLE [dbo].[POS_TrxDetail_HIST] CHECK CONSTRAINT [FK_POS_TrxHeaderDetailHIST]
GO
ALTER TABLE [dbo].[POS_TrxDetail_POST]  WITH CHECK ADD  CONSTRAINT [FK_POS_TrxHeaderDetailPOST] FOREIGN KEY([DOCNUMBER])
REFERENCES [dbo].[POS_TrxHeader_POST] ([DOCNUMBER])
GO
ALTER TABLE [dbo].[POS_TrxDetail_POST] CHECK CONSTRAINT [FK_POS_TrxHeaderDetailPOST]
GO
ALTER TABLE [dbo].[POS_TrxPayTypes_HIST]  WITH CHECK ADD  CONSTRAINT [FK_POS_TrxHeaderPayTypesHIST] FOREIGN KEY([DOCNUMBER])
REFERENCES [dbo].[POS_TrxHeader_HIST] ([DOCNUMBER])
GO
ALTER TABLE [dbo].[POS_TrxPayTypes_HIST] CHECK CONSTRAINT [FK_POS_TrxHeaderPayTypesHIST]
GO
ALTER TABLE [dbo].[POS_TrxPayTypes_POST]  WITH CHECK ADD  CONSTRAINT [FK_POS_TrxHeaderPayTypesPOST] FOREIGN KEY([DOCNUMBER])
REFERENCES [dbo].[POS_TrxHeader_POST] ([DOCNUMBER])
GO
ALTER TABLE [dbo].[POS_TrxPayTypes_POST] CHECK CONSTRAINT [FK_POS_TrxHeaderPayTypesPOST]
GO
ALTER TABLE [dbo].[POS_TrxRefund_HIST]  WITH CHECK ADD  CONSTRAINT [FK_POS_CashMgmtTrxRefundHIST] FOREIGN KEY([Batch_ID])
REFERENCES [dbo].[POS_CashManagement] ([Batch_ID])
GO
ALTER TABLE [dbo].[POS_TrxRefund_HIST] CHECK CONSTRAINT [FK_POS_CashMgmtTrxRefundHIST]
GO
ALTER TABLE [dbo].[POS_TrxRefund_HIST]  WITH CHECK ADD  CONSTRAINT [FK_POS_CloseShiftTrxRefundHIST] FOREIGN KEY([Batch_ID])
REFERENCES [dbo].[POS_CloseShift] ([Batch_ID])
GO
ALTER TABLE [dbo].[POS_TrxRefund_HIST] CHECK CONSTRAINT [FK_POS_CloseShiftTrxRefundHIST]
GO
ALTER TABLE [dbo].[POS_TrxRefund_HIST]  WITH CHECK ADD  CONSTRAINT [FK_POS_OpenShiftTrxRefundHIST] FOREIGN KEY([Batch_ID])
REFERENCES [dbo].[POS_OpenShift] ([Batch_ID])
GO
ALTER TABLE [dbo].[POS_TrxRefund_HIST] CHECK CONSTRAINT [FK_POS_OpenShiftTrxRefundHIST]
GO
ALTER TABLE [dbo].[POS_TrxRefund_HIST]  WITH CHECK ADD  CONSTRAINT [FK_POS_SummShiftTrxRefundHIST] FOREIGN KEY([Batch_ID])
REFERENCES [dbo].[POS_Summ_OpenCloseShift] ([Batch_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[POS_TrxRefund_HIST] CHECK CONSTRAINT [FK_POS_SummShiftTrxRefundHIST]
GO
ALTER TABLE [dbo].[POS_TrxRefund_HIST]  WITH CHECK ADD  CONSTRAINT [FK_POS_TrxRefundHeaderHIST] FOREIGN KEY([DOCNUMBER])
REFERENCES [dbo].[POS_TrxHeader_HIST] ([DOCNUMBER])
GO
ALTER TABLE [dbo].[POS_TrxRefund_HIST] CHECK CONSTRAINT [FK_POS_TrxRefundHeaderHIST]
GO
ALTER TABLE [dbo].[POS_TrxRefund_POST]  WITH CHECK ADD  CONSTRAINT [FK_POS_CashMgmtTrxRefundPOST] FOREIGN KEY([Batch_ID])
REFERENCES [dbo].[POS_CashManagement] ([Batch_ID])
GO
ALTER TABLE [dbo].[POS_TrxRefund_POST] CHECK CONSTRAINT [FK_POS_CashMgmtTrxRefundPOST]
GO
ALTER TABLE [dbo].[POS_TrxRefund_POST]  WITH CHECK ADD  CONSTRAINT [FK_POS_CloseShiftTrxRefundPOST] FOREIGN KEY([Batch_ID])
REFERENCES [dbo].[POS_CloseShift] ([Batch_ID])
GO
ALTER TABLE [dbo].[POS_TrxRefund_POST] CHECK CONSTRAINT [FK_POS_CloseShiftTrxRefundPOST]
GO
ALTER TABLE [dbo].[POS_TrxRefund_POST]  WITH CHECK ADD  CONSTRAINT [FK_POS_OpenShiftTrxRefundPOST] FOREIGN KEY([Batch_ID])
REFERENCES [dbo].[POS_OpenShift] ([Batch_ID])
GO
ALTER TABLE [dbo].[POS_TrxRefund_POST] CHECK CONSTRAINT [FK_POS_OpenShiftTrxRefundPOST]
GO
ALTER TABLE [dbo].[POS_TrxRefund_POST]  WITH CHECK ADD  CONSTRAINT [FK_POS_SummShiftTrxRefundPOST] FOREIGN KEY([Batch_ID])
REFERENCES [dbo].[POS_Summ_OpenCloseShift] ([Batch_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[POS_TrxRefund_POST] CHECK CONSTRAINT [FK_POS_SummShiftTrxRefundPOST]
GO
ALTER TABLE [dbo].[POS_TrxRefund_POST]  WITH CHECK ADD  CONSTRAINT [FK_POS_TrxRefundHeaderPOST] FOREIGN KEY([DOCNUMBER])
REFERENCES [dbo].[POS_TrxHeader_POST] ([DOCNUMBER])
GO
ALTER TABLE [dbo].[POS_TrxRefund_POST] CHECK CONSTRAINT [FK_POS_TrxRefundHeaderPOST]
GO
