create or alter proc TRX_ReportsItems_GetDataList
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
		SELECT DISTINCT ITM.Item_Number, 
		CASE WHEN DTL.LineItem_Option=0 THEN ITM.Item_Description ELSE IVR.Variant_Name END As Item_Description, 
		CASE WHEN DTL.LineItem_Option=0 THEN 0 ELSE IVR.LineItem_Option END As LineItem_Option, 
		CASE WHEN DTL.LineItem_Option=0 THEN '' ELSE IVR.Item_SKU END As Item_SKU, 
		CASE WHEN DTL.LineItem_Option=0 THEN COALESCE(CAT.Category_Name, '') ELSE '' END As Category_Name, 
		ISNULL(DTL.Quantity, 0) Quantity, ISNULL(DTL.Gross_Sales, 0) Gross_Sales, ISNULL(DTL.Net_Sales, 0) Net_Sales,
		ISNULL(DTL.CostofGoods, 0) CostofGoods, ISNULL(DTL.Gross_Profit, 0) Gross_Profit
		FROM POS_Item ITM with (nolock)
		INNER JOIN POS_ItemVariant IVR with (nolock) ON ITM.Item_Number=IVR.Item_Number
		LEFT JOIN POS_CategoryItem CAT with (nolock) ON ITM.Category_ID=CAT.Category_ID
		OUTER APPLY(
			select Item_Number, 0 LineItem_Option, SUM(Quantity) Quantity, SUM((Item_Price * Quantity) - ISNULL(Discount_Amount, 0)) Gross_Sales, SUM((Item_Price * Quantity) - ISNULL(Discount_Amount, 0))/1.11 Net_Sales,
			SUM(Item_Cost * Quantity) CostofGoods, (SUM((Item_Price * Quantity) - ISNULL(Discount_Amount, 0))) - SUM(Item_Cost * Quantity) Gross_Profit
			from POS_TrxDetail_HIST DTL
			where DTL.DOCNUMBER not in(SELECT DISTINCT RFD.DOCNUMBER FROM POS_TrxRefund_HIST RFD with (nolock))
			and DTL.Item_Number=ITM.Item_Number
			and (DTL.Created_Date BETWEEN CAST(@DateFrom as date) and CAST(@DateTo as date)
			OR DTL.Modified_Date BETWEEN CAST(@DateFrom as date) and CAST(@DateTo as date))
			AND ((CAST(DTL.Created_time as time) > CAST(@TimeFrom as time) and CAST(DTL.Created_time as time) < CAST(@TimeTo as time)) OR @FilterTime=0)
			GROUP BY Item_Number
			UNION
			select Item_Number, LineItem_Option, SUM(Quantity) Quantity, SUM((Item_Price * Quantity) - ISNULL(Discount_Amount, 0)) Gross_Sales, SUM((Item_Price * Quantity) - ISNULL(Discount_Amount, 0))/1.11 Net_Sales,
			SUM(Item_Cost * Quantity) CostofGoods, (SUM((Item_Price * Quantity) - ISNULL(Discount_Amount, 0))) - SUM(Item_Cost * Quantity) Gross_Profit
			from POS_TrxDetail_HIST DTL
			where DTL.DOCNUMBER not in(SELECT DISTINCT RFD.DOCNUMBER FROM POS_TrxRefund_HIST RFD with (nolock))
			and DTL.Item_Number=ITM.Item_Number and DTL.LineItem_Option=IVR.LineItem_Option
			and (DTL.Created_Date BETWEEN CAST(@DateFrom as date) and CAST(@DateTo as date)
			OR DTL.Modified_Date BETWEEN CAST(@DateFrom as date) and CAST(@DateTo as date))
			AND ((CAST(DTL.Created_time as time) > CAST(@TimeFrom as time) and CAST(DTL.Created_time as time) < CAST(@TimeTo as time)) OR @FilterTime=0)
			GROUP BY Item_Number, LineItem_Option
		) DTL
		where Quantity > 0
		ORDER BY ITM.Item_Number, LineItem_Option
	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000),@ErrorSeverity INT,@ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState)
	END CATCH
END
GO
