create or alter proc TRX_ReportsReceipts_GetDetail --'INV-06-08-2024-008'
(
	@DOCNUMBER varchar(40)=''
)
AS
BEGIN
	BEGIN TRY
		select distinct x.DOCNUMBER, x.DOCDATE, x.Item_Description, x.Store_ID, x.Store_Name, x.Employee_Name, 
		x.CustName, x.TrxType, x.Quantity, x.Item_Price, x.Discount_Amount, Subtotal, x.Total
		from (
			select HDR.DOCNUMBER, HDR.DOCDATE, HDR.Store_ID, ISNULL(ST.Store_Name, '') Store_Name, 
			ISNULL(EMP.Employee_Name, '') Employee_Name, HDR.CustName, 'Sale' TrxType, HDR.ORIGTOTAL Total,
			DTL.Item_Description, DTL.Quantity, DTL.Item_Price, DTL.Discount_Amount, (DTL.Quantity * DTL.Item_Price) Subtotal
			from POS_TrxHeader_HIST HDR with(nolock)
			inner join POS_TrxDetail_HIST DTL with(nolock) on HDR.DOCNUMBER=DTL.DOCNUMBER
			left join POS_Set_Stores ST ON HDR.Store_ID=ST.Store_ID
			left join POS_Employee EMP ON HDR.Created_User=EMP.UserID
			where HDR.DOCNUMBER not in(SELECT DISTINCT RFD.DOCNUMBER FROM POS_TrxRefund_HIST RFD)
			and HDR.DOCNUMBER=@DOCNUMBER
			union 
			select RFD.REFUNDNUMBER, RFD.Refund_Date, RFD.Store_ID, ISNULL(ST.Store_Name, '') Store_Name, 
			ISNULL(EMP.Employee_Name, '') Employee_Name, RFD.CustName, 'Refund' TrxType, RFD.SUBTOTAL Total,
			DTL.Item_Description, DTL.Quantity, DTL.Item_Price, DTL.Discount_Amount, (DTL.Quantity * DTL.Item_Price) Subtotal
			from POS_TrxRefund_HIST RFD with(nolock)
			inner join POS_TrxDetail_HIST DTL with(nolock) on RFD.DOCNUMBER=DTL.DOCNUMBER
			left join POS_Set_Stores ST ON RFD.Store_ID=ST.Store_ID
			left join POS_Employee EMP ON RFD.Refund_User=EMP.UserID
			where RFD.REFUNDNUMBER=@DOCNUMBER
		) x

	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000),@ErrorSeverity INT,@ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState)
	END CATCH
END
GO
