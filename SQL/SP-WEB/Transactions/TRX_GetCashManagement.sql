create or alter proc TRX_GetCashManagement
(
	@Batch_ID nvarchar(20)
)
AS          
BEGIN
	BEGIN TRY
		SELECT PAYIN.Batch_ID, PAYIN.Amount AMOUNT_IN, ISNULL(PAYOUT.AMOUNT_OUT, 0) AMOUNT_OUT
		FROM POS_CashManagement PAYIN WITH(NOLOCK)
		LEFT JOIN (
			SELECT X.Batch_ID, X.Type_CashManagement, X.Amount AMOUNT_OUT, X.Notes, X.POS_ID 
			FROM POS_CashManagement X WITH(NOLOCK)
			WHERE RTRIM(Batch_ID)=RTRIM(@Batch_ID) and Type_CashManagement='2'
		) PAYOUT ON PAYIN.Batch_ID=PAYOUT.Batch_ID
		WHERE RTRIM(PAYIN.Batch_ID)=RTRIM(@Batch_ID) and PAYIN.Type_CashManagement='1'
	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000),@ErrorSeverity INT,@ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState)
	END CATCH
END
GO