create or alter proc TRX_Adjustment_GetDataDetail
(
	@DOCNUMBER nvarchar(20)
)
AS          
BEGIN
	BEGIN TRY
		SELECT A.*, COALESCE(B.Item_SKU, '') Item_SKU
		FROM POS_TrxAdjustment_Detail A
		LEFT JOIN POS_Item B ON A.Item_Number=B.Item_Number
		WHERE A.DOCNUMBER = @DOCNUMBER
	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000),@ErrorSeverity INT,@ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState)
	END CATCH
END
GO
/*
exec TRX_Adjustment_GetDataDetail 'SA0001'
*/