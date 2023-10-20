create or alter proc Web_LoginCheck
(
	@EmailAddress nvarchar(100),
	@PASSWORD nvarchar(100)
)
AS          
BEGIN
	BEGIN TRY
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