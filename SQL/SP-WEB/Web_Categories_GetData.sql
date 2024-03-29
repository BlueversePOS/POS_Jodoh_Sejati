CREATE OR ALTER proc [dbo].[Web_Categories_GetData]
AS
BEGIN
	BEGIN TRY
		SELECT *, 0 ITEM_COUNT
		FROM POS_CategoryItem
		ORDER BY Category_Name asc
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
EXEC Web_Categories_GetData
*/