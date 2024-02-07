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

