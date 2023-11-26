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