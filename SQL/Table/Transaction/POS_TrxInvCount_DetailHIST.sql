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
