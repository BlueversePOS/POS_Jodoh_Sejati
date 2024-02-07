CREATE OR ALTER proc [dbo].[Web_Discounts_GetData]
AS
BEGIN
	BEGIN TRY
		SELECT *
		FROM POS_Discount
		ORDER BY Discount_Name asc
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
EXEC Web_Discounts_GetData
*/