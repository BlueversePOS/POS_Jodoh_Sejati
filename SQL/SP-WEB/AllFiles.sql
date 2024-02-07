IF EXISTS(SELECT * FROM SYSOBJECTS WHERE name='TRX_GenerateNumber_Master')
	DROP PROC TRX_GenerateNumber_Master
GO
CREATE proc [dbo].[TRX_GenerateNumber_Master]  
(  
 @DOCID NVARCHAR(30)
)  
AS BEGIN
	BEGIN TRY
		declare @IDMAX INT = 0, @p15 nvarchar(255)=''
		DECLARE @DocNo varchar(max)=''
		DECLARE @CURRENTDATE DATETIME = CAST('2023-12-23' as DATE)
		DECLARE @LineItem int = 10

		IF RTRIM(COALESCE(@DOCID, '')) = ''
		BEGIN
			RAISERROR('Document ID not found.', 16, 1)
		END

		IF NOT EXISTS(select DocumentID from POS_RunningNumber where DocumentID=@DOCID and CAST(CurrentDate as DATE)=CAST(@CURRENTDATE as DATE))
		BEGIN
			SET @IDMAX = @IDMAX + 1
			SET @DocNo = @DOCID + FORMAT(@CURRENTDATE, 'yyMMdd') + REPLICATE('0', 4 - LEN(@IDMAX))+CONVERT(nvarchar(68), @IDMAX)
		END
		ELSE
		BEGIN
			SELECT top 1 @IDMAX=ISNULL(cast(REPLACE(CurrentNumber,@DOCID+FORMAT(@CURRENTDATE, 'yyMMdd'),'') as INT), 0)
			FROM POS_RunningNumber 
			WHERE DocumentID=@DOCID

			SET @IDMAX = @IDMAX + 1

			SET @DocNo = @DOCID + FORMAT(@CURRENTDATE, 'yyMMdd') + REPLICATE('0', 4 - LEN(@IDMAX))+CONVERT(nvarchar(68), @IDMAX)
		END

		IF NOT EXISTS(select DocumentID from POS_RunningNumber where DocumentID=@DOCID)
		BEGIN
			INSERT INTO POS_RunningNumber(DocumentID, CurrentNumber, CurrentDate)
			select @DOCID, @DocNo, @CURRENTDATE
		END
		ELSE
		BEGIN
			UPDATE POS_RunningNumber
			SET CurrentNumber=@DocNo, CurrentDate=@CURRENTDATE
			WHERE DocumentID=@DOCID
		END

		IF NOT EXISTS(select DocumentID from POS_RunningNumber_History where DocumentID=@DOCID)
		BEGIN
			INSERT INTO POS_RunningNumber_History(DocumentID, LineItem, CurrentNumber, CurrentDate)
			select @DOCID, @LineItem, @DocNo, @CURRENTDATE
		END
		ELSE IF NOT EXISTS(select DocumentID from POS_RunningNumber_History where DocumentID=@DOCID and CAST(CurrentDate as DATE)=CAST(@CURRENTDATE as DATE))
		BEGIN
			SELECT @LineItem=ISNULL(MAX(LineItem), 0) + 10
			from POS_RunningNumber_History where DocumentID=@DOCID

			INSERT INTO POS_RunningNumber_History(DocumentID, LineItem, CurrentNumber, CurrentDate)
			select @DOCID, @LineItem, @DocNo, @CURRENTDATE
		END
		ELSE IF EXISTS(select DocumentID from POS_RunningNumber_History where DocumentID=@DOCID)
		BEGIN
			UPDATE POS_RunningNumber_History
			SET CurrentNumber=@DocNo
			WHERE DocumentID=@DOCID
		END

		select @DocNo as GENNUMBER
	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000)
		DECLARE @ErrorSeverity INT
		DECLARE @ErrorState INT

		SELECT @ErrorMessage = ERROR_MESSAGE(),
			   @ErrorSeverity = ERROR_SEVERITY(),
			   @ErrorState = ERROR_STATE()

		RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState)
		select @ErrorMessage as output
	END CATCH 
END  
GO
/*  
begin tran
exec TRX_GenerateNumber_Master @DOCID=N'INV'
select * from POS_RunningNumber
select * from POS_RunningNumber_History
rollback
*/
CREATE OR ALTER proc [dbo].[Web_AccessRight_Getdatadetail]
(
	@Role_ID nvarchar(20)
)
AS
BEGIN
	BEGIN TRY
		SELECT *
		FROM POS_EmployeeRole
		WHERE Role_ID=@Role_ID
	END TRY
	BEGIN	CATCH
			DECLARE @ErrorMessage NVARCHAR(4000)
			DECLARE @ErrorSeverity INT
			DECLARE @ErrorState INT

			SELECT @ErrorMessage = ERROR_MESSAGE(),
				@ErrorSeverity = ERROR_SEVERITY(),
				@ErrorState = ERROR_STATE()

			RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState)
	END CATCH
END
GO
/*
EXEC Web_AccessRight_Getdatadetail ''
*/
CREATE OR ALTER proc [dbo].[Web_AccessRight_Getdatalist]
AS
BEGIN
	BEGIN TRY
		SELECT A.Role_ID, A.Role_Name, 
		CASE 
		WHEN A.BckOffice_Flag = 1 and A.POS_Flag = 1
		THEN 'Back Office and POS' 
		WHEN A.BckOffice_Flag = 1 and A.POS_Flag = 0
		THEN 'Back Office' 
		WHEN A.BckOffice_Flag = 0 and A.POS_Flag = 1
		THEN 'POS' 
		ELSE '' END Access, ISNULL(B.Access_Employee, 0) Access_Employee
		FROM POS_EmployeeRole A
		LEFT JOIN(
			select Role_ID, COUNT(Role_ID) Access_Employee from POS_Employee
			group by Role_ID
		) B ON A.Role_ID=B.Role_ID
		ORDER BY A.Role_Name asc
	END TRY
	BEGIN	CATCH
			DECLARE @ErrorMessage NVARCHAR(4000)
			DECLARE @ErrorSeverity INT
			DECLARE @ErrorState INT

			SELECT @ErrorMessage = ERROR_MESSAGE(),
				@ErrorSeverity = ERROR_SEVERITY(),
				@ErrorState = ERROR_STATE()

			RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState)
	END CATCH
END
GO
/*
EXEC Web_AccessRight_Getdatalist
*/
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
GO
CREATE OR ALTER proc [dbo].[Web_Account_GetData]
(
	@UserID nvarchar(20)
)
AS
BEGIN
	BEGIN TRY
		SELECT TOP 1 *
		FROM POS_Account
		WHERE UserID=@UserID
	END TRY
	BEGIN	CATCH
			DECLARE @ErrorMessage NVARCHAR(4000)
			DECLARE @ErrorSeverity INT
			DECLARE @ErrorState INT

			SELECT @ErrorMessage = ERROR_MESSAGE(),
				@ErrorSeverity = ERROR_SEVERITY(),
				@ErrorState = ERROR_STATE()

			RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState)
	END CATCH
END
GO
/*
EXEC Web_Account_GetData
*/
create or alter proc Web_Account_SaveData
(
	@UserID nvarchar(20),
	@EmailAddress nvarchar(100),
	@PASSWORD nvarchar(100),
	@Business_Name nvarchar(100),
	@Currency nvarchar(30),
	@Timezone nvarchar(100)
)
AS          
BEGIN
	BEGIN TRY
		BEGIN
			IF(LEN(ISNULL(@EmailAddress,''))=0)
			BEGIN
				RAISERROR('Please enter your email address.',16,1)
			END
			IF(LEN(ISNULL(@PASSWORD,''))=0)
			BEGIN
				RAISERROR('Please enter your password.',16,1)
			END
			IF(LEN(ISNULL(@Business_Name,''))=0)
			BEGIN
				RAISERROR('Please enter your business name.',16,1)
			END
		END

		IF EXISTS(SELECT * FROM POS_Account WITH(NOLOCK) WHERE RTRIM(EmailAddress)=RTRIM(@EmailAddress) and UserID<>@UserID)
		BEGIN
			RAISERROR ('An account already exists with this email address',16,1)
		END
		ELSE IF EXISTS(SELECT * FROM POS_Account WITH(NOLOCK) WHERE UserID=@UserID)
		BEGIN
			UPDATE POS_Account
			SET EmailAddress=@EmailAddress, [Password]=@PASSWORD, Business_Name=@Business_Name, CurrencyID=@Currency, Currency=@Currency, 
			Timezone=@Timezone, Modified_User=@EmailAddress, Modified_Date=DATEADD(HOUR,1,GETDATE())
			WHERE UserID=@UserID
			
			UPDATE POS_LoginUser
			SET EmailAddress=@EmailAddress, [PASSWORD]=@PASSWORD, Business_Name=@Business_Name, Currency=@Currency,
				Modified_User=@EmailAddress, Modified_Date=DATEADD(HOUR,1,GETDATE())
			WHERE UserID=@UserID
		END
		ELSE
		BEGIN
			RAISERROR('Your account is not registered yet.',16,1)
		END

		DECLARE @LINEITEM int = 0
		SELECT @LINEITEM=MAX(COALESCE(Line_Item, 0)) + 1
		FROM POS_Account_History
		WHERE UserID=@UserID

		INSERT INTO [POS_Account_History]
		(UserID, Line_Item, Business_Name, EmailAddress, [Password], CurrencyID, Currency, Timezone, Created_User, Created_Date)
		VALUES
		(@UserID, COALESCE(@LINEITEM, 0), RTRIM(@Business_Name), RTRIM(@EmailAddress), RTRIM(@PASSWORD), RTRIM(@Currency), RTRIM(@Currency), RTRIM(@Timezone), RTRIM(@EmailAddress), DATEADD(HOUR,1,GETDATE()))
			
		SELECT CODE='200', EmailAddress=@EmailAddress

	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000),@ErrorSeverity INT,@ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState)
	END CATCH
