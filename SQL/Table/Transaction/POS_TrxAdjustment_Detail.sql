
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