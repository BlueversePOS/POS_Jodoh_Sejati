CREATE OR ALTER proc [dbo].[Web_Sett_PayTypeGetData]
(
	@Payment_ID nvarchar(20)
)
AS
BEGIN
	BEGIN TRY
		SELECT *, 0 amount
		FROM POS_Set_PayTypes
		WHERE Payment_ID=@Payment_ID or @Payment_ID = ''
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
GO
/*
EXEC Web_Sett_PayTypeGetData ''
*/