END
GO
CREATE OR ALTER proc [dbo].[Web_Categories_GetData]
AS
BEGIN
	BEGIN TRY
		SELECT *, 0 ITEM_COUNT
		FROM POS_CategoryItem
		ORDER BY Category_Name asc
	END TRY
	BEGIN	CATCH
			DECLARE @ErrorMessage NVARCHAR(4000)
			DECLARE @ErrorSeverity INT
			DECLARE @ErrorState INT

			SELECT @ErrorMessage = ERROR_MESSAGE(),
				@ErrorSeverity = ERROR_SEVERITY(),
				@ErrorState = ERROR_STATE()

			RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState)
	END CATCH
END
GO
/*
EXEC Web_Categories_GetData
*/
create or alter proc Web_Categories_SaveData
(
	@UserID nvarchar(20),
	@Category_ID nvarchar(20),
	@Category_Name nvarchar(250),
	@Category_Color nvarchar(20)
)
AS          
BEGIN
	BEGIN TRY
		BEGIN
			IF LEN(ISNULL(@Category_Name,''))=0
			BEGIN
				RAISERROR('Please fill category name.',16,1)
			END
			IF LEN(ISNULL(@Category_Color,''))=0
			BEGIN
				RAISERROR('Please choose category color.',16,1)
			END
		END

		IF EXISTS(SELECT * FROM POS_CategoryItem WITH(NOLOCK) WHERE RTRIM(Category_ID)=RTRIM(@Category_ID))
		BEGIN
			UPDATE POS_CategoryItem
			SET Category_Name=@Category_Name, Category_Color=@Category_Color, Modified_User=@UserID, Modified_Date=DATEADD(HOUR,1,GETDATE())
			WHERE RTRIM(Category_ID)=RTRIM(@Category_ID)
		END
		ELSE
		BEGIN
			declare @p varchar(30)
			EXEC Web_Generate_NumberMaster @TABLE=N'POS_CategoryItem', @FIELD=N'Category_ID', @DOCID=N'CAT', @NEWNUMBER=@p output
			SET @Category_ID=@p

			INSERT INTO [POS_CategoryItem]
			(Category_ID, Category_Name, Category_Color, Created_User, Created_Date, Modified_User, Modified_Date)
			VALUES
			(@Category_ID, @Category_Name, @Category_Color, @UserID, DATEADD(HOUR,1,GETDATE()), '', '')
		END

		DECLARE @LINEITEM int = 0
		SELECT @LINEITEM=MAX(COALESCE(Line_Item, 0)) + 1
		FROM POS_CategoryItem_History
		WHERE Category_ID=@Category_ID

		INSERT INTO [POS_CategoryItem_History]
		(Category_ID, Line_Item, Category_Name, Category_Color, Created_User, Created_Date)
		VALUES
		(@Category_ID, COALESCE(@LINEITEM, 0), @Category_Name, @Category_Color, @UserID, DATEADD(HOUR,1,GETDATE()))
			
		SELECT CODE='200', Category_Name=@Category_Name

	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000),@ErrorSeverity INT,@ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState)
	END CATCH
END
GO
CREATE OR ALTER proc [dbo].[Web_Customer_GetData]
AS
BEGIN
	BEGIN TRY
		SELECT *
		FROM POS_Customer
		ORDER BY Customer_Name asc
	END TRY
	BEGIN	CATCH
			DECLARE @ErrorMessage NVARCHAR(4000)
			DECLARE @ErrorSeverity INT
			DECLARE @ErrorState INT

			SELECT @ErrorMessage = ERROR_MESSAGE(),
				@ErrorSeverity = ERROR_SEVERITY(),
				@ErrorState = ERROR_STATE()

			RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState)
	END CATCH
END
GO
/*
exec Web_Customer_GetData
*/
CREATE OR ALTER proc [dbo].[Web_Customer_GetDataDetail]
(
@Customer_ID nvarchar(20),
@Customer_Code nvarchar(20)
)
AS
BEGIN
	BEGIN TRY
		SELECT *
		FROM POS_Customer
		WHERE Customer_ID=@Customer_ID and Customer_Code=@Customer_Code
		ORDER BY Customer_Name asc
	END TRY
	BEGIN	CATCH
			DECLARE @ErrorMessage NVARCHAR(4000)
			DECLARE @ErrorSeverity INT
			DECLARE @ErrorState INT

			SELECT @ErrorMessage = ERROR_MESSAGE(),
				@ErrorSeverity = ERROR_SEVERITY(),
				@ErrorState = ERROR_STATE()

			RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState)
	END CATCH
END
GO
/*
exec Web_Customer_GetDataDetail @Customer_ID=N'',@Customer_Code=N''
*/
create or alter proc Web_Customer_SaveData
(
	@UserID nvarchar(20),
	@Customer_ID nvarchar(20), 
	@Customer_Name nvarchar(250),
	@Email nvarchar(250),
	@Phone nvarchar(20),
	@Address nvarchar(300),
	@Country nvarchar(100),
	@Province nvarchar(100),
	@City nvarchar(100),
	@Postal_Code nvarchar(10),
	@Customer_Code nvarchar(20),
	@Note nvarchar(255)
)
AS          
BEGIN
	BEGIN TRY
		BEGIN
			IF LEN(ISNULL(@Customer_Name,''))=0
			BEGIN
				RAISERROR('Please fill name.',16,1)
			END
			IF LEN(ISNULL(@Email,''))=0
			BEGIN
				RAISERROR('Please fill email.',16,1)
			END
			IF LEN(ISNULL(@Address,''))=0
			BEGIN
				RAISERROR('Please fill address.',16,1)
			END
			IF LEN(ISNULL(@Postal_Code,''))=0
			BEGIN
				RAISERROR('Please fill postal code.',16,1)
			END
			IF LEN(ISNULL(@Customer_Code,''))=0
			BEGIN
				RAISERROR('Please fill customer code.',16,1)
			END
		END

		IF EXISTS(SELECT * FROM POS_Customer WITH(NOLOCK) WHERE RTRIM(Customer_ID)=RTRIM(@Customer_ID) and RTRIM(Customer_Code)=RTRIM(@Customer_Code))
		BEGIN
			UPDATE POS_Customer
			SET Customer_Name=@Customer_Name, Email=@Email, Phone=@Phone, Address=@Address, Country=@Country, Province=@Province, 
			City=@City, Postal_Code=@Postal_Code, Note=@Note, Modified_User=@UserID, Modified_Date=CAST(GETDATE() as date)
			WHERE RTRIM(Customer_ID)=RTRIM(@Customer_ID) and RTRIM(Customer_Code)=RTRIM(@Customer_Code)
		END
		ELSE
		BEGIN
			declare @p varchar(30)
			EXEC Web_Generate_NumberMaster @TABLE=N'POS_Customer', @FIELD=N'Customer_ID', @DOCID=N'CUST', @NEWNUMBER=@p output
			SET @Customer_ID=@p

			INSERT INTO [POS_Customer]
			(Customer_ID, Customer_Name, Email, Phone, Address, Country, Province, City, Postal_Code, Customer_Code, Note, Created_User, Created_Date, Modified_User, Modified_Date)
			VALUES
			(@Customer_ID, @Customer_Name, @Email, @Phone, @Address, @Country, @Province, @City, @Postal_Code, @Customer_Code, @Note, @UserID, CAST(GETDATE() as date), '', '')
		END

		DECLARE @LINEITEM int = 0
		SELECT @LINEITEM=MAX(COALESCE(Line_Item, 0)) + 1
		FROM POS_Customer_History
		WHERE Customer_ID=@Customer_ID

		INSERT INTO [POS_Customer_History]
		(Customer_ID, Customer_Name, Line_Item, Email, Phone, Address, Country, Province, City, Postal_Code, Customer_Code, Note, Created_User, Created_Date)
		VALUES
		(@Customer_ID, @Customer_Name, COALESCE(@LINEITEM, 0), @Email, @Phone, @Address, @Country, @Province, @City, @Postal_Code, @Customer_Code, @Note, @UserID, CAST(GETDATE() as date))
			
		SELECT CODE='200', Customer_Name=@Customer_Name

	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000),@ErrorSeverity INT,@ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState)
	END CATCH
