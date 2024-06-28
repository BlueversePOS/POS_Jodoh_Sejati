create or alter proc TRX_GetListPayInPayOut
(
	@Batch_ID nvarchar(20)
)
AS          
BEGIN
	BEGIN TRY
		SELECT Batch_ID, Pay_ID, Type_CashManagement, Amount, Notes, POS_ID,
		CASE WHEN Type_CashManagement=1 THEN 'Pay In'
		WHEN Type_CashManagement=2 THEN 'Pay Out' ELSE '' END PaymentType
		FROM POS_CashManagementCM WITH(NOLOCK)
		WHERE RTRIM(CM.Batch_ID)=RTRIM(@Batch_ID)
		ORDER BY Pay_ID
	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000),@ErrorSeverity INT,@ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState)
	END CATCH
END
GO