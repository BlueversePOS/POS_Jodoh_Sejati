create or alter proc TRX_Adjustment_GetDataDetail
(
	@DOCNUMBER nvarchar(20)
)
AS          
BEGIN
	BEGIN TRY
		SELECT A.*, COALESCE(B.Item_SKU, '') Item_SKU
		FROM POS_TrxAdjustment_Detail A
		INNER JOIN POS_TrxAdjustment_Header HDR ON A.DOCNUMBER=HDR.DOCNUMBER
		INNER JOIN POS_ItemVariant B ON A.Item_Number=B.Item_Number and A.LineItem_Option=B.LineItem_Option and HDR.Site_ID=B.Site_ID
		WHERE A.DOCNUMBER = @DOCNUMBER
		UNION
		SELECT A.*, COALESCE(B.Item_SKU, '') Item_SKU
		FROM POS_TrxAdjustment_Detail A
		INNER JOIN POS_TrxAdjustment_Header HDR ON A.DOCNUMBER=HDR.DOCNUMBER
		INNER JOIN POS_Item B ON A.Item_Number=B.Item_Number and HDR.Site_ID=B.Site_ID
		WHERE A.DOCNUMBER = @DOCNUMBER and A.Item_Number not in(select X.Item_Number from POS_ItemVariant X)
	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000),@ErrorSeverity INT,@ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState)
	END CATCH
END