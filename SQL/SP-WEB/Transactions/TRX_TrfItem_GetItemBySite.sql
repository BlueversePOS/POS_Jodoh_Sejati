create or alter proc TRX_TrfItem_GetItemBySite
(
	@Item_Number nvarchar(20),
	@LineItem_Option numeric(19,5),
	@SourceSite_ID nvarchar(20),
	@DestSite_ID nvarchar(20)
)
AS          
BEGIN
	BEGIN TRY
		SELECT *
		FROM(
			select Z.Item_Number, Z.Item_Description, Z.LineItem_Option, Z.Item_SKU, ISNULL(B.InStock, 0) SourceStock, 
			ISNULL(C.InStock, 0) DestinationStock--, ISNULL(B.Item_Cost, 0) Item_Cost
			from(
				SELECT DISTINCT A.Item_Number, 
				A.Item_Name + CASE
				WHEN COALESCE(B.Variant_Name, '') <> '' THEN ' (' + COALESCE(B.Variant_Name, '') + ')'
				ELSE '' END Item_Description, 
				ISNULL(B.LineItem_Option, 0) LineItem_Option, COALESCE(B.Item_SKU, '') Item_SKU
				FROM POS_Item A
				left join POS_ItemVariant B ON A.Item_Number=B.Item_Number
			) Z
			left join POS_ItemVariant B ON Z.Item_Number=B.Item_Number and Z.Item_SKU=B.Item_SKU and B.Site_ID=@SourceSite_ID
			left join POS_ItemVariant C ON Z.Item_Number=C.Item_Number and Z.Item_SKU=C.Item_SKU and C.Site_ID=@DestSite_ID
			where (Z.Item_Number=@Item_Number or @Item_Number='') and (Z.LineItem_Option=@LineItem_Option or @LineItem_Option=0)
			and Z.Item_Number not in(select X.Item_Number from POS_Item X where X.Item_Number not in(select XY.Item_Number from POS_ItemVariant XY))
			UNION
			select X.Item_Number, X.Item_Description, 0 LineItem_Option, X.Item_SKU, ISNULL(Y.InStock, 0) SourceStock, 
			ISNULL(Z.InStock, 0) DestinationStock--, X.Item_Cost
			from POS_Item X
			left join POS_Item Y ON Y.Item_Number=X.Item_Number and Y.Item_SKU=X.Item_SKU and Y.Site_ID=@SourceSite_ID
			left join POS_Item Z ON Z.Item_Number=X.Item_Number and Z.Item_SKU=X.Item_SKU and Z.Site_ID=@DestSite_ID
			where (X.Item_Number=@Item_Number or @Item_Number='') and @LineItem_Option=0
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
exec TRX_TrfItem_GetItemBySite '', ''
exec TRX_TrfItem_GetItemBySite 'SITE0001', 'SITE0002'
exec TRX_TrfItem_GetItemBySite @Item_Number=N'ITM0002',@LineItem_Option=0,@SourceSite_ID=N'SITE0001',@DestSite_ID=N'SITE0003'
*/