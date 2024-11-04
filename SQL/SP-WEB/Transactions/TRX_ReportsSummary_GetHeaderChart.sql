create or alter proc TRX_ReportsSummary_GetHeaderChart
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

		select 0 Quantity, SUM(ISNULL(Gross_Sales, 0)) Gross_Sales, SUM(ISNULL(Refund_Amount, 0)) Refund_Amount, 
		SUM(ISNULL(Discount_Amount, 0)) Discount_Amount, SUM(ISNULL(Net_Sales, 0)) Net_Sales, SUM(ISNULL(Gross_Profit, 0)) Gross_Profit
		from(
			select SUM(HDR.ORIGTOTAL) Gross_Sales, SUM(HDR.SUBTOTAL) Net_Sales, SUM(HDR.Discount_Amount) Discount_Amount, 
			SUM(HDR.ORIGTOTAL) - SUM(ISNULL(DTL.Item_Cost, 0)) Gross_Profit, 0 Refund_Amount
			from POS_TrxHeader_HIST HDR
			left join (
				select DOCNUMBER, SUM(Item_Cost * Quantity) Item_Cost
				from POS_TrxDetail_HIST
				GROUP BY DOCNUMBER
			) DTL ON HDR.DOCNUMBER=DTL.DOCNUMBER
			left join POS_Account ACC ON HDR.Created_User=ACC.UserID
			left join POS_Employee EMP ON HDR.Created_User=EMP.UserID or EMP.UserID=ACC.Business_Name
			where HDR.DOCNUMBER not in(SELECT DISTINCT RFD.DOCNUMBER FROM POS_TrxRefund_HIST RFD)
			and (HDR.Created_Date BETWEEN CAST(@DateFrom as date) and CAST(@DateTo as date)
			OR HDR.Modified_Date BETWEEN CAST(@DateFrom as date) and CAST(@DateTo as date))
			AND ((CAST(HDR.Created_time as time) > CAST(@TimeFrom as time) and CAST(HDR.Created_time as time) < CAST(@TimeTo as time)) OR @FilterTime=0)
			AND (HDR.Created_User=@UserID or EMP.Employee_ID=@Employee_ID or ISNULL(@UserID, '')='')
			union 
			select 0 Gross_Sales, 0 Net_Sales, 0 Discount_Amount, 0 Gross_Profit, SUM(RFD.ORIGTOTAL) ORIGTOTAL
			from POS_TrxRefund_HIST RFD
			left join POS_Account ACC ON RFD.Created_User=ACC.UserID
			left join POS_Employee EMP ON RFD.Created_User=EMP.UserID or EMP.UserID=ACC.Business_Name
			where (RFD.Created_Date BETWEEN CAST(@DateFrom as date) and CAST(@DateTo as date)
			OR RFD.Modified_Date BETWEEN CAST(@DateFrom as date) and CAST(@DateTo as date))
			AND ((CAST(RFD.Created_time as time) > CAST(@TimeFrom as time) and CAST(RFD.Created_time as time) < CAST(@TimeTo as time)) OR @FilterTime=0)
			AND (RFD.Created_User=@UserID or EMP.Employee_ID=@Employee_ID or ISNULL(@UserID, '')='')
		) x
	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000),@ErrorSeverity INT,@ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState)
	END CATCH
END
GO
