create or alter proc TRX_GetCashManagement
(
	@Batch_ID nvarchar(20)
)
AS          
BEGIN
	BEGIN TRY
		SELECT CM.Batch_ID, ISNULL(PAYIN.AMOUNT_IN, 0) AMOUNT_IN, ISNULL(PAYOUT.AMOUNT_OUT, 0) AMOUNT_OUT
		FROM POS_CashManagement CM WITH(NOLOCK)
		LEFT JOIN (
			SELECT X.Batch_ID, X.Type_CashManagement, SUM(ISNULL(X.Amount, 0)) AMOUNT_IN
			FROM POS_CashManagement X WITH(NOLOCK)
			WHERE RTRIM(Batch_ID)=RTRIM(@Batch_ID) and Type_CashManagement='1'
			GROUP BY X.Batch_ID, X.Type_CashManagement
		) PAYIN ON CM.Batch_ID=PAYIN.Batch_ID
		LEFT JOIN (
			SELECT X.Batch_ID, X.Type_CashManagement, SUM(ISNULL(X.Amount, 0)) AMOUNT_OUT
			FROM POS_CashManagement X WITH(NOLOCK)
			WHERE RTRIM(Batch_ID)=RTRIM(@Batch_ID) and Type_CashManagement='2'
			GROUP BY X.Batch_ID, X.Type_CashManagement
		) PAYOUT ON CM.Batch_ID=PAYOUT.Batch_ID
		WHERE RTRIM(CM.Batch_ID)=RTRIM(@Batch_ID)
	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000),@ErrorSeverity INT,@ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState)
	END CATCH
END
GO