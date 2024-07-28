create or alter proc [dbo].[Web_UpdatePasswordUser]
(
	@EmailAddress nvarchar(250),
	@PASSWORD nvarchar(20)
)
AS          
BEGIN
	BEGIN TRY
		DECLARE @CurrDate datetime = SYSDATETIMEOFFSET() AT TIME ZONE 'SE Asia Standard Time'

		UPDATE POS_LoginUser 
		SET [PASSWORD]=@PASSWORD, Modified_User=@EmailAddress, Modified_Date=@CurrDate
		WHERE EmailAddress=@EmailAddress
		select * from POS_LoginUser
		select 'success'
	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000), @ErrorSeverity INT, @ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState)
	END CATCH
END
GO