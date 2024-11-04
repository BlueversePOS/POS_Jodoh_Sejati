create or alter proc TRX_ReportsSummary_GetDataChart
(
	@DateFrom datetime='1900-01-01',
	@DateTo datetime='1900-01-01',
	@FilterTime int=0,
	@TimeFrom datetime='1900-01-01',
	@TimeTo datetime='1900-01-01',
	@FilterChart int=1,
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
		
		create table #TempTable(DOCDATE datetime, Amount numeric(19,2))
		
		insert into #TempTable(DOCDATE, Amount)
		select DateValue, ISNULL(Amount, 0) Amount
		from @temp DT
		left join(
			select DOCDATE, SUM(Item_Price * Quantity) Amount
			from POS_TrxDetail_HIST DTL
			left join POS_Account ACC ON DTL.Created_User=ACC.UserID
			left join POS_Employee EMP ON DTL.Created_User=EMP.UserID or EMP.UserID=ACC.Business_Name
			where DTL.DOCNUMBER not in(SELECT DISTINCT RFD.DOCNUMBER FROM POS_TrxRefund_HIST RFD)
			and DTL.Quantity > 0
			and (DTL.Created_Date BETWEEN CAST(@DateFrom as date) and CAST(@DateTo as date)
			OR DTL.Modified_Date BETWEEN CAST(@DateFrom as date) and CAST(@DateTo as date))
			AND ((CAST(DTL.Created_time as time) > CAST(@TimeFrom as time) and CAST(DTL.Created_time as time) < CAST(@TimeTo as time)) OR @FilterTime=0)
			AND (DTL.Created_User=@UserID or EMP.Employee_ID=@Employee_ID or ISNULL(@UserID, '')='') AND @FilterChart=1 -- Gross Sales
			group by DOCDATE
			union 
			select DOCDATE, SUM(RFD.ORIGTOTAL) Amount
			from POS_TrxRefund_HIST RFD
			left join POS_Account ACC ON RFD.Created_User=ACC.UserID
			left join POS_Employee EMP ON RFD.Created_User=EMP.UserID or EMP.UserID=ACC.Business_Name
			where (RFD.Created_Date BETWEEN CAST(@DateFrom as date) and CAST(@DateTo as date)
			OR RFD.Modified_Date BETWEEN CAST(@DateFrom as date) and CAST(@DateTo as date))
			AND ((CAST(RFD.Created_time as time) > CAST(@TimeFrom as time) and CAST(RFD.Created_time as time) < CAST(@TimeTo as time)) OR @FilterTime=0)
			AND (RFD.Created_User=@UserID or EMP.Employee_ID=@Employee_ID  or ISNULL(@UserID, '')='') AND @FilterChart=2 -- Refund
			group by DOCDATE
			union 
			select DOCDATE, SUM(Discount_Amount) Amount
			from POS_TrxDetail_HIST DTL
			left join POS_Account ACC ON DTL.Created_User=ACC.UserID
			left join POS_Employee EMP ON DTL.Created_User=EMP.UserID or EMP.UserID=ACC.Business_Name
			where DTL.DOCNUMBER not in(SELECT DISTINCT RFD.DOCNUMBER FROM POS_TrxRefund_HIST RFD)
			and DTL.Quantity > 0
			and (DTL.Created_Date BETWEEN CAST(@DateFrom as date) and CAST(@DateTo as date)
			OR DTL.Modified_Date BETWEEN CAST(@DateFrom as date) and CAST(@DateTo as date))
			AND ((CAST(DTL.Created_time as time) > CAST(@TimeFrom as time) and CAST(DTL.Created_time as time) < CAST(@TimeTo as time)) OR @FilterTime=0)
			AND (DTL.Created_User=@UserID or EMP.Employee_ID=@Employee_ID or ISNULL(@UserID, '')='') AND @FilterChart=3 -- Discount
			group by DOCDATE
			union 
			select DOCDATE, SUM((Item_Price * Quantity) - (ISNULL(Discount_Amount, 0) * Quantity)) Amount
			from POS_TrxDetail_HIST DTL
			left join POS_Account ACC ON DTL.Created_User=ACC.UserID
			left join POS_Employee EMP ON DTL.Created_User=EMP.UserID or EMP.UserID=ACC.Business_Name
			where DTL.DOCNUMBER not in(SELECT DISTINCT RFD.DOCNUMBER FROM POS_TrxRefund_HIST RFD)
			and DTL.Quantity > 0
			and (DTL.Created_Date BETWEEN CAST(@DateFrom as date) and CAST(@DateTo as date)
			OR DTL.Modified_Date BETWEEN CAST(@DateFrom as date) and CAST(@DateTo as date))
			AND ((CAST(DTL.Created_time as time) > CAST(@TimeFrom as time) and CAST(DTL.Created_time as time) < CAST(@TimeTo as time)) OR @FilterTime=0)
			AND (DTL.Created_User=@UserID or EMP.Employee_ID=@Employee_ID or ISNULL(@UserID, '')='') AND @FilterChart=4 -- Net Sales
			group by DOCDATE
			union 
			select DOCDATE, SUM((Item_Price * Quantity) - (ISNULL(Discount_Amount, 0) * Quantity)) - SUM(Item_Cost * Quantity) Amount
			from POS_TrxDetail_HIST DTL
			left join POS_Account ACC ON DTL.Created_User=ACC.UserID
			left join POS_Employee EMP ON DTL.Created_User=EMP.UserID or EMP.UserID=ACC.Business_Name
			where DTL.DOCNUMBER not in(SELECT DISTINCT RFD.DOCNUMBER FROM POS_TrxRefund_HIST RFD)
			and DTL.Quantity > 0
			and (DTL.Created_Date BETWEEN CAST(@DateFrom as date) and CAST(@DateTo as date)
			OR DTL.Modified_Date BETWEEN CAST(@DateFrom as date) and CAST(@DateTo as date))
			AND ((CAST(DTL.Created_time as time) > CAST(@TimeFrom as time) and CAST(DTL.Created_time as time) < CAST(@TimeTo as time)) OR @FilterTime=0)
			AND (DTL.Created_User=@UserID or EMP.Employee_ID=@Employee_ID or ISNULL(@UserID, '')='') AND @FilterChart=5 -- Gross Profit
			group by DOCDATE
		) x on DT.DateValue=x.DOCDATE
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
