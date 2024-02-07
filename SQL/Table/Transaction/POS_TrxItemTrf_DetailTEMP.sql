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
	Source_Stock numeric(19,5) NOT NULL,
	Dest_Stock numeric(19,5) NOT NULL,
	Qty_Transfer numeric(19,5) NOT NULL,
	Created_User nvarchar(30) NOT NULL,
	Created_Date DATETIME NOT NULL,
	Created_time DATETIME NOT NULL,
	Modified_User nvarchar(30) NOT NULL,
	Modified_Date DATETIME NOT NULL,
	Modified_time DATETIME NOT NULL,
	CONSTRAINT PK_POS_TrxItemTrf_DetailTEMP PRIMARY KEY NONCLUSTERED (DOCNUMBER ASC, Item_Number ASC)
)

/*
DROP TABLE POS_Item
*/