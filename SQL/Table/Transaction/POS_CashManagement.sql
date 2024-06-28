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
	Pay_ID nvarchar(20) NOT NULL, 
	Type_CashManagement nvarchar(20) NOT NULL,
	Amount numeric(19,5) NOT NULL,
	Notes nvarchar(200) NOT NULL,
	POS_ID nvarchar(20) NOT NULL, 
	Created_User nvarchar(30) NOT NULL,
	Created_Date DATETIME NOT NULL,
	Created_time DATETIME,
	CONSTRAINT PK_POS_CashManagement PRIMARY KEY NONCLUSTERED (Batch_ID ASC, Pay_ID ASC, Type_CashManagement ASC)
)
/*
ALTER TABLE POS_CashManagement
DROP CONSTRAINT PK_POS_CashManagement;
ALTER TABLE POS_CashManagement
ADD CONSTRAINT PK_POS_CashManagement PRIMARY KEY (Batch_ID ASC, Type_CashManagement ASC);
*/