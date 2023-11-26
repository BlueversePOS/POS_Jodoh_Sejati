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
/*
EXEC Web_Account_GetData
*/