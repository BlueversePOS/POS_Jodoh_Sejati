CREATE OR ALTER proc [dbo].[Web_Items_GetDataList]
(
@Item_Number nvarchar(20),
@Category_ID nvarchar(20),
@StockAlert int
)
AS
BEGIN
	BEGIN TRY
		SELECT distinct A.*, COALESCE(B.Category_Name, '') Category_Name, COALESCE(C.Tax_Name, '') Tax_Name,
		CASE WHEN COALESCE(IV.Item_Number, '') <> '' THEN 1 ELSE 0 END IsVariant
		FROM POS_Item A
		LEFT JOIN POS_ItemVariant IV ON A.Item_Number=IV.Item_Number
		LEFT JOIN POS_CategoryItem B ON A.Category_ID=B.Category_ID
		LEFT JOIN POS_Set_Taxes C ON A.Tax_ID=C.Tax_ID
		INNER JOIN POS_Set_Site D ON A.Site_ID=D.Site_ID and D.DefaultSite=1
		WHERE 1=1
		and (CASE WHEN LEN(RTRIM(@Item_Number)) > 0 THEN A.Item_Number ELSE '' END = 
		CASE WHEN LEN(RTRIM(@Item_Number)) > 0 THEN @Item_Number ELSE '' END
		and CASE WHEN LEN(RTRIM(@Category_ID)) > 0 THEN A.Category_ID ELSE '' END = 
		CASE WHEN LEN(RTRIM(@Category_ID)) > 0 THEN @Category_ID ELSE '' END
		and CASE WHEN @StockAlert > 0 THEN A.LowStock ELSE 0 END = 
		CASE WHEN @StockAlert > 0 THEN @StockAlert ELSE 0 END)
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
EXEC Web_Items_GetDataList '', '', 0
*/