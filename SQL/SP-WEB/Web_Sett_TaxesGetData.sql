CREATE OR ALTER proc [dbo].[Web_Sett_TaxesGetData]
(
	@Tax_ID nvarchar(20)
)
AS
BEGIN
	BEGIN TRY
		SELECT *
		FROM POS_Set_Taxes
		WHERE Tax_ID=@Tax_ID or @Tax_ID = ''
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
EXEC Web_Sett_TaxesGetData ''
*/