END
GO
/*
begin tran
exec Web_Customer_SaveData @UserID=N'USER1',@Customer_ID=N'',@Customer_Name=N'Test Customer',@Email=N'testcust@amail.com',
@Phone=N'089765467873',@Address=N'dimana bae',@Country=N'',@Province=N'',@City=N'',@Postal_Code=N'17125',@Customer_Code=N'CUST001',@Note=N''
rollback
*/
CREATE OR ALTER proc [dbo].[Web_Discounts_GetData]
AS
BEGIN
	BEGIN TRY
		SELECT *
		FROM POS_Discount
		ORDER BY Discount_Name asc
	END TRY
	BEGIN	CATCH
			DECLARE @ErrorMessage NVARCHAR(4000)
			DECLARE @ErrorSeverity INT
			DECLARE @ErrorState INT

			SELECT @ErrorMessage = ERROR_MESSAGE(),
				@ErrorSeverity = ERROR_SEVERITY(),
				@ErrorState = ERROR_STATE()

			RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState)
	END CATCH
END
GO
/*
EXEC Web_Discounts_GetData
*/
create or alter proc Web_Discounts_SaveData
(
	@UserID nvarchar(20),
	@Discount_ID nvarchar(30),
	@Discount_Name nvarchar(100),
	@Discount_Type int,
	@Discount_Value numeric(19,5),
	@Restricted_Access int
)
AS          
BEGIN
	BEGIN TRY
		BEGIN
			IF LEN(ISNULL(@Discount_Name,''))=0
			BEGIN
				RAISERROR('Please fill discount name.',16,1)
			END
			IF ISNULL(@Discount_Type,0)=0
			BEGIN
				RAISERROR('Please choose discount type.',16,1)
			END
			IF LEN(ISNULL(@Discount_Value,''))=0
			BEGIN
				RAISERROR('Please fill discount value.',16,1)
			END
		END

		IF EXISTS(SELECT * FROM POS_Discount WITH(NOLOCK) WHERE RTRIM(Discount_ID)=RTRIM(@Discount_ID))
		BEGIN
			UPDATE POS_Discount
			SET Discount_Name=@Discount_Name, Discount_Type=@Discount_Type, Discount_Value=@Discount_Value, 
			Restricted_Access=@Restricted_Access, Modified_User=@UserID, Modified_Date=DATEADD(HOUR,1,GETDATE())
			WHERE RTRIM(Discount_ID)=RTRIM(@Discount_ID)
		END
		ELSE
		BEGIN
			declare @p varchar(30)
			EXEC Web_Generate_NumberMaster @TABLE=N'POS_Discount', @FIELD=N'Discount_ID', @DOCID=N'DISC', @NEWNUMBER=@p output
			SET @Discount_ID=@p

			INSERT INTO [POS_Discount]
			(Discount_ID, Discount_Name, Discount_Type, Discount_Value, Restricted_Access, Created_User, Created_Date, Modified_User, Modified_Date)
			VALUES
			(@Discount_ID, @Discount_Name, @Discount_Type, @Discount_Value, @Restricted_Access, @UserID, DATEADD(HOUR,1,GETDATE()), '', '')
		END

		DECLARE @LINEITEM int = 0
		SELECT @LINEITEM=MAX(COALESCE(Line_Item, 0)) + 1
		FROM POS_Discount_History
		WHERE Discount_ID=@Discount_ID

		INSERT INTO [POS_Discount_History]
		(Discount_ID, Discount_Name, Line_Item, Discount_Type, Discount_Value, Restricted_Access, Created_User, Created_Date)
		VALUES
		(@Discount_ID, @Discount_Name, COALESCE(@LINEITEM, 0), @Discount_Type, @Discount_Value, @Restricted_Access, @UserID, DATEADD(HOUR,1,GETDATE()))
			
		SELECT CODE='200', Discount_Name=@Discount_Name

	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000),@ErrorSeverity INT,@ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState)
	END CATCH
END
GO
CREATE OR ALTER proc [dbo].[Web_Employee_Getdata]
(
	@Employee_ID nvarchar(20)
)
AS
BEGIN
	BEGIN TRY
		SELECT A.*, COALESCE(B.Role_Name, '') Role_Name
		FROM POS_Employee A
		LEFT JOIN POS_EmployeeRole B ON A.Role_ID=B.Role_ID
		WHERE A.Employee_ID=@Employee_ID or @Employee_ID = ''
	END TRY
	BEGIN	CATCH
			DECLARE @ErrorMessage NVARCHAR(4000)
			DECLARE @ErrorSeverity INT
			DECLARE @ErrorState INT

			SELECT @ErrorMessage = ERROR_MESSAGE(),
				@ErrorSeverity = ERROR_SEVERITY(),
				@ErrorState = ERROR_STATE()

			RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState)
	END CATCH
END
GO
/*
EXEC Web_Employee_Getdat ''
*/
create or alter proc Web_Employee_SaveData
(
	@UserID nvarchar(20),
	@Employee_ID nvarchar(20),
	@Employee_Name nvarchar(250),
	@Email nvarchar(250),
	@Phone nvarchar(20),
	@Role_ID nvarchar(20)
)
AS          
BEGIN
	BEGIN TRY
		BEGIN
			IF LEN(ISNULL(@Employee_Name,''))=0
			BEGIN
				RAISERROR('Please fill name.',16,1)
			END
			IF LEN(ISNULL(@Email,''))=0
			BEGIN
				RAISERROR('Please fill email.',16,1)
			END
			IF LEN(ISNULL(@Role_ID,''))=0
			BEGIN
				RAISERROR('Please choose role.',16,1)
			END
		END

		IF EXISTS(SELECT * FROM POS_Employee WITH(NOLOCK) WHERE RTRIM(Employee_ID)=RTRIM(@Employee_ID))
		BEGIN
			UPDATE POS_Employee
			SET Employee_Name=@Employee_Name, Email=@Email, Phone=@Phone, Role_ID=@Role_ID, Modified_User=@UserID, Modified_Date=CAST(GETDATE() as date)
			WHERE RTRIM(Employee_ID)=RTRIM(@Employee_ID)
		END
		ELSE
		BEGIN
			declare @p varchar(30)
			EXEC Web_Generate_NumberMaster @TABLE=N'POS_Employee', @FIELD=N'Employee_ID', @DOCID=N'EMP', @NEWNUMBER=@p output
			SET @Employee_ID=@p

			INSERT INTO [POS_Employee]
			(Employee_ID, Employee_Name, Email, Phone, Role_ID, Created_User, Created_Date, Modified_User, Modified_Date)
			VALUES
			(@Employee_ID, @Employee_Name, @Email, @Phone, @Role_ID, @UserID, CAST(GETDATE() as date), '', '')
		END

		DECLARE @LINEITEM int = 0
		SELECT @LINEITEM=MAX(COALESCE(Line_Item, 0)) + 1
		FROM POS_Employee_History
		WHERE Employee_ID=@Employee_ID

		INSERT INTO [POS_Employee_History]
		(Employee_ID, Line_Item, Employee_Name, Email, Phone, Role_ID, Created_User, Created_Date)
		VALUES
		(@Employee_ID, COALESCE(@LINEITEM, 0), @Employee_Name, @Email, @Phone, @Role_ID, @UserID, CAST(GETDATE() as date))
			
		SELECT CODE='200', Employee_ID=@Employee_ID

	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000),@ErrorSeverity INT,@ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState)
	END CATCH
END
GO
IF EXISTS(SELECT * FROM SYSOBJECTS WHERE name='Web_Generate_NumberMaster')
	DROP PROC Web_Generate_NumberMaster
