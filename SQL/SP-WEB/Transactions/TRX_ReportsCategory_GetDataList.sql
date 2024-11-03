create or alter proc TRX_ReportsCategory_GetDataList
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
		SELECT DISTINCT COALESCE(ITM.Category_ID, '') Category_ID, COALESCE(CAT.Category_Name, '') Category_Name, ISNULL(COUNT(DTL.Quantity), 0) Item_Sold, 
		SUM(ISNULL(DTL.Item_Price, 0)) Net_Sales, SUM(ISNULL(DTL.Item_Cost, 0)) CostOfGoods, SUM(ISNULL(DTL.Item_Price, 0)) - SUM(ISNULL(DTL.Item_Cost, 0)) GrossProfit
		FROM POS_TrxDetail_HIST DTL with (nolock)
		LEFT JOIN (
			select distinct Item_Number, Category_ID
			from POS_Item with (nolock)
		) ITM ON DTL.Item_Number=ITM.Item_Number
		LEFT JOIN POS_CategoryItem CAT with (nolock) on ITM.Category_ID=CAT.Category_ID
		WHERE DTL.DOCNUMBER not in(SELECT DISTINCT HDR.DOCNUMBER FROM POS_TrxRefund_HIST HDR with (nolock))
		AND (DTL.Created_Date BETWEEN CAST(@DateFrom as date) and CAST(@DateTo as date)
		OR DTL.Modified_Date BETWEEN CAST(@DateFrom as date) and CAST(@DateTo as date))
		AND ((CAST(DTL.Created_time as time) > CAST(@TimeFrom as time) and CAST(DTL.Created_time as time) < CAST(@TimeTo as time)) OR @FilterTime=0)
		GROUP BY ITM.Category_ID, CAT.Category_Name
	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000),@ErrorSeverity INT,@ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState)
	END CATCH
END
GO
/*
exec TRX_ReportsCategory_GetDataList '2024-10-28', '2024-10-28', 0, '', ''
*/
