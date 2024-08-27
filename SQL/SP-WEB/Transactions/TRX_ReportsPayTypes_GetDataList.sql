create or alter proc TRX_ReportsPayTypes_GetDataList
(
	@DateFrom datetime,
	@DateTo datetime,
	@FilterTime int=0,
	@TimeFrom datetime,
	@TimeTo datetime
)
AS          
BEGIN
	BEGIN TRY
		SELECT PAY.Payment_ID, PAY.Payment_Type, ISNULL(TRX.Payment_TRX, 0) Payment_TRX, ISNULL(TRX.Payment_Amount, 0) Payment_Amount,
		ISNULL(REF.Payment_REF, 0) Payment_REF, ISNULL(REF.Payment_Refund, 0) Payment_Refund, ISNULL(TRX.Payment_Amount, 0) - ISNULL(REF.Payment_Refund, 0) Net_Amount
		FROM POS_Set_PayTypes PAY with (nolock)
		INNER JOIN (
			SELECT COUNT(X.DOCNUMBER) Payment_TRX, SUM(X.SUBTOTAL) Payment_Amount, X.Payment_ID
			FROM POS_TrxPayTypes_HIST X with (nolock)
			WHERE DOCNUMBER not in(select Y.DOCNUMBER from POS_TrxRefund_HIST Y with (nolock))
			AND DOCNUMBER in(select Y.DOCNUMBER from POS_TrxHeader_HIST Y with (nolock))
			AND (X.Created_Date BETWEEN CAST(@DateFrom as date) and CAST(@DateTo as date)
			OR X.Modified_Date BETWEEN CAST(@DateFrom as date) and CAST(@DateTo as date))
			AND ((CAST(X.Created_time as time) > CAST(@TimeFrom as time) and CAST(X.Created_time as time) < CAST(@TimeTo as time)) OR @FilterTime=0)
			GROUP BY X.Payment_ID
		) TRX ON TRX.Payment_ID=PAY.Payment_ID
		LEFT JOIN (
			SELECT COUNT(X.DOCNUMBER) Payment_REF, SUM(X.SUBTOTAL) Payment_Refund, X.Payment_ID
			FROM POS_TrxPayTypes_HIST X with (nolock)
			WHERE DOCNUMBER in(select Y.DOCNUMBER from POS_TrxRefund_HIST Y with (nolock))
			AND DOCNUMBER in(select Y.DOCNUMBER from POS_TrxHeader_HIST Y with (nolock))
			AND (X.Created_Date BETWEEN CAST(@DateFrom as date) and CAST(@DateTo as date)
			OR X.Modified_Date BETWEEN CAST(@DateFrom as date) and CAST(@DateTo as date))
			AND ((CAST(X.Created_time as time) > CAST(@TimeFrom as time) and CAST(X.Created_time as time) < CAST(@TimeTo as time)) OR @FilterTime=0)
			GROUP BY X.Payment_ID
		) REF ON TRX.Payment_ID=PAY.Payment_ID
		ORDER BY PAY.Payment_Type
	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000),@ErrorSeverity INT,@ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState)
	END CATCH
END
GO
/*
exec TRX_ReportsPayTypes_GetDataList '2024-07-16', '2024-08-14', 0, '', ''
*/