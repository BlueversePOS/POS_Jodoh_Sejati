create or alter proc Web_AccessRight_SaveData
(
	@UserID nvarchar(20),
	@Role_ID nvarchar(20),
	@Role_Name nvarchar(100),
	@POS_Flag int,
	@POS_AccessPayments int,
	@POS_ApplyDiscount int,
	@POS_ChangeTaxes int,
	@POS_ViewReceipt int,
	@POS_ReprintSendReceipt int,
	@POS_ViewShift int,
	@POS_ManageItemsPOS int,
	@POS_ViewCostPOS int,
	@POS_ChangeSetting int,
	@BckOffice_Flag int,
	@BckOffice_ViewSales int,
	@BckOffice_ManageItemsOff int,
	@BckOffice_ViewCostOff int,
	@BckOffice_ManageEmployee int,
	@BckOffice_ManageCustomers int,
	@BckOffice_EditSetting int,
	@BckOffice_ManagePayTypes int,
	@BckOffice_ManageTaxes int,
	@BckOffice_POSDevices int
)
AS          
BEGIN
	BEGIN TRY
		BEGIN
			IF LEN(ISNULL(@Role_Name,''))=0
			BEGIN
				RAISERROR('Please fill name.',16,1)
			END
		END

		IF EXISTS(SELECT * FROM POS_EmployeeRole WITH(NOLOCK) WHERE RTRIM(Role_ID)=RTRIM(@Role_ID))
		BEGIN
			UPDATE POS_EmployeeRole
			SET Role_Name=@Role_Name, POS_Flag=@POS_Flag, POS_AccessPayments=@POS_AccessPayments, POS_ApplyDiscount=@POS_ApplyDiscount, POS_ChangeTaxes=@POS_ChangeTaxes, 
			POS_ViewReceipt=@POS_ViewReceipt, POS_ReprintSendReceipt=@POS_ReprintSendReceipt, POS_ViewShift=@POS_ViewShift, POS_ManageItemsPOS=@POS_ManageItemsPOS, 
			POS_ViewCostPOS=@POS_ViewCostPOS, POS_ChangeSetting=@POS_ChangeSetting, BckOffice_Flag=@BckOffice_Flag, BckOffice_ViewSales=@BckOffice_ViewSales, 
			BckOffice_ManageItemsOff=@BckOffice_ManageItemsOff, BckOffice_ViewCostOff=@BckOffice_ViewCostOff, BckOffice_ManageEmployee=@BckOffice_ManageEmployee, 
			BckOffice_ManageCustomers=@BckOffice_ManageCustomers, BckOffice_EditSetting=@BckOffice_EditSetting, BckOffice_ManagePayTypes=@BckOffice_ManagePayTypes, 
			BckOffice_ManageTaxes=@BckOffice_ManageTaxes, BckOffice_POSDevices=@BckOffice_POSDevices, Modified_User=@UserID, Modified_Date=CAST(GETDATE() as date)
			WHERE RTRIM(Role_ID)=RTRIM(@Role_ID)
		END
		ELSE
		BEGIN
			declare @p varchar(30)
			EXEC Web_Generate_NumberMaster @TABLE=N'POS_EmployeeRole', @FIELD=N'Role_ID', @DOCID=N'ROLE', @NEWNUMBER=@p output
			SET @Role_ID=@p

			INSERT INTO [POS_EmployeeRole]
			(Role_ID, Role_Name, POS_Flag, POS_AccessPayments, POS_ApplyDiscount, POS_ChangeTaxes, POS_ViewReceipt, POS_ReprintSendReceipt, POS_ViewShift, 
			POS_ManageItemsPOS, POS_ViewCostPOS, POS_ChangeSetting, BckOffice_Flag, BckOffice_ViewSales, BckOffice_ManageItemsOff, BckOffice_ViewCostOff, 
			BckOffice_ManageEmployee, BckOffice_ManageCustomers, BckOffice_EditSetting, BckOffice_ManagePayTypes, BckOffice_ManageTaxes, BckOffice_POSDevices, 
			Created_User, Created_Date, Modified_User, Modified_Date)
			VALUES
			(@Role_ID, @Role_Name, @POS_Flag, @POS_AccessPayments, @POS_ApplyDiscount, @POS_ChangeTaxes, @POS_ViewReceipt, @POS_ReprintSendReceipt, @POS_ViewShift, 
			@POS_ManageItemsPOS, @POS_ViewCostPOS, @POS_ChangeSetting, @BckOffice_Flag, @BckOffice_ViewSales, @BckOffice_ManageItemsOff, @BckOffice_ViewCostOff, 
			@BckOffice_ManageEmployee, @BckOffice_ManageCustomers, @BckOffice_EditSetting, @BckOffice_ManagePayTypes, @BckOffice_ManageTaxes, @BckOffice_POSDevices, 
			@UserID, CAST(GETDATE() as date), '', '')
		END

		DECLARE @LINEITEM int = 0
		SELECT @LINEITEM=MAX(COALESCE(Line_Item, 0)) + 1
		FROM POS_EmployeeRole_History
		WHERE Role_ID=@Role_ID

		INSERT INTO [POS_EmployeeRole_History]
		(Role_ID, Role_Name, Line_Item, POS_Flag, POS_AccessPayments, POS_ApplyDiscount, POS_ChangeTaxes, POS_ViewReceipt, POS_ReprintSendReceipt, POS_ViewShift, 
		POS_ManageItemsPOS, POS_ViewCostPOS, POS_ChangeSetting, BckOffice_Flag, BckOffice_ViewSales, BckOffice_ManageItemsOff, BckOffice_ViewCostOff, 
		BckOffice_ManageEmployee, BckOffice_ManageCustomers, BckOffice_EditSetting, BckOffice_ManagePayTypes, BckOffice_ManageTaxes, BckOffice_POSDevices, Created_User, Created_Date)
		VALUES
		(@Role_ID, @Role_Name, COALESCE(@LINEITEM, 0), @POS_Flag, @POS_AccessPayments, @POS_ApplyDiscount, @POS_ChangeTaxes, @POS_ViewReceipt, @POS_ReprintSendReceipt, @POS_ViewShift, 
		@POS_ManageItemsPOS, @POS_ViewCostPOS, @POS_ChangeSetting, @BckOffice_Flag, @BckOffice_ViewSales, @BckOffice_ManageItemsOff, @BckOffice_ViewCostOff, 
		@BckOffice_ManageEmployee, @BckOffice_ManageCustomers, @BckOffice_EditSetting, @BckOffice_ManagePayTypes, @BckOffice_ManageTaxes, @BckOffice_POSDevices, @UserID, CAST(GETDATE() as date))
			
		SELECT CODE='200', Role_ID=@Role_ID

	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000),@ErrorSeverity INT,@ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState)
	END CATCH
END