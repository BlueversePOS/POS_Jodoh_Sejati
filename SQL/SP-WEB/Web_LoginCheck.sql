create or alter proc Web_LoginCheck
(
	@EmailAddress nvarchar(100),
	@PASSWORD nvarchar(100)
)
AS          
BEGIN
	BEGIN TRY
		IF EXISTS(SELECT * FROM POS_Employee WITH(NOLOCK) WHERE UserID=@EmailAddress)
		BEGIN
			IF NOT EXISTS(SELECT * FROM POS_Employee WITH(NOLOCK) WHERE RTRIM(UserID)=RTRIM(@EmailAddress) and RTRIM(UserPassword)=RTRIM(@PASSWORD))
			BEGIN
				RAISERROR('Wrong Password Employee User.', 16, 1)
			END
			SELECT UserID, Email as EmailAddress, UserPassword as [PASSWORD], Employee_Name as Business_Name, '' Currency, '' Country 
			FROM POS_Employee WITH(NOLOCK) 
			WHERE RTRIM(UserID)=RTRIM(@EmailAddress) and RTRIM(UserPassword)=RTRIM(@PASSWORD)
		END
		ELSE
		BEGIN
			IF NOT EXISTS(SELECT EmailAddress FROM POS_LoginUser WITH(NOLOCK) WHERE RTRIM(EmailAddress)=RTRIM(@EmailAddress))
			BEGIN
				RAISERROR('Email is not registered.', 16, 1)
			END
			IF NOT EXISTS(SELECT EmailAddress FROM POS_LoginUser WITH(NOLOCK) WHERE RTRIM(EmailAddress)=RTRIM(@EmailAddress) and RTRIM([PASSWORD])=RTRIM(@PASSWORD))
			BEGIN
				RAISERROR('Wrong Email Password.', 16, 1)
			END
			
			SELECT UserID, EmailAddress, [PASSWORD], Business_Name, Currency, Country 
			FROM POS_LoginUser WITH(NOLOCK) 
			WHERE RTRIM(EmailAddress)=RTRIM(@EmailAddress) and RTRIM([PASSWORD])=RTRIM(@PASSWORD)
		END
	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000),@ErrorSeverity INT,@ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState)
	END CATCH
END
GO