GO
CREATE proc [dbo].[Web_Generate_NumberMaster]  
(  
 @TABLE NVARCHAR(30),
 @FIELD NVARCHAR(30),
 @DOCID NVARCHAR(30),
 @NEWNUMBER VARCHAR(30) OUTPUT
)  
AS BEGIN  
 DECLARE @QUERY VARCHAR(MAX) = ''  
 
	 IF @DOCID != ''
	 begin
		 SET @QUERY = 'declare @IDMAX INT = 0, @p15 nvarchar(255)='''', @NEWDOC nvarchar(30)='''+@DOCID+'''
  
		SELECT top 1 @IDMAX= cast(REPLACE('+@FIELD+',@NEWDOC,'''') as INT)     
		FROM '+@TABLE+' 
		order by '+@FIELD+' DESC  
  
		SET @IDMAX= @IDMAX + 1

		IF @IDMAX = 9999
		BEGIN
			SET @IDMAX = 0
		
			SET @NEWDOC = @NEWDOC + ''2-''

			SELECT top 1 @IDMAX= cast(REPLACE('+@FIELD+',@NEWDOC,'''') as INT)     
			FROM '+@TABLE+'  
			order by '+@FIELD+' DESC  
  
			SET @IDMAX= @IDMAX + 1
		END

		DECLARE @DocNo varchar(max)='''' 
		SET @DocNo = @NEWDOC + REPLICATE(''0'', 4 - LEN(@IDMAX))+CONVERT(nvarchar(68), @IDMAX)
    
		select @DocNo as NEWNUMBER'
	 end

	 declare @t table (NEWNUMBER varchar(50))  
	 insert into @t  
	 EXEC(@QUERY)  
  
	 SELECT @NEWNUMBER = NEWNUMBER from @t  
	 return   
END  
GO
/*  
  
exec Web_Generate_NumberMaster @TABLE=N'POS_Discount', @FIELD=N'Discount_ID', @DOCID=N'DISC'
  
*/
CREATE OR ALTER proc [dbo].[Web_Items_GetDataComposite]
(
@Item_Number nvarchar(20)
)
AS
BEGIN
	BEGIN TRY
		SELECT *
		FROM POS_Item
		WHERE RTRIM(Item_Number) <> RTRIM(@Item_Number)
		ORDER BY Item_Number asc
	END TRY
	BEGIN	CATCH
			DECLARE @ErrorMessage NVARCHAR(4000)
			DECLARE @ErrorSeverity INT
			DECLARE @ErrorState INT

			SELECT @ErrorMessage = ERROR_MESSAGE(),
				@ErrorSeverity = ERROR_SEVERITY(),
				@ErrorState = ERROR_STATE()

			RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState)
	END CATCH
END
GO
/*
EXEC Web_Items_GetDataComposite
*/
CREATE OR ALTER proc [dbo].[Web_Items_GetDataList]
(
@Item_Number nvarchar(20),
@Category_ID nvarchar(20),
@StockAlert int
)
AS
BEGIN
	BEGIN TRY
		SELECT A.*, COALESCE(B.Category_Name, '') Category_Name
		FROM POS_Item A
		LEFT JOIN POS_CategoryItem B ON A.Category_ID=B.Category_ID
		WHERE 1=1
		and (CASE WHEN LEN(RTRIM(@Item_Number)) > 0 THEN A.Item_Number ELSE '' END = 
		CASE WHEN LEN(RTRIM(@Item_Number)) > 0 THEN @Item_Number ELSE '' END
		and CASE WHEN LEN(RTRIM(@Category_ID)) > 0 THEN A.Category_ID ELSE '' END = 
		CASE WHEN LEN(RTRIM(@Category_ID)) > 0 THEN @Category_ID ELSE '' END
		and CASE WHEN @StockAlert > 0 THEN A.LowStock ELSE 0 END = 
		CASE WHEN @StockAlert > 0 THEN @StockAlert ELSE 0 END)
		ORDER BY Item_Number asc
	END TRY
	BEGIN	CATCH
			DECLARE @ErrorMessage NVARCHAR(4000)
			DECLARE @ErrorSeverity INT
			DECLARE @ErrorState INT

			SELECT @ErrorMessage = ERROR_MESSAGE(),
				@ErrorSeverity = ERROR_SEVERITY(),
				@ErrorState = ERROR_STATE()

			RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState)
	END CATCH
END
GO
/*
EXEC Web_Items_GetDataList '', '', 0
*/
CREATE OR ALTER proc [dbo].[Web_Items_GetItemComposite]
(
@Item_Number nvarchar(20)
)
AS
BEGIN
	BEGIN TRY
		SELECT *
		FROM POS_CompositeItem
		WHERE RTRIM(Item_Number) <> RTRIM(@Item_Number)
		ORDER BY Item_Number asc
	END TRY
	BEGIN	CATCH
			DECLARE @ErrorMessage NVARCHAR(4000)
			DECLARE @ErrorSeverity INT
			DECLARE @ErrorState INT

			SELECT @ErrorMessage = ERROR_MESSAGE(),
				@ErrorSeverity = ERROR_SEVERITY(),
				@ErrorState = ERROR_STATE()

			RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState)
	END CATCH
END
GO
/*
EXEC Web_Items_GetItemComposite
*/
CREATE OR ALTER proc [dbo].[Web_Items_GetItemVariant]
(
@Item_Number nvarchar(20)
)
AS
BEGIN
	BEGIN TRY
		SELECT *
		FROM POS_ItemVariant
		WHERE RTRIM(Item_Number) = RTRIM(@Item_Number)
		ORDER BY Item_Number asc
	END TRY
	BEGIN	CATCH
			DECLARE @ErrorMessage NVARCHAR(4000)
			DECLARE @ErrorSeverity INT
			DECLARE @ErrorState INT

			SELECT @ErrorMessage = ERROR_MESSAGE(),
				@ErrorSeverity = ERROR_SEVERITY(),
				@ErrorState = ERROR_STATE()

			RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState)
	END CATCH
END
GO
/*
EXEC Web_Items_GetItemVariant
*/
create or alter proc Web_Items_SaveData
(
	@UserID nvarchar(20),
	@Item_Number nvarchar(20),
	@Item_Name nvarchar(20),
	@Item_Description nvarchar(250),
	@UOFM nvarchar(30),
	@Category_ID nvarchar(20),
	@Item_Sales int,
	@Item_SoldBy int,
	@Item_Price numeric(19,5),
	@Item_Cost numeric(19,5),
	@Item_SKU nvarchar(10),
	@Item_Barcode nvarchar(MAX),
	@Composite_Item int,
	@Track_Stock int,
	@InStock int,
	@LowStock int,
	@Tax_10 nvarchar(20),
	@Representation int,
	@Item_Color nvarchar(50),
	@Item_Shape nvarchar(50),
	@Item_Image nvarchar(MAX),
	@COMPTYPE COMPTYPE readonly,
	@VARTYPE VARTYPE readonly
)
AS          
BEGIN
	BEGIN TRY
		BEGIN
			IF LEN(ISNULL(@Item_Name,''))=0
			BEGIN
				RAISERROR('Please fill item name.',16,1)
			END
			IF LEN(ISNULL(@Item_Description,''))=0
			BEGIN
				RAISERROR('Please fill item description.',16,1)
			END
			IF LEN(ISNULL(@Category_ID,''))=0
			BEGIN
				RAISERROR('Please choose category.',16,1)
			END
		END

		IF EXISTS(SELECT * FROM POS_Item WITH(NOLOCK) WHERE RTRIM(Item_Number)=RTRIM(@Item_Number))
		BEGIN
			UPDATE POS_Item
			SET Item_Name=@Item_Name, Item_Description=@Item_Description, UOFM=@UOFM, Category_ID=@Category_ID, Item_Sales=@Item_Sales, Item_SoldBy=@Item_SoldBy, 
			Item_Price=@Item_Price, Item_Cost=@Item_Cost, Item_SKU=@Item_SKU, Item_Barcode=@Item_Barcode, Composite_Item=@Composite_Item, 
			Track_Stock=@Track_Stock, InStock=@InStock, LowStock=@LowStock, Tax_10=@Tax_10, Representation=@Representation, Item_Color=@Item_Color, 
			Item_Shape=@Item_Shape, Item_Image=@Item_Image, Modified_User=@UserID, Modified_Date=DATEADD(HOUR,1,GETDATE())
			WHERE RTRIM(Item_Number)=RTRIM(@Item_Number)
		END
		ELSE
		BEGIN
			declare @p varchar(30)
			EXEC Web_Generate_NumberMaster @TABLE=N'POS_Item', @FIELD=N'Item_Number', @DOCID=N'ITM', @NEWNUMBER=@p output
			SET @Item_Number=@p

			INSERT INTO [POS_Item]
			(Item_Number, Item_Name, Item_Description, UOFM, Category_ID, Item_Sales, Item_SoldBy, Item_Price, Item_Cost, 
			Item_SKU, Item_Barcode, Composite_Item, Track_Stock, InStock, LowStock, Tax_10, Representation, Item_Color, 
			Item_Shape, Item_Image, Created_User, Created_Date, Modified_User, Modified_Date)
			VALUES
			(@Item_Number, @Item_Name, @Item_Description, @UOFM, @Category_ID, @Item_Sales, @Item_SoldBy, @Item_Price, @Item_Cost, 
			@Item_SKU, @Item_Barcode, @Composite_Item, @Track_Stock, @InStock, @LowStock, @Tax_10, @Representation, @Item_Color, 
			@Item_Shape, @Item_Image, @UserID, DATEADD(HOUR,1,GETDATE()), '', '')
		END

		DECLARE @LINEITEM int = 0
		SELECT @LINEITEM=MAX(COALESCE(Line_Item, 0)) + 1
		FROM POS_Item_History
		WHERE Category_ID=@Category_ID

		INSERT INTO [POS_Item_History]
		(Item_Number, Item_Name, Item_Description, Line_Item, UOFM, Category_ID, Item_Sales, Item_SoldBy, Item_Price, Item_Cost, 
		Item_SKU, Item_Barcode, Composite_Item, Track_Stock, InStock, LowStock, Tax_10, Representation, Item_Color, 
		Item_Shape, Item_Image, Created_User, Created_Date)
		VALUES
		(@Item_Number, @Item_Name, @Item_Description, COALESCE(@LINEITEM, 0), @UOFM, @Category_ID, @Item_Sales, @Item_SoldBy, @Item_Price, @Item_Cost, 
		@Item_SKU, @Item_Barcode, @Composite_Item, @Track_Stock, @InStock, @LowStock, @Tax_10, @Representation, @Item_Color, 
		@Item_Shape, @Item_Image, @UserID, DATEADD(HOUR,1,GETDATE()))

		DELETE FROM POS_CompositeItem
		WHERE Item_Number=@Item_Number

		INSERT INTO POS_CompositeItem(Item_Number, Item_Quantity, Item_Cost, Item_Composite, Created_User, Created_Date, Modified_User, Modified_Date)
		SELECT @Item_Number, Item_Quantity, Item_Cost, Item_Composite, @UserID, DATEADD(HOUR,1,GETDATE()), @UserID, DATEADD(HOUR,1,GETDATE())
		FROM @COMPTYPE --WHERE Item_Number=@Item_Number

		INSERT INTO POS_CompositeItem_History(Item_Number, Line_Item, Item_Quantity, Item_Cost, Item_Composite, Created_User, Created_Date)
		SELECT @Item_Number, ROW_NUMBER() OVER(ORDER BY Item_Number), Item_Quantity, Item_Cost, Item_Composite, @UserID, DATEADD(HOUR,1,GETDATE())
		FROM @COMPTYPE --WHERE Item_Number=@Item_Number

		DELETE FROM POS_ItemVariant
		WHERE Item_Number=@Item_Number

		INSERT INTO POS_ItemVariant(Item_Number, LineItem_Option, CB_Available, Option_ID, Option_Name, LineItem_Variant, Variant_Name, 
		Item_Price, Item_Cost, InStock, LowStock, OptimalStock, Item_SKU, Item_Barcode, Created_User, Created_Date, Modified_User, Modified_Date)
		SELECT @Item_Number, LineItem_Option, CB_Available, Option_ID, Option_Name, LineItem_Variant, Variant_Name, 
		Item_Price, Item_Cost, InStock, LowStock, OptimalStock, Item_SKU, Item_Barcode, @UserID, DATEADD(HOUR,1,GETDATE()), @UserID, DATEADD(HOUR,1,GETDATE())
		FROM @VARTYPE --WHERE Item_Number=@Item_Number

		INSERT INTO POS_ItemVariant_History(Item_Number, LineItem_Option, Line_Item, CB_Available, Option_ID, Option_Name, LineItem_Variant, Variant_Name, 
		Item_Price, Item_Cost, InStock, LowStock, OptimalStock, Item_SKU, Item_Barcode, Created_User, Created_Date)
		SELECT @Item_Number, LineItem_Option, ROW_NUMBER() OVER(ORDER BY Item_Number), CB_Available, Option_ID, Option_Name, LineItem_Variant, Variant_Name, 
		Item_Price, Item_Cost, InStock, LowStock, OptimalStock, Item_SKU, Item_Barcode, @UserID, DATEADD(HOUR,1,GETDATE())
		FROM @VARTYPE --WHERE Item_Number=@Item_Number
			
		SELECT CODE='200', Item_Number=@Item_Number

	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000),@ErrorSeverity INT,@ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState)
	END CATCH
