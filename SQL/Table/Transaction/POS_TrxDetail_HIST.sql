IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_TrxDetail_HIST]') AND type in (N'U'))
DROP TABLE [dbo].[POS_TrxDetail_HIST]
GO

/****** Object:  Table [dbo].[POS_TrxDetail_HIST]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_TrxDetail_HIST
(
	DOCNUMBER nvarchar(20) NOT NULL, 
	DOCTYPE int NOT NULL,
	DOCDATE DATETIME NOT NULL,
	Lineitmseq int NOT NULL,
	Item_Number nvarchar(20) NOT NULL, 
	Item_Description nvarchar(500) NOT NULL, 
	Quantity numeric(19,5) NOT NULL,
	UofM nvarchar(20) NOT NULL, 
	Item_Price numeric(19,5) NOT NULL,
	Item_Cost numeric(19,5) NOT NULL,
	Store_ID nvarchar(20) NOT NULL, 
	Site_ID nvarchar(20) NOT NULL, 
	SalesType_ID nvarchar(20) NOT NULL, 
	Discount_ID nvarchar(20) NOT NULL, 
	Discount_Amount numeric(19,5) NOT NULL,
	Notes nvarchar(200) NOT NULL, 
	POS_Device_ID nvarchar(20) NOT NULL, 
	POS_Version nvarchar(20) NOT NULL, 
	Created_User nvarchar(30) NOT NULL,
	Created_Date DATETIME NOT NULL,
	Created_time DATETIME,
	Modified_User nvarchar(30) NOT NULL,
	Modified_Date DATETIME NOT NULL,
	Modified_time DATETIME NOT NULL,
	CONSTRAINT PK_POS_TrxDetail_HIST PRIMARY KEY NONCLUSTERED (DOCNUMBER ASC),
	CONSTRAINT FK_POS_TrxHeaderDetailHIST FOREIGN KEY (DOCNUMBER)
	REFERENCES POS_TrxHeader_HIST (DOCNUMBER)
)

