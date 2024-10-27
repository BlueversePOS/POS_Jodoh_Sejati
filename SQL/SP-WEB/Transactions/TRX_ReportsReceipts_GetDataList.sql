create or alter proc TRX_ReportsReceipts_GetDataList
(
	@DateFrom datetime='1900-01-01',
	@DateTo datetime='1900-01-01',
	@FilterTime int=0,
	@TimeFrom datetime='1900-01-01',
	@TimeTo datetime='1900-01-01',
	@Employee_ID varchar(40)='',
	@Store_ID varchar(40)='',
	@Status int=0
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

		select x.DOCNUMBER, x.DOCDATE, x.Store_ID, x.Store_Name, x.Employee_Name, x.CustName, x.TrxType, x.Total
		from (
			select HDR.DOCNUMBER, HDR.DOCDATE, HDR.Store_ID, ISNULL(ST.Store_Name, '') Store_Name, 
			ISNULL(EMP.Employee_Name, '') Employee_Name, HDR.CustName, 'Sale' TrxType, HDR.ORIGTOTAL Total
			from POS_TrxHeader_HIST HDR with(nolock)
			left join POS_Set_Stores ST ON HDR.Store_ID=ST.Store_ID
			left join POS_Employee EMP ON HDR.Created_User=EMP.UserID
			where HDR.DOCNUMBER not in(SELECT DISTINCT RFD.DOCNUMBER FROM POS_TrxRefund_HIST RFD)
			and (HDR.Created_Date BETWEEN CAST(@DateFrom as date) and CAST(@DateTo as date)
			OR HDR.Modified_Date BETWEEN CAST(@DateFrom as date) and CAST(@DateTo as date))
			AND ((CAST(HDR.Created_time as time) > CAST(@TimeFrom as time) and CAST(HDR.Created_time as time) < CAST(@TimeTo as time)) OR @FilterTime=0)
			AND (HDR.Created_User=@UserID or @Employee_ID='') AND (HDR.Store_ID=@Store_ID or @Store_ID='')
			and (@Status=1 or @Status=0)
			union 
			select RFD.REFUNDNUMBER, RFD.Refund_Date, RFD.Store_ID, ISNULL(ST.Store_Name, '') Store_Name, 
			ISNULL(EMP.Employee_Name, '') Employee_Name, RFD.CustName, 'Refund' TrxType, RFD.SUBTOTAL Total
			from POS_TrxRefund_HIST RFD
			left join POS_Set_Stores ST ON RFD.Store_ID=ST.Store_ID
			left join POS_Employee EMP ON RFD.Refund_User=EMP.UserID
			where RFD.Refund_Date BETWEEN CAST(@DateFrom as date) and CAST(@DateTo as date)
			AND ((CAST(RFD.Refund_Time as time) > CAST(@TimeFrom as time) and CAST(RFD.Created_time as time) < CAST(@TimeTo as time)) OR @FilterTime=0)
			AND (RFD.Refund_User=@UserID or @Employee_ID='') AND (RFD.Store_ID=@Store_ID or @Store_ID='')
			and (@Status=2 or @Status=0)
		) x

	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000),@ErrorSeverity INT,@ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState)
	END CATCH
END
GO
