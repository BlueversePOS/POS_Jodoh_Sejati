IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_Set_PayTypes]') AND type in (N'U'))
DROP TABLE [dbo].[POS_Set_PayTypes]
GO

/****** Object:  Table [dbo].[POS_Set_PayTypes]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_Set_PayTypes
(
	Payment_ID nvarchar(20) NOT NULL, 
	Payment_Type nvarchar(100) NOT NULL,
	Payment_Name nvarchar(300) NOT NULL,
	LineItem int NOT NULL,
	AllStore int NOT NULL,
	Store_ID nvarchar(20) NOT NULL, 
	Store_Name nvarchar(100) NOT NULL, 
	Created_User nvarchar(30),
	Created_Date DATETIME,
	Modified_User nvarchar(30),
	Modified_Date DATETIME,
	CONSTRAINT PK_POS_Set_PayTypes PRIMARY KEY NONCLUSTERED (Payment_ID ASC, LineItem ASC),
	CONSTRAINT FK_POS_Set_PayTypes FOREIGN KEY (Store_ID)
	REFERENCES POS_Set_Stores (Store_ID)
	ON DELETE CASCADE
	ON UPDATE CASCADE
)