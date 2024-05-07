CREATE OR ALTER proc [dbo].[Web_Categories_GetData]
AS
BEGIN
	BEGIN TRY
		SELECT CAT.Category_ID, CAT.Category_Name, CAT.Category_Color, COUNT(ITM.Category_ID) ITEM_COUNT
		FROM POS_CategoryItem CAT
		OUTER APPLY (
			SELECT DISTINCT X.Item_Number, X.Category_ID
			FROM POS_Item X
			WHERE X.Category_ID=CAT.Category_ID
		) ITM
		GROUP BY CAT.Category_ID, CAT.Category_Name, CAT.Category_Color
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
select * from POS_Item
*/
