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

