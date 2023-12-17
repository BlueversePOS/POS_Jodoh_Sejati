CREATE OR ALTER proc [dbo].[Web_Sett_SalesTypeGetData]
(
	@SalesType_ID nvarchar(20)
)
AS
BEGIN
	BEGIN TRY
		SELECT *
		FROM POS_Set_SalesType
		WHERE SalesType_ID=@SalesType_ID or @SalesType_ID = ''
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
EXEC Web_Sett_SalesTypeGetData ''
*/
