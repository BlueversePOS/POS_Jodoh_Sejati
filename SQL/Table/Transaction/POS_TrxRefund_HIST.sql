
--ALTER TABLE [dbo].[POS_TrxRefund_HIST] DROP CONSTRAINT [FK_POS_TrxRefundHeaderHIST]
--GO

--ALTER TABLE [dbo].[POS_TrxRefund_HIST] DROP CONSTRAINT [FK_POS_OpenShiftTrxRefundHIST]
--GO

--ALTER TABLE [dbo].[POS_TrxRefund_HIST] DROP CONSTRAINT [FK_POS_CloseShiftTrxRefundHIST]
--GO

--ALTER TABLE [dbo].[POS_TrxRefund_HIST] DROP CONSTRAINT [FK_POS_CashMgmtTrxRefundHIST]
--GO

--ALTER TABLE [dbo].[POS_TrxRefund_HIST] DROP CONSTRAINT [FK_POS_SummShiftTrxRefundHIST]
--GO

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
	Refund_Date DATETIME NOT NULL,
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
	--CONSTRAINT FK_POS_TrxRefundHeaderHIST FOREIGN KEY (DOCNUMBER)
	--REFERENCES POS_TrxHeader_HIST (DOCNUMBER),
	--CONSTRAINT FK_POS_OpenShiftTrxRefundHIST FOREIGN KEY (Batch_ID)
	--REFERENCES POS_OpenShift (Batch_ID),
	--CONSTRAINT FK_POS_CloseShiftTrxRefundHIST FOREIGN KEY (Batch_ID)
	--REFERENCES POS_CloseShift (Batch_ID),
	--CONSTRAINT FK_POS_CashMgmtTrxRefundHIST FOREIGN KEY (Batch_ID)
	--REFERENCES POS_CashManagement (Batch_ID),
	--CONSTRAINT FK_POS_SummShiftTrxRefundHIST FOREIGN KEY (Batch_ID)
	--REFERENCES POS_Summ_OpenCloseShift (Batch_ID)
	--ON DELETE CASCADE
	--ON UPDATE CASCADE
)

/*
DROP TABLE POS_OpenShift
DROP TABLE POS_CloseShift
DROP TABLE POS_CashManagement
DROP TABLE POS_Summ_OpenCloseShift
DROP TABLE POS_TrxHeader_HIST
*/

