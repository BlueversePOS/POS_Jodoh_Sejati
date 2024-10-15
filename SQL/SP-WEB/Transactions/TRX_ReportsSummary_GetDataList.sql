create or alter proc TRX_ReportsSummary_GetDataList
(
	@DateFrom datetime='1900-01-01',
	@DateTo datetime='1900-01-01',
	@FilterTime int=0,
	@TimeFrom datetime='1900-01-01',
	@TimeTo datetime='1900-01-01',
	@Employee_ID varchar(40)=''
)
AS
BEGIN
	BEGIN TRY
		declare @UserID varchar(30)
		select top 1 @UserID=UserID from POS_Employee
		where Employee_ID=@Employee_ID

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

		declare @temp table(DateValue datetime)

		;WITH DateRange AS (
			SELECT CAST(@DateFrom as date) AS DateValue
			UNION ALL
			SELECT CAST(DATEADD(DAY, 1, DateValue) as date)
			FROM DateRange
			WHERE DateValue < @DateTo
		)
		
		insert into @temp(DateValue)
		SELECT DateValue FROM DateRange
		OPTION (MAXRECURSION 0);

		DROP TABLE IF EXISTS #TempTable
		
		create table #TempTable(DOCDATE datetime, Gross_Sales numeric(19,2), Refund_Amount numeric(19,2), 
		Discount_Amount numeric(19,2), Net_Sales numeric(19,2), CostofGoods numeric(19,2), Gross_Profit numeric(19,2))
		
		insert into #TempTable(DOCDATE, Gross_Sales, Refund_Amount, Discount_Amount, Net_Sales, CostofGoods, Gross_Profit)
		select DT.DateValue, SUM(ISNULL(Gross_Sales, 0)) Gross_Sales, SUM(ISNULL(Refund_Amount, 0)) Refund_Amount, SUM(ISNULL(Discount_Amount, 0)) Discount_Amount, 
		SUM(ISNULL(Net_Sales, 0)) Net_Sales, SUM(ISNULL(CostofGoods, 0)) CostofGoods, SUM(ISNULL(Gross_Profit, 0)) Gross_Profit
		from @temp DT
		left join (
			select DOCDATE, SUM(Item_Price * Quantity) Gross_Sales, SUM((Item_Price * Quantity) - (ISNULL(Discount_Amount, 0) * Quantity)) Net_Sales, SUM(Item_Cost * Quantity) CostofGoods,
			SUM(Discount_Amount) Discount_Amount, SUM((Item_Price * Quantity) - (ISNULL(Discount_Amount, 0) * Quantity)) - SUM(Item_Cost * Quantity) Gross_Profit, 0 Refund_Amount
			from POS_TrxDetail_HIST DTL
			where DTL.DOCNUMBER not in(SELECT DISTINCT RFD.DOCNUMBER FROM POS_TrxRefund_HIST RFD)
			and DTL.Quantity > 0
			and (DTL.Created_Date BETWEEN CAST(@DateFrom as date) and CAST(@DateTo as date)
			OR DTL.Modified_Date BETWEEN CAST(@DateFrom as date) and CAST(@DateTo as date))
			AND ((CAST(DTL.Created_time as time) > CAST(@TimeFrom as time) and CAST(DTL.Created_time as time) < CAST(@TimeTo as time)) OR @FilterTime=0)
			AND (Created_User=@UserID or @UserID='')
			GROUP BY DOCDATE
			union 
			select DOCDATE, 0 Gross_Sales, 0 Net_Sales, 0 CostofGoods, 0 Discount_Amount, 0 Gross_Profit, SUM(RFD.ORIGTOTAL) Refund_Amount
			from POS_TrxRefund_HIST RFD
			where (RFD.Created_Date BETWEEN CAST(@DateFrom as date) and CAST(@DateTo as date)
			OR RFD.Modified_Date BETWEEN CAST(@DateFrom as date) and CAST(@DateTo as date))
			AND ((CAST(RFD.Created_time as time) > CAST(@TimeFrom as time) and CAST(RFD.Created_time as time) < CAST(@TimeTo as time)) OR @FilterTime=0)
			AND (Created_User=@UserID or @UserID='')
			GROUP BY DOCDATE
		) x on CAST(DT.DateValue as date)=CAST(x.DOCDATE as date)
		GROUP BY DT.DateValue
		OPTION (MAXRECURSION 0);

		select * from #TempTable

	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000),@ErrorSeverity INT,@ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState)
	END CATCH
END
GO
