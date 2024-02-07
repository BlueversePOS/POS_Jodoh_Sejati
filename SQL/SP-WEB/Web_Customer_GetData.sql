CREATE OR ALTER proc [dbo].[Web_Customer_GetData]
AS
BEGIN
	BEGIN TRY
		SELECT *
		FROM POS_Customer
		ORDER BY Customer_Name asc
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
exec Web_Customer_GetData
*/