create or alter proc Web_UpdatePasswordUser
(
	@EmailAddress nvarchar(250),
	@PASSWORD nvarchar(20)
)
AS          
BEGIN
	BEGIN TRY
		UPDATE POS_LoginUser 
		SET [PASSWORD]=@PASSWORD
		WHERE EmailAddress=@EmailAddress

		select 'success'
	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000), @ErrorSeverity INT, @ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState)
	END CATCH
END
GO