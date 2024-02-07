create or alter proc Web_CheckEmailUser
(
	@EmailAddress nvarchar(250)
)
AS          
BEGIN
	BEGIN TRY
		declare @MSG VARCHAR(250) = ''
		IF NOT EXISTS(SELECT EmailAddress FROM POS_LoginUser WHERE EmailAddress=@EmailAddress)
		BEGIN
			SET @MSG = 'Please check your email. ' + @EmailAddress + ' is not registered.'
			RAISERROR(@MSG, 16, 1)
		END

		select 'success'
	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000), @ErrorSeverity INT, @ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState)
	END CATCH
END
GO