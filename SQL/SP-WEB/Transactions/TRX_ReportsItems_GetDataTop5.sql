create or alter proc TRX_ReportsItems_GetDataTop5
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
		SELECT DISTINCT TOP 5 *
		FROM(
			SELECT DISTINCT DTL.Item_Number, DTL.Item_Description, COALESCE(ITM.Item_Color, '') Item_Color, SUM((DTL.Item_Price * DTL.Quantity) - ISNULL(DTL.Discount_Amount, 0)) Net_Sales
			FROM POS_TrxDetail_HIST DTL with (nolock)
			LEFT JOIN (
				select distinct Item_Number, Item_Description, Item_Color
				from POS_Item with (nolock)
			) ITM ON DTL.Item_Number=ITM.Item_Number
			WHERE DTL.DOCNUMBER not in(SELECT DISTINCT RFD.DOCNUMBER FROM POS_TrxRefund_HIST RFD with (nolock))
			AND (DTL.Created_Date BETWEEN CAST(@DateFrom as date) and CAST(@DateTo as date)
			OR DTL.Modified_Date BETWEEN CAST(@DateFrom as date) and CAST(@DateTo as date))
			AND ((CAST(DTL.Created_time as time) > CAST(@TimeFrom as time) and CAST(DTL.Created_time as time) < CAST(@TimeTo as time)) OR @FilterTime=0)
			GROUP BY DTL.Item_Number, DTL.Item_Description, ITM.Item_Color
		) X
		ORDER BY Net_Sales DESC
	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000),@ErrorSeverity INT,@ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState)
	END CATCH
END
GO
