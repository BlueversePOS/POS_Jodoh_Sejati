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
		SELECT COALESCE(ITM.Category_ID, '') Category_ID, COALESCE(CAT.Category_Name, '') Category_Name, ISNULL(COUNT(DTL.Item_Number), 0) Item_Sold, 
		ISNULL(SUM(DTL.Item_Price), 0) Net_Sales, ISNULL(SUM(DTL.Item_Cost), 0) CostOfGoods, ISNULL(SUM(DTL.Item_Price), 0) - ISNULL(SUM(DTL.Item_Cost), 0) GrossProfit
		FROM POS_TrxHeader_HIST HDR with (nolock)
		LEFT JOIN POS_TrxDetail_HIST DTL with (nolock) ON HDR.DOCNUMBER=DTL.DOCNUMBER
		LEFT JOIN POS_Item ITM with (nolock) ON DTL.Item_Number=ITM.Item_Number
		LEFT JOIN POS_CategoryItem CAT with (nolock) on ITM.Category_ID=CAT.Category_ID
		WHERE HDR.DOCNUMBER not in(SELECT DISTINCT HDR.DOCNUMBER FROM POS_TrxRefund_HIST HDR with (nolock))
		AND (HDR.Created_Date BETWEEN CAST(@DateFrom as date) and CAST(@DateTo as date)
		OR HDR.Modified_Date BETWEEN CAST(@DateFrom as date) and CAST(@DateTo as date))
		AND ((CAST(HDR.Created_time as time) > CAST(@TimeFrom as time) and CAST(HDR.Created_time as time) < CAST(@TimeTo as time)) OR @FilterTime=0)
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
exec TRX_ReportsCategory_GetDataList '2024-03-01', '2024-03-30', 0, '', ''
*/