END
GO
/*
declare @p22 dbo.COMPTYPE

declare @p23 dbo.VARTYPE

exec Web_Items_SaveData @UserID=N'USER1',@Item_Number=N'',@Item_Name=N'Item Kopsus',@Item_Description=N'Item Kopi Susu',@UOFM=N'',
@Category_ID=N'CAT0001',@Item_Sales=1,@Item_SoldBy=0,@Item_Price=25000.0,@Item_Cost=18000.0,@Item_SKU=N'000001',@Item_Barcode=N'',
@Composite_Item=0,@Track_Stock=1,@InStock=50,@LowStock=10,@Tax_10=N'1',@Representation=0,@Item_Color=N'bg-red',@Item_Shape=N'shape',
@Item_Image=N'',@COMPTYPE=@p22,@VARTYPE=@p23
*/
create or alter proc Web_LoginCheck
(
	@EmailAddress nvarchar(100),
	@PASSWORD nvarchar(100)
)
AS          
BEGIN
	BEGIN TRY
		IF NOT EXISTS(SELECT EmailAddress FROM POS_LoginUser WITH(NOLOCK) WHERE RTRIM(EmailAddress)=RTRIM(@EmailAddress))
		BEGIN
			RAISERROR('Email is not registered.', 16, 1)
		END
		IF NOT EXISTS(SELECT EmailAddress FROM POS_LoginUser WITH(NOLOCK) WHERE RTRIM(EmailAddress)=RTRIM(@EmailAddress) and RTRIM([PASSWORD])=RTRIM(@PASSWORD))
		BEGIN
			RAISERROR('Wrong Password.', 16, 1)
		END
		SELECT UserID, EmailAddress, [PASSWORD], Business_Name, Currency, Country 
		FROM POS_LoginUser WITH(NOLOCK) 
		WHERE RTRIM(EmailAddress)=RTRIM(@EmailAddress) and RTRIM([PASSWORD])=RTRIM(@PASSWORD)
	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000),@ErrorSeverity INT,@ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState)
	END CATCH
END
GO
CREATE OR ALTER proc [dbo].[Web_Sett_DevicesGetData]
(
	@POS_Device_ID nvarchar(20)
)
AS
BEGIN
	BEGIN TRY
		SELECT *
		FROM POS_Device
		WHERE POS_Device_ID=@POS_Device_ID or @POS_Device_ID = ''
	END TRY
	BEGIN	CATCH
			DECLARE @ErrorMessage NVARCHAR(4000)
			DECLARE @ErrorSeverity INT
			DECLARE @ErrorState INT

			SELECT @ErrorMessage = ERROR_MESSAGE(),
				@ErrorSeverity = ERROR_SEVERITY(),
				@ErrorState = ERROR_STATE()

			RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState)
	END CATCH
END
GO
/*
EXEC Web_Sett_DevicesGetData ''
*/
CREATE OR ALTER proc [dbo].[Web_Sett_FeaturesGetData]
(
	@Feature_ID nvarchar(20)
)
AS
BEGIN
	BEGIN TRY
		SELECT *
		FROM POS_Set_Features
		WHERE Feature_ID=@Feature_ID or @Feature_ID = ''
	END TRY
	BEGIN	CATCH
			DECLARE @ErrorMessage NVARCHAR(4000)
			DECLARE @ErrorSeverity INT
			DECLARE @ErrorState INT

			SELECT @ErrorMessage = ERROR_MESSAGE(),
				@ErrorSeverity = ERROR_SEVERITY(),
				@ErrorState = ERROR_STATE()

			RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState)
	END CATCH
END
GO
/*
EXEC Web_Sett_FeaturesGetData ''
*/
CREATE OR ALTER proc [dbo].[Web_Sett_PayTypeGetData]
(
	@Payment_ID nvarchar(20)
)
AS
BEGIN
	BEGIN TRY
		SELECT *
		FROM POS_Set_PayTypes
		WHERE Payment_ID=@Payment_ID or @Payment_ID = ''
	END TRY
	BEGIN	CATCH
			DECLARE @ErrorMessage NVARCHAR(4000)
			DECLARE @ErrorSeverity INT
			DECLARE @ErrorState INT

			SELECT @ErrorMessage = ERROR_MESSAGE(),
				@ErrorSeverity = ERROR_SEVERITY(),
				@ErrorState = ERROR_STATE()

			RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState)
	END CATCH
END
GO
/*
EXEC Web_Sett_PayTypeGetData ''
*/
CREATE OR ALTER proc [dbo].[Web_Sett_SalesTypeGetData]
(
	@SalesType_ID nvarchar(20)
)
AS
BEGIN
	BEGIN TRY
		SELECT *
		FROM POS_Set_SalesType
		WHERE SalesType_ID=@SalesType_ID or @SalesType_ID = ''
	END TRY
	BEGIN	CATCH
			DECLARE @ErrorMessage NVARCHAR(4000)
			DECLARE @ErrorSeverity INT
			DECLARE @ErrorState INT

			SELECT @ErrorMessage = ERROR_MESSAGE(),
				@ErrorSeverity = ERROR_SEVERITY(),
				@ErrorState = ERROR_STATE()

			RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState)
	END CATCH
