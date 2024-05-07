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
