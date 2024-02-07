create or alter proc TRX_Adjustment_GetDataHeader
(
	@DOCNUMBER nvarchar(20)
)
AS          
BEGIN
	BEGIN TRY
		SELECT *
		FROM POS_TrxAdjustment_Header A
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
exec TRX_Adjustment_GetDataHeader 'SA0001'
*/