CREATE OR ALTER proc [dbo].[Web_Trx_GetReason]
AS
BEGIN
	BEGIN TRY
		DECLARE @TABLEREASON table(REASON NVARCHAR(30))

		INSERT INTO @TABLEREASON(REASON)
		VALUES
		('Receive Items'),
		('Damage'),
		('Inventory Count'),
		('Loss')

		SELECT * FROM @TABLEREASON
		ORDER BY REASON
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
EXEC Web_Trx_GetReason
*/