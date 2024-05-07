create or alter proc TRX_Adjustment_GetItemBySite
(
	@Item_Number nvarchar(20),
	@LineItem_Option numeric(19,5),
	@Site_ID nvarchar(20)
)
AS          
BEGIN
	BEGIN TRY
		SELECT *
		FROM(
			select Z.Item_Number, Z.Item_Description, Z.LineItem_Option, Z.Item_SKU, ISNULL(B.InStock, 0) InStock, ISNULL(B.Item_Cost, 0) Item_Cost
			from(
				SELECT DISTINCT A.Item_Number, 
				A.Item_Name + CASE
				WHEN COALESCE(B.Variant_Name, '') <> '' THEN ' (' + COALESCE(B.Variant_Name, '') + ')'
				ELSE '' END Item_Description, 
				ISNULL(B.LineItem_Option, 0) LineItem_Option, COALESCE(B.Item_SKU, '') Item_SKU
				FROM POS_Item A
				left join POS_ItemVariant B ON A.Item_Number=B.Item_Number
			) Z
			left join POS_ItemVariant B ON Z.Item_Number=B.Item_Number and Z.Item_SKU=B.Item_SKU
			where B.Site_ID=@Site_ID and (Z.Item_Number=@Item_Number or @Item_Number='') 
			and (Z.LineItem_Option in (@LineItem_Option) or @LineItem_Option=0)
			UNION
			select X.Item_Number, X.Item_Description, 0 LineItem_Option, X.Item_SKU, X.InStock, X.Item_Cost
			from POS_Item X
			where X.Site_ID=@Site_ID and (X.Item_Number=@Item_Number or @Item_Number='') and @LineItem_Option=0
			and X.Item_Number not in(select Item_Number from POS_ItemVariant)
		) A
		order by A.Item_SKU
	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000),@ErrorSeverity INT,@ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState)
	END CATCH
END
GO
/*
exec TRX_Adjustment_GetItemBySite '', 0, 'SITE0001'
exec TRX_Adjustment_GetItemBySite 'ITM0001', 1, 'SITE0001'
*/