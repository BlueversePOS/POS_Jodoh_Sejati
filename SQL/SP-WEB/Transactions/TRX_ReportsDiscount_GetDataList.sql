create or alter proc TRX_ReportsDiscount_GetDataList
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
		SELECT DISTINCT HDR.Discount_ID, COALESCE(DIS.Discount_Name, '') Discount_Name, SUM(HDR.Discount_Amount) Discount_Amount, COUNT(HDR.DOCNUMBER) Disc_Applied
		FROM POS_TrxHeader_HIST HDR with (nolock)
		LEFT JOIN POS_Discount DIS with (nolock) ON HDR.Discount_ID=DIS.Discount_ID
		WHERE ISNULL(HDR.Discount_ID, '') <> ''
		AND HDR.DOCNUMBER not in(SELECT DISTINCT HDR.DOCNUMBER FROM POS_TrxRefund_HIST HDR with (nolock))
		AND (HDR.Created_Date BETWEEN CAST(@DateFrom as date) and CAST(@DateTo as date)
		OR HDR.Modified_Date BETWEEN CAST(@DateFrom as date) and CAST(@DateTo as date))
		AND ((CAST(HDR.Created_time as time) > CAST(@TimeFrom as time) and CAST(HDR.Created_time as time) < CAST(@TimeTo as time)) OR @FilterTime=0)
		GROUP BY HDR.Discount_ID, DIS.Discount_Name
	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000),@ErrorSeverity INT,@ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState)
	END CATCH
END
GO
/*
exec TRX_ReportsDiscount_GetDataList '2024-10-01', '2024-10-31', 0, '', ''
*/