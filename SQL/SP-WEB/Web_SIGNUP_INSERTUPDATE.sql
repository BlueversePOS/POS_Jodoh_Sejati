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
			(@USER, RTRIM(@EmailAddress), RTRIM(@PASSWORD), RTRIM(@Business_Name), RTRIM(@Currency), RTRIM(@Country), 0, @EmailAddress, DATEADD(HOUR,1,GETDATE()), '', '')
		END
			
		SELECT CODE='200', EmailAddress=@EmailAddress

	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000),@ErrorSeverity INT,@ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState)
	END CATCH
END