END
GO
/*
EXEC Web_Sett_SalesTypeGetData ''
*/
create or alter proc Web_Sett_SaveDataDevice
(
	@UserID nvarchar(20),
	@POS_Device_ID nvarchar(20), 
	@POS_Device_Name nvarchar(250),
	@Store_ID nvarchar(20), 
	@Store_Name nvarchar(100)
)
AS          
BEGIN
	BEGIN TRY
		BEGIN
			IF LEN(ISNULL(@POS_Device_Name,''))=0
			BEGIN
				RAISERROR('Please fill device name.',16,1)
			END
			IF LEN(ISNULL(@Store_ID,''))=0
			BEGIN
				RAISERROR('Please choose store ID.',16,1)
			END
		END

		IF EXISTS(SELECT * FROM POS_Device WITH(NOLOCK) WHERE RTRIM(POS_Device_ID)=RTRIM(@POS_Device_ID))
		BEGIN
			UPDATE POS_Device
			SET POS_Device_Name=@POS_Device_Name, Store_ID=@Store_ID, Store_Name=@Store_Name, Modified_User=@UserID, Modified_Date=CAST(GETDATE() as date)
			WHERE RTRIM(POS_Device_ID)=RTRIM(@POS_Device_ID)
		END
		ELSE
		BEGIN
			declare @p varchar(30)
			EXEC Web_Generate_NumberMaster @TABLE=N'POS_Device', @FIELD=N'POS_Device_ID', @DOCID=N'DVC', @NEWNUMBER=@p output
			SET @POS_Device_ID=@p

			INSERT INTO [POS_Device]
			(POS_Device_ID, POS_Device_Name, Store_ID, Store_Name, Created_User, Created_Date, Modified_User, Modified_Date)
			VALUES
			(@POS_Device_ID, @POS_Device_Name, @Store_ID, @Store_Name, @UserID, CAST(GETDATE() as date), '', '')
		END

		DECLARE @LINEITEM int = 0
		SELECT @LINEITEM=MAX(COALESCE(Line_Item, 0)) + 1
		FROM POS_Device_History
		WHERE POS_Device_ID=@POS_Device_ID

		INSERT INTO [POS_Device_History]
		(POS_Device_ID, Line_Item, POS_Device_Name, Store_ID, Store_Name, Created_User, Created_Date)
		VALUES
		(@POS_Device_ID, COALESCE(@LINEITEM, 0), @POS_Device_Name, @Store_ID, @Store_Name, @UserID, CAST(GETDATE() as date))
			
		SELECT CODE='200', POS_Device_ID=@POS_Device_ID

	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000),@ErrorSeverity INT,@ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState)
	END CATCH
END
GO
create or alter proc Web_Sett_SaveDataFeature
(
	@UserID nvarchar(20),
	@Feature_ID nvarchar(20),
	@Feature_Shift int, 
	@Feature_TimeClock int,
	@Feature_LowStock int,
	@Feature_NegativeStock int
)
AS          
BEGIN
	BEGIN TRY
		IF EXISTS(SELECT * FROM POS_Set_Features WITH(NOLOCK) WHERE RTRIM(Feature_ID)=RTRIM(@Feature_ID))
		BEGIN
			UPDATE POS_Set_Features
			SET Feature_Shift=@Feature_Shift, Feature_TimeClock=@Feature_TimeClock, Feature_LowStock=@Feature_LowStock, 
			Feature_NegativeStock=@Feature_NegativeStock, Modified_User=@UserID, Modified_Date=CAST(GETDATE() as date)
			WHERE RTRIM(Feature_ID)=RTRIM(@Feature_ID)
		END
		ELSE
		BEGIN
			declare @p varchar(30)
			EXEC Web_Generate_NumberMaster @TABLE=N'POS_Set_Features', @FIELD=N'Feature_ID', @DOCID=N'FTR', @NEWNUMBER=@p output
			SET @Feature_ID=@p

			INSERT INTO [POS_Set_Features]
			(Feature_ID, Feature_Shift, Feature_TimeClock, Feature_LowStock, Feature_NegativeStock, Created_User, Created_Date, Modified_User, Modified_Date)
			VALUES
			(@Feature_ID, @Feature_Shift, @Feature_TimeClock, @Feature_LowStock, @Feature_NegativeStock, @UserID, CAST(GETDATE() as date), '', '')
		END

		DECLARE @LINEITEM int = 0
		SELECT @LINEITEM=MAX(COALESCE(Line_Item, 0)) + 1
		FROM POS_Set_Features_History
		WHERE Feature_ID=@Feature_ID

		INSERT INTO [POS_Set_Features_History]
		(Feature_ID, Line_Item, Feature_Shift, Feature_TimeClock, Feature_LowStock, Feature_NegativeStock, Created_User, Created_Date)
		VALUES
		(@Feature_ID, COALESCE(@LINEITEM, 0), @Feature_Shift, @Feature_TimeClock, @Feature_LowStock, @Feature_NegativeStock, @UserID, CAST(GETDATE() as date))
			
		SELECT CODE='200', Feature_ID=@Feature_ID

	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000),@ErrorSeverity INT,@ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState)
	END CATCH
END
GO
create or alter proc Web_Sett_SaveDataPayment
(
	@UserID nvarchar(20),
	@Payment_ID nvarchar(20), 
	@Payment_Type nvarchar(100),
	@Payment_Name nvarchar(300),
	@AllStore int,
	@PAYTYPE PAYTYPE readonly
)
AS          
BEGIN
	BEGIN TRY
		BEGIN
			IF LEN(ISNULL(@Payment_Name,''))=0
			BEGIN
				RAISERROR('Please fill payment name.',16,1)
			END
			IF LEN(ISNULL(@Payment_Type,''))=0
			BEGIN
				RAISERROR('Please choose payment type.',16,1)
			END
		END

		IF EXISTS(SELECT * FROM POS_Set_PayTypes WITH(NOLOCK) WHERE RTRIM(Payment_ID)=RTRIM(@Payment_ID))
		BEGIN
			UPDATE POS_Set_PayTypes
			SET Payment_Type=@Payment_Type, Payment_Name=@Payment_Name, AllStore=@AllStore, Modified_User=@UserID, Modified_Date=CAST(GETDATE() as date)
			WHERE RTRIM(Payment_ID)=RTRIM(@Payment_ID)
		END
		ELSE
		BEGIN
			declare @p varchar(30)
			EXEC Web_Generate_NumberMaster @TABLE=N'POS_Set_PayTypes', @FIELD=N'Payment_ID', @DOCID=N'PAY', @NEWNUMBER=@p output
			SET @Payment_ID=@p
		END

		DELETE FROM POS_Set_PayTypes WHERE RTRIM(Payment_ID)=RTRIM(@Payment_ID) and RTRIM(Store_ID) not in(select Store_ID from @PAYTYPE)

		DECLARE @Store_ID nvarchar(20)='', @Store_Name nvarchar(100)='', @LineItem int=0

		DECLARE @PAYTYPE2 table(LineItem int, AllStore int, Store_ID nvarchar(20), Store_Name nvarchar(100), ROWID int)
		INSERT INTO @PAYTYPE2(LineItem, AllStore, Store_ID, Store_Name, ROWID)
		SELECT LineItem, AllStore, Store_ID, Store_Name, ROW_NUMBER() OVER(ORDER BY LineItem)
		FROM @PAYTYPE

		DECLARE @I int=1, @COUNT int=0
		DECLARE @LINEITEM2 int = 0

		SELECT @COUNT=COUNT(*) FROM @PAYTYPE2

		WHILE @I <= @COUNT
		BEGIN
			SELECT @LineItem=LineItem, @AllStore=AllStore, @Store_ID=Store_ID, @Store_Name=@Store_Name
			FROM @PAYTYPE2 WHERE ROWID=@I

			INSERT INTO [POS_Set_PayTypes] (Payment_ID, Payment_Type, Payment_Name, LineItem, AllStore, Store_ID, Store_Name, Created_User, Created_Date, Modified_User, Modified_Date)
			SELECT @Payment_ID, @Payment_Type, @Payment_Name, LineItem, AllStore, Store_ID, Store_Name, @UserID, CAST(GETDATE() as date), @UserID, CAST(GETDATE() as date)
			FROM @PAYTYPE2

			SELECT @LINEITEM2=MAX(COALESCE(Line_Item, 0)) + 1
			FROM POS_Set_PayTypes_History
			WHERE Payment_ID=@Payment_ID

			INSERT INTO [POS_Set_PayTypes_History]
			(Payment_ID, Payment_Type, Line_Item, Payment_Name, LineItem, AllStore, Store_ID, Store_Name, Created_User, Created_Date)
			VALUES
			(@Payment_ID, @Payment_Type, COALESCE(@LINEITEM2, 0), @Payment_Name, @LineItem, @AllStore, @Store_ID, @Store_Name, @UserID, CAST(GETDATE() as date))

			SET @I = @I + 1
		END
		SELECT CODE='200', Payment_ID=@Payment_ID

	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000),@ErrorSeverity INT,@ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState)
	END CATCH
