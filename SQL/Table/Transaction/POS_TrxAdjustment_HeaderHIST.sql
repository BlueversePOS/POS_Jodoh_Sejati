IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_TrxAdjustment_HeaderHIST]') AND type in (N'U'))
DROP TABLE [dbo].[POS_TrxAdjustment_HeaderHIST]
GO

/****** Object:  Table [dbo].[POS_TrxAdjustment_HeaderHIST]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_TrxAdjustment_HeaderHIST
(
	DOCNUMBER nvarchar(20) NOT NULL, 
	DOCDATE DATETIME NOT NULL,
	Site_ID nvarchar(20) NOT NULL, 
	Site_Name nvarchar(100) NOT NULL, 
	Reason nvarchar(30) NOT NULL, 
	Total_Line_Item int NOT NULL,
	Notes nvarchar(500) NOT NULL, 
	Created_User nvarchar(30) NOT NULL,
	Created_Date DATETIME NOT NULL,
	Created_time DATETIME NOT NULL
)

/*
DROP TABLE POS_Set_Site
*/