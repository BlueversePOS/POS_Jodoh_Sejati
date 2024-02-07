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