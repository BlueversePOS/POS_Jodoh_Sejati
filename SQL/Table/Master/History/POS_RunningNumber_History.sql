IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_RunningNumber_History]') AND type in (N'U'))
DROP TABLE [dbo].[POS_RunningNumber_History]
GO

/****** Object:  Table [dbo].[POS_RunningNumber_History]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_RunningNumber_History
(
	DocumentID nvarchar(4) NOT NULL, 
	LineItem int NOT NULL,
	CurrentNumber nvarchar(20) NOT NULL,
	CurrentDate DATETIME NOT NULL,
	CONSTRAINT PK_POS_RunningNumber_History PRIMARY KEY NONCLUSTERED (DocumentID ASC, LineItem ASC)
)