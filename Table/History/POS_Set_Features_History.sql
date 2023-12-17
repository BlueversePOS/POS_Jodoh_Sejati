IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_Set_Features_History]') AND type in (N'U'))
DROP TABLE [dbo].[POS_Set_Features_History]
GO

/****** Object:  Table [dbo].[POS_Set_Features_History]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_Set_Features_History
(
	Feature_ID nvarchar(20) NOT NULL,
	Line_Item int NOT NULL,
	Feature_Shift int NOT NULL, 
	Feature_TimeClock int NOT NULL,
	Feature_LowStock int NOT NULL,
	Feature_NegativeStock int NOT NULL,
	Created_User nvarchar(30),
	Created_Date DATETIME,
	CONSTRAINT PK_POS_Set_Features_History PRIMARY KEY NONCLUSTERED (Feature_ID ASC, Line_Item ASC),
)