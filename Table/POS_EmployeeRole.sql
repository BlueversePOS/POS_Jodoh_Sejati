IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POS_EmployeeRole]') AND type in (N'U'))
DROP TABLE [dbo].[POS_EmployeeRole]
GO

/****** Object:  Table [dbo].[POS_EmployeeRole]    Script Date: 07/10/2023 23:37:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE POS_EmployeeRole
(
	Role_ID nvarchar(20) NOT NULL,
	Role_Name nvarchar(100) NOT NULL,
	POS_Flag int NOT NULL,
	POS_AccessPayments int NOT NULL,
	POS_ApplyDiscount int NOT NULL,
	POS_ChangeTaxes int NOT NULL,
	POS_ViewReceipt int NOT NULL,
	POS_ReprintSendReceipt int NOT NULL,
	POS_ViewShift int NOT NULL,
	POS_ManageItemsPOS int NOT NULL,
	POS_ViewCostPOS int NOT NULL,
	POS_ChangeSetting int NOT NULL,
	BckOffice_Flag int NOT NULL,
	BckOffice_ViewSales int NOT NULL,
	BckOffice_ManageItemsOff int NOT NULL,
	BckOffice_ViewCostOff int NOT NULL,
	BckOffice_ManageEmployee int NOT NULL,
	BckOffice_ManageCustomers int NOT NULL,
	BckOffice_EditSetting int NOT NULL,
	BckOffice_ManagePayTypes int NOT NULL,
	BckOffice_ManageTaxes int NOT NULL,
	BckOffice_POSDevices int NOT NULL,
	Created_User nvarchar(30),
	Created_Date DATETIME,
	Modified_User nvarchar(30),
	Modified_Date DATETIME,
	CONSTRAINT PK_POS_EmployeeRole PRIMARY KEY NONCLUSTERED (Role_ID)
)