END
GO
/*
begin tran

declare @p6 dbo.PAYTYPE
insert into @p6 values(1,0,N'STR0001',N'STORE A')

exec Web_Sett_SaveDataPayment @UserID=N'USER1',@Payment_ID=N'',@Payment_Type=N'Cash',@Payment_Name=N'Payment Cash',@AllStore=0,@PAYTYPE=@p6

rollback
*/
create or alter proc Web_Sett_SaveDataSalesType
(
	@UserID nvarchar(20),
	@SalesType_ID nvarchar(20), 
	@SalesType_Name nvarchar(100),
	@Store_ID nvarchar(20), 
	@Store_Name nvarchar(100)
)
AS          
BEGIN
	BEGIN TRY
		BEGIN
			IF LEN(ISNULL(@SalesType_Name,''))=0
			BEGIN
				RAISERROR('Please fill sales type name.',16,1)
			END
			IF LEN(ISNULL(@Store_ID,''))=0
			BEGIN
				RAISERROR('Please choose store ID.',16,1)
			END
		END

		IF EXISTS(SELECT * FROM POS_Set_SalesType WITH(NOLOCK) WHERE RTRIM(SalesType_ID)=RTRIM(@SalesType_ID))
		BEGIN
			UPDATE POS_Set_SalesType
			SET SalesType_Name=@SalesType_Name, Store_ID=@Store_ID, Store_Name=@Store_Name, Modified_User=@UserID, Modified_Date=CAST(GETDATE() as date)
			WHERE RTRIM(SalesType_ID)=RTRIM(@SalesType_ID)
		END
		ELSE
		BEGIN
			declare @p varchar(30)
			EXEC Web_Generate_NumberMaster @TABLE=N'POS_Set_SalesType', @FIELD=N'SalesType_ID', @DOCID=N'STYP', @NEWNUMBER=@p output
			SET @SalesType_ID=@p

			INSERT INTO [POS_Set_SalesType]
			(SalesType_ID, SalesType_Name, Store_ID, Store_Name, Created_User, Created_Date, Modified_User, Modified_Date)
			VALUES
			(@SalesType_ID, @SalesType_Name, @Store_ID, @Store_Name, @UserID, CAST(GETDATE() as date), '', '')
		END

		DECLARE @LINEITEM int = 0
		SELECT @LINEITEM=MAX(COALESCE(Line_Item, 0)) + 1
		FROM POS_Set_SalesType_History
		WHERE SalesType_ID=@SalesType_ID

		INSERT INTO [POS_Set_SalesType_History]
		(SalesType_ID, Line_Item, SalesType_Name, Store_ID, Store_Name, Created_User, Created_Date)
		VALUES
		(@SalesType_ID, COALESCE(@LINEITEM, 0), @SalesType_Name, @Store_ID, @Store_Name, @UserID, CAST(GETDATE() as date))
			
		SELECT CODE='200', SalesType_ID=@SalesType_ID

	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000),@ErrorSeverity INT,@ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState)
	END CATCH
END
GO
create or alter proc Web_Sett_SaveDataSite
(
	@UserID nvarchar(20),
	@Site_ID nvarchar(20), 
	@DefaultSite int,
	@Site_Name nvarchar(100),
	@Store_ID nvarchar(20), 
	@Store_Name nvarchar(100)
)
AS          
BEGIN
	BEGIN TRY
		BEGIN
			IF LEN(ISNULL(@Site_Name,''))=0
			BEGIN
				RAISERROR('Please fill site name.',16,1)
			END
			IF LEN(ISNULL(@Store_ID,''))=0
			BEGIN
				RAISERROR('Please choose store ID.',16,1)
			END
		END

		IF EXISTS(SELECT * FROM POS_Set_Site WITH(NOLOCK) WHERE RTRIM(Site_ID)=RTRIM(@Site_ID))
		BEGIN
			UPDATE POS_Set_Site
			SET DefaultSite=@DefaultSite, Site_Name=@Site_Name, Store_ID=@Store_ID, Store_Name=@Store_Name, Modified_User=@UserID, Modified_Date=CAST(GETDATE() as date)
			WHERE RTRIM(Site_ID)=RTRIM(@Site_ID)
		END
		ELSE
		BEGIN
			declare @p varchar(30)
			EXEC Web_Generate_NumberMaster @TABLE=N'POS_Set_Site', @FIELD=N'Site_ID', @DOCID=N'SITE', @NEWNUMBER=@p output
			SET @Site_ID=@p

			INSERT INTO [POS_Set_Site]
			(Site_ID, DefaultSite, Site_Name, Store_ID, Store_Name, Created_User, Created_Date, Modified_User, Modified_Date)
			VALUES
			(@Site_ID, @DefaultSite, @Site_Name, @Store_ID, @Store_Name, @UserID, CAST(GETDATE() as date), '', '')
		END

		IF @DefaultSite = 1
		BEGIN
			UPDATE POS_Set_Site
			SET DefaultSite=0, Modified_User=@UserID, Modified_Date=CAST(GETDATE() as date)
			WHERE RTRIM(Site_ID) <> RTRIM(@Site_ID) and DefaultSite=1
		END

		DECLARE @LINEITEM int = 0
		SELECT @LINEITEM=MAX(COALESCE(Line_Item, 0)) + 1
		FROM POS_Set_Site_History
		WHERE Site_ID=@Site_ID

		INSERT INTO [POS_Set_Site_History]
		(Site_ID, Line_Item, DefaultSite, Site_Name, Store_ID, Store_Name, Created_User, Created_Date)
		VALUES
		(@Site_ID, COALESCE(@LINEITEM, 0), @DefaultSite, @Site_Name, @Store_ID, @Store_Name, @UserID, CAST(GETDATE() as date))
			
		SELECT CODE='200', Site_ID=@Site_ID

	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000),@ErrorSeverity INT,@ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState)
	END CATCH
END
GO
create or alter proc Web_Sett_SaveDataStore
(
	@UserID nvarchar(20),
	@Store_ID nvarchar(20), 
	@Store_Name nvarchar(100),
	@Address nvarchar(300),
	@Country nvarchar(100),
	@CountryName nvarchar(100),
	@Province nvarchar(100),
	@City nvarchar(100),
	@Postal_Code nvarchar(10),
	@Phone nvarchar(20),
	@Description nvarchar(255)
)
AS          
BEGIN
	BEGIN TRY
		BEGIN
			IF LEN(ISNULL(@Store_Name,''))=0
			BEGIN
				RAISERROR('Please fill store name.',16,1)
			END
			IF LEN(ISNULL(@Address,''))=0
			BEGIN
				RAISERROR('Please fill address.',16,1)
			END
			IF LEN(ISNULL(@Country,''))=0
			BEGIN
				RAISERROR('Please choose country.',16,1)
			END
			IF LEN(ISNULL(@Phone,''))=0
			BEGIN
				RAISERROR('Please fill phone.',16,1)
			END
		END

		IF EXISTS(SELECT * FROM POS_Set_Stores WITH(NOLOCK) WHERE RTRIM(Store_ID)=RTRIM(@Store_ID))
		BEGIN
			UPDATE POS_Set_Stores
			SET Store_Name=@Store_Name, [Address]=@Address, Country=@Country, CountryName=@CountryName, Province=@Province, City=@City, Postal_Code=@Postal_Code, 
			Phone=@Phone, [Description]=@Description, Modified_User=@UserID, Modified_Date=CAST(GETDATE() as date)
			WHERE RTRIM(Store_ID)=RTRIM(@Store_ID)
		END
		ELSE
		BEGIN
			declare @p varchar(30)
			EXEC Web_Generate_NumberMaster @TABLE=N'POS_Set_Stores', @FIELD=N'Store_ID', @DOCID=N'STR', @NEWNUMBER=@p output
			SET @Store_ID=@p

			INSERT INTO [POS_Set_Stores]
			(Store_ID, Store_Name, [Address], Country, CountryName, Province, City, Postal_Code, Phone, [Description], Created_User, Created_Date, Modified_User, Modified_Date)
			VALUES
			(@Store_ID, @Store_Name, @Address, @Country, @CountryName, @Province, @City, @Postal_Code, @Phone, @Description, @UserID, CAST(GETDATE() as date), '', '')
		END

		DECLARE @LINEITEM int = 0
		SELECT @LINEITEM=MAX(COALESCE(Line_Item, 0)) + 1
		FROM POS_Set_Stores_History
		WHERE Store_ID=@Store_ID

		INSERT INTO [POS_Set_Stores_History]
		(Store_ID, Line_Item, Store_Name, [Address], Country, CountryName, Province, City, Postal_Code, Phone, [Description], Created_User, Created_Date)
		VALUES
		(@Store_ID, COALESCE(@LINEITEM, 0), @Store_Name, @Address, @Country, @CountryName, @Province, @City, @Postal_Code, @Phone, @Description, @UserID, CAST(GETDATE() as date))
			
		SELECT CODE='200', Store_ID=@Store_ID

	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000),@ErrorSeverity INT,@ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState)
	END CATCH
END
GO
create or alter proc Web_Sett_SaveDataTaxes
(
	@UserID nvarchar(20),
	@Tax_ID nvarchar(20), 
	@Tax_Name nvarchar(100),
	@Tax_Rate numeric(19,5),
	@Tax_Type int,
	@Tax_Option int
)
AS          
BEGIN
	BEGIN TRY
		IF EXISTS(SELECT * FROM POS_Set_Taxes WITH(NOLOCK) WHERE RTRIM(Tax_ID)=RTRIM(@Tax_ID))
		BEGIN
			UPDATE POS_Set_Taxes
			SET Tax_Name=@Tax_Name, Tax_Rate=@Tax_Rate, Tax_Type=@Tax_Type, Tax_Option=@Tax_Option, Modified_User=@UserID, Modified_Date=CAST(GETDATE() as date)
			WHERE RTRIM(Tax_ID)=RTRIM(@Tax_ID)
		END
		ELSE
		BEGIN
			declare @p varchar(30)
			EXEC Web_Generate_NumberMaster @TABLE=N'POS_Set_Taxes', @FIELD=N'Tax_ID', @DOCID=N'TAX', @NEWNUMBER=@p output
			SET @Tax_ID=@p

			INSERT INTO [POS_Set_Taxes]
			(Tax_ID, Tax_Name, Tax_Rate, Tax_Type, Tax_Option, Created_User, Created_Date, Modified_User, Modified_Date)
			VALUES
			(@Tax_ID, @Tax_Name, @Tax_Rate, @Tax_Type, @Tax_Option, @UserID, CAST(GETDATE() as date), '', '')
		END

		DECLARE @LINEITEM int = 0
		SELECT @LINEITEM=MAX(COALESCE(Line_Item, 0)) + 1
		FROM POS_Set_Taxes_History
		WHERE Tax_ID=@Tax_ID

		INSERT INTO [POS_Set_Taxes_History]
		(Tax_ID, Line_Item, Tax_Name, Tax_Rate, Tax_Type, Tax_Option, Created_User, Created_Date)
		VALUES
		(@Tax_ID, COALESCE(@LINEITEM, 0), @Tax_Name, @Tax_Rate, @Tax_Type, @Tax_Option, @UserID, CAST(GETDATE() as date))
			
		SELECT CODE='200', Tax_ID=@Tax_ID

	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000),@ErrorSeverity INT,@ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState)
	END CATCH
END
GO
CREATE OR ALTER proc [dbo].[Web_Sett_SitesGetData]
(
	@Site_ID nvarchar(20)
)
AS
BEGIN
	BEGIN TRY
		SELECT *
		FROM POS_Set_Site
		WHERE Site_ID=@Site_ID or @Site_ID = ''
	END TRY
	BEGIN	CATCH
			DECLARE @ErrorMessage NVARCHAR(4000)
			DECLARE @ErrorSeverity INT
			DECLARE @ErrorState INT

			SELECT @ErrorMessage = ERROR_MESSAGE(),
				@ErrorSeverity = ERROR_SEVERITY(),
				@ErrorState = ERROR_STATE()

			RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState)
	END CATCH
END
GO
/*
EXEC Web_Sett_SitesGetData ''
*/
CREATE OR ALTER proc [dbo].[Web_Sett_StoresGetData]
(
	@Store_ID nvarchar(20)
)
AS
BEGIN
	BEGIN TRY
		SELECT *, 
		FULL_ADDRESS=
		CASE WHEN LEN(RTRIM([Address])) > 0 THEN [Address] ELSE '' END +
		CASE WHEN LEN(RTRIM(City)) > 0 THEN ', ' + City ELSE '' END + 
		CASE WHEN LEN(RTRIM(Province)) > 0 THEN ', ' + Province ELSE '' END + 
		CASE WHEN LEN(RTRIM(CountryName)) > 0 THEN ', ' + CountryName ELSE '' END + 
		CASE WHEN LEN(RTRIM(Postal_Code)) > 0 THEN ', ' + Postal_Code ELSE '' END
		FROM POS_Set_Stores
		WHERE Store_ID=@Store_ID or @Store_ID = ''
	END TRY
	BEGIN	CATCH
			DECLARE @ErrorMessage NVARCHAR(4000)
			DECLARE @ErrorSeverity INT
			DECLARE @ErrorState INT

			SELECT @ErrorMessage = ERROR_MESSAGE(),
				@ErrorSeverity = ERROR_SEVERITY(),
				@ErrorState = ERROR_STATE()

			RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState)
	END CATCH
END
GO
/*
EXEC Web_Sett_StoresGetData ''
*/
CREATE OR ALTER proc [dbo].[Web_Sett_TaxesGetData]
(
	@Tax_ID nvarchar(20)
)
AS
BEGIN
	BEGIN TRY
		SELECT *
		FROM POS_Set_Taxes
		WHERE Tax_ID=@Tax_ID or @Tax_ID = ''
	END TRY
	BEGIN	CATCH
			DECLARE @ErrorMessage NVARCHAR(4000)
			DECLARE @ErrorSeverity INT
			DECLARE @ErrorState INT

			SELECT @ErrorMessage = ERROR_MESSAGE(),
				@ErrorSeverity = ERROR_SEVERITY(),
				@ErrorState = ERROR_STATE()

			RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState)
	END CATCH
END
GO
/*
EXEC Web_Sett_TaxesGetData ''
*/
create or alter proc Web_SIGNUP_INSERTUPDATE
(
	@UserID nvarchar(20),
	@EmailAddress nvarchar(100),
	@PASSWORD nvarchar(100),
	@Business_Name nvarchar(100),
	@Currency nvarchar(30),
	@Country nvarchar(100)
)
AS          
BEGIN
	BEGIN TRY
		BEGIN
			IF(LEN(ISNULL(@EmailAddress,''))=0)
			BEGIN
				RAISERROR('Please enter your email address.',16,1)
			END
			IF(LEN(ISNULL(@PASSWORD,''))=0)
			BEGIN
				RAISERROR('Please enter your password.',16,1)
			END
			IF(LEN(ISNULL(@Business_Name,''))=0)
			BEGIN
				RAISERROR('Please enter your business name.',16,1)
			END
		END

		IF EXISTS(SELECT * FROM POS_LoginUser WITH(NOLOCK) WHERE RTRIM(EmailAddress)=RTRIM(@EmailAddress)) and @UserID <> 0
		BEGIN
			RAISERROR ('An account already exists with this email address',16,1)
		END
		ELSE IF EXISTS(SELECT * FROM POS_LoginUser WITH(NOLOCK) WHERE UserID=@UserID)
		BEGIN
			UPDATE POS_LoginUser
			SET EmailAddress=@EmailAddress, [PASSWORD]=@PASSWORD, Business_Name=@Business_Name, Currency=@Currency, Country=@Country,
				Modified_User=@EmailAddress, Modified_Date=DATEADD(HOUR,1,GETDATE())
			WHERE UserID=@UserID
		END
		ELSE
		BEGIN
			DECLARE @USER varchar(20)='USER', @LINEITEM int=1

			IF EXISTS(SELECT top 1 * FROM POS_LoginUser)
			BEGIN
				SELECT top 1 @LINEITEM=ISNULL(SUBSTRING(COALESCE(UserID, ''), LEN(RTRIM(COALESCE(UserID, ''))), 1), 0) + 1
				FROM POS_LoginUser
				GROUP BY UserID
				ORDER BY USERID desc
			END

			SET @USER = @USER + CAST(@LINEITEM as varchar)

			INSERT INTO [POS_LoginUser]
			(UserID, EmailAddress, [PASSWORD], Business_Name, Currency, Country, Verify, Created_User, Created_Date, Modified_User, Modified_Date)
			VALUES
			(@USER, RTRIM(@EmailAddress), RTRIM(@PASSWORD), RTRIM(@Business_Name), RTRIM(@Currency), RTRIM(@Country), 0, @USER, DATEADD(HOUR,1,GETDATE()), '', '')

			INSERT INTO [POS_Account]
			(UserID, Business_Name, EmailAddress, Password, CurrencyID, Currency, Timezone, Created_User, Created_Date, Modified_User, Modified_Date)
			VALUES
			(@USER, RTRIM(@Business_Name), RTRIM(@EmailAddress), RTRIM(@PASSWORD), RTRIM(@Currency), RTRIM(@Currency), '', @USER, DATEADD(HOUR,1,GETDATE()), '', '')
		END
			
		SELECT CODE='200', EmailAddress=@EmailAddress

	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000),@ErrorSeverity INT,@ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState)
	END CATCH
END