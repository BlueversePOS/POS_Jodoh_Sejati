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