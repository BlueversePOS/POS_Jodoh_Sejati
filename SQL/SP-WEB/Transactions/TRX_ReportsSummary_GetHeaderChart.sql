create or alter proc TRX_ReportsSummary_GetHeaderChart
(
	@DateFrom datetime='1900-01-01',
	@DateTo datetime='1900-01-01',
	@FilterTime int=0,
	@TimeFrom datetime='1900-01-01',
	@TimeTo datetime='1900-01-01'
)
AS          
BEGIN
	BEGIN TRY
		declare @dateNow datetime = SYSDATETIMEOFFSET() AT TIME ZONE 'SE Asia Standard Time'
		if @DateFrom = '1900-01-01'
		begin
			set @DateFrom = DATEADD(DAY, -30, CAST(@dateNow as date))
		end
		if @DateTo = '1900-01-01'
		begin
			set @DateTo = CAST(@dateNow as date)
		end
		if @TimeTo = '1900-01-01'
		begin
			set @TimeTo = CAST(@dateNow as datetime)
		end

		select SUM(ISNULL(Quantity, 0)) Quantity, SUM(ISNULL(Gross_Sales, 0)) Gross_Sales, SUM(ISNULL(Refund_Amount, 0)) Refund_Amount, 
		SUM(ISNULL(Discount_Amount, 0)) Discount_Amount, SUM(ISNULL(Net_Sales, 0)) Net_Sales, SUM(ISNULL(Gross_Profit, 0)) Gross_Profit
		from(
			select SUM(Quantity) Quantity, SUM(Item_Price * Quantity) Gross_Sales, SUM((Item_Price * Quantity) - (ISNULL(Discount_Amount, 0) * Quantity)) Net_Sales,
			SUM(Discount_Amount) Discount_Amount, SUM((Item_Price * Quantity) - (ISNULL(Discount_Amount, 0) * Quantity)) - SUM(Item_Cost * Quantity) Gross_Profit, 0 Refund_Amount
			from POS_TrxDetail_HIST DTL
			where DTL.DOCNUMBER not in(SELECT DISTINCT RFD.DOCNUMBER FROM POS_TrxRefund_HIST RFD)
			and DTL.Quantity > 0
			and (DTL.Created_Date BETWEEN CAST(@DateFrom as date) and CAST(@DateTo as date)
			OR DTL.Modified_Date BETWEEN CAST(@DateFrom as date) and CAST(@DateTo as date))
			AND ((CAST(DTL.Created_time as time) > CAST(@TimeFrom as time) and CAST(DTL.Created_time as time) < CAST(@TimeTo as time)) OR @FilterTime=0)
			union 
			select 0 Quantity, 0 Gross_Sales, 0 Net_Sales, 0 Discount_Amount, 0 Gross_Profit, SUM(RFD.ORIGTOTAL) ORIGTOTAL
			from POS_TrxRefund_HIST RFD
			where (RFD.Created_Date BETWEEN CAST(@DateFrom as date) and CAST(@DateTo as date)
			OR RFD.Modified_Date BETWEEN CAST(@DateFrom as date) and CAST(@DateTo as date))
			AND ((CAST(RFD.Created_time as time) > CAST(@TimeFrom as time) and CAST(RFD.Created_time as time) < CAST(@TimeTo as time)) OR @FilterTime=0)
		) x
	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000),@ErrorSeverity INT,@ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState)
	END CATCH
END
GO
