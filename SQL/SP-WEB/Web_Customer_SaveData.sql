create or alter proc [dbo].[Web_Customer_SaveData]
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
		DECLARE @CurrDate datetime = SYSDATETIMEOFFSET() AT TIME ZONE 'SE Asia Standard Time'
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
			City=@City, Postal_Code=@Postal_Code, Note=@Note, Modified_User=@UserID, Modified_Date=@CurrDate
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
			(@Customer_ID, @Customer_Name, @Email, @Phone, @Address, @Country, @Province, @City, @Postal_Code, @Customer_Code, @Note, @UserID, @CurrDate, '', '')
		END

		DECLARE @LINEITEM int = 0
		SELECT @LINEITEM=MAX(COALESCE(Line_Item, 0)) + 1
		FROM POS_Customer_History
		WHERE Customer_ID=@Customer_ID

		INSERT INTO [POS_Customer_History]
		(Customer_ID, Customer_Name, Line_Item, Email, Phone, Address, Country, Province, City, Postal_Code, Customer_Code, Note, Created_User, Created_Date)
		VALUES
		(@Customer_ID, @Customer_Name, COALESCE(@LINEITEM, 0), @Email, @Phone, @Address, @Country, @Province, @City, @Postal_Code, @Customer_Code, @Note, @UserID, @CurrDate)
			
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
