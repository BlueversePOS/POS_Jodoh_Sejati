CREATE OR ALTER proc [dbo].[Web_Items_GetItemVariant]
(
@Item_Number nvarchar(20)
)
AS
BEGIN
	BEGIN TRY
		SELECT A.*, COALESCE(B.Item_Name, '') Item_Name, COALESCE(B.Item_Description, '') Item_Description, 0 FLAG
		FROM POS_ItemVariant A
		LEFT JOIN POS_Item B ON A.Item_Number=B.Item_Number and A.Site_ID=B.Site_ID
		WHERE RTRIM(A.Item_Number) = RTRIM(@Item_Number) and A.Site_ID in(select Site_ID from POS_Set_Site where DefaultSite=1)
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
EXEC Web_Items_GetItemVariant 'ITM0001'
*/