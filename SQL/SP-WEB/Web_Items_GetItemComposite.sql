CREATE OR ALTER proc [dbo].[Web_Items_GetItemComposite]
(
@Item_Number nvarchar(20)
)
AS
BEGIN
	BEGIN TRY
		SELECT *
		FROM POS_CompositeItem
		WHERE RTRIM(Item_Number) <> RTRIM(@Item_Number)
		ORDER BY Item_Number asc
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
EXEC Web_Items_GetItemComposite
*/