create or alter proc TRX_GetTransactionHist
(
	@DOCNUMBER nvarchar(40)='',
	@DateFrom Datetime='1900-01-01',
	@DateTo Datetime='1900-01-01',
	@SalesType_ID nvarchar(40)='',
	@Search nvarchar(MAX)=''
)
AS          
BEGIN
	BEGIN TRY
		IF @DOCNUMBER=''
		BEGIN
			select distinct HDR.DOCNUMBER, HDR.DOCTYPE, HDR.DOCDATE, HDR.Store_ID, HDR.SalesType_ID, HDR.CustName, COALESCE(SLS.SalesType_Name, '') SalesType_Name, 
			COALESCE(PAY.Payment_ID, '') Payment_ID, COALESCE(PYT.Payment_Name, '') Payment_Name, HDR.Total_Line_Item, HDR.ORIGTOTAL, ISNULL(PAY.SUBTOTAL, HDR.SUBTOTAL) SUBTOTAL, 
			ISNULL(PAY.Amount_Tendered, HDR.Amount_Tendered) Amount_Tendered, HDR.Tax_Amount, HDR.Discount_ID, HDR.Discount_Amount, HDR.Amount_Tendered, HDR.Change_Amount, 
			HDR.Batch_ID, HDR.Created_User, HDR.Created_Date, HDR.Created_time, COALESCE(RFN.REFUNDNUMBER, '') REFUNDNUMBER, COALESCE(RFN.SUBTOTAL, 0) Amt_Refund,
			CASE WHEN COALESCE(EMP.Employee_Name, '') <> '' THEN EMP.Employee_Name
			WHEN COALESCE(ACC.Business_Name, '')  <> '' THEN ACC.Business_Name ELSE '' END UserName
			from POS_TrxHeader_HIST HDR
			LEFT JOIN POS_TrxPayTypes_HIST PAY ON HDR.DOCNUMBER=PAY.DOCNUMBER
			LEFT JOIN POS_Set_Paytypes PYT ON PAY.Payment_ID=PYT.Payment_ID
			LEFT JOIN POS_TrxRefund_HIST RFN ON HDR.DOCNUMBER=RFN.DOCNUMBER
			LEFT JOIN POS_Employee EMP ON HDR.Created_User=EMP.Employee_ID
			LEFT JOIN POS_Account ACC ON HDR.Created_User=ACC.UserID
			LEFT JOIN POS_Set_Stores STO ON HDR.Store_ID=STO.Store_ID
			LEFT JOIN POS_Set_SalesType SLS ON HDR.SalesType_ID=SLS.SalesType_ID
			WHERE (RTRIM(HDR.DOCNUMBER)=RTRIM(@DOCNUMBER) OR @DOCNUMBER='')
			and CAST(HDR.DOCDATE as date) BETWEEN @DateFrom and @DateTo
			and (HDR.SalesType_ID=@SalesType_ID or @SalesType_ID='')
			and HDR.DOCNUMBER like '%'+@Search+'%'
		END
		ELSE
		BEGIN
			select distinct HDR.DOCNUMBER, HDR.DOCTYPE, HDR.DOCDATE, HDR.Store_ID, HDR.SalesType_ID, HDR.CustName, COALESCE(SLS.SalesType_Name, '') SalesType_Name, 
			ISNULL(DTL.Item_Price, 0) Item_Price, COALESCE(PAY.Payment_ID, '') Payment_ID, COALESCE(PYT.Payment_Name, '') Payment_Name, HDR.Total_Line_Item, HDR.ORIGTOTAL, 
			ISNULL(PAY.SUBTOTAL, HDR.SUBTOTAL) SUBTOTAL, ISNULL(PAY.Amount_Tendered, HDR.Amount_Tendered) Amount_Tendered, HDR.Tax_Amount, HDR.Discount_ID, HDR.Discount_Amount, 
			HDR.Amount_Tendered, HDR.Change_Amount, HDR.Batch_ID, HDR.Created_User, HDR.Created_Date, HDR.Created_time, ISNULL(DTL.Lineitmseq, 0) Lineitmseq, 
			COALESCE(DTL.Item_Number, '') Item_Number, COALESCE(DTL.Item_Description, '') Item_Description, COALESCE(ITV.Variant_Name, '') Variant_Name, 
			ISNULL(DTL.Quantity, 0) Quantity, COALESCE(DTL.UofM, '') UofM, COALESCE(DTL.Notes, '') Notes, COALESCE(RFN.REFUNDNUMBER, '') REFUNDNUMBER, COALESCE(RFN.SUBTOTAL, 0) Amt_Refund,
			CASE WHEN COALESCE(EMP.Employee_Name, '') <> '' THEN EMP.Employee_Name
			WHEN COALESCE(ACC.Business_Name, '')  <> '' THEN ACC.Business_Name ELSE '' END UserName
			from POS_TrxHeader_HIST HDR
			LEFT JOIN POS_TrxDetail_HIST DTL ON HDR.DOCNUMBER=DTL.DOCNUMBER
			LEFT JOIN POS_TrxPayTypes_HIST PAY ON HDR.DOCNUMBER=PAY.DOCNUMBER
			LEFT JOIN POS_Set_Paytypes PYT ON PAY.Payment_ID=PYT.Payment_ID
			LEFT JOIN POS_TrxRefund_HIST RFN ON HDR.DOCNUMBER=RFN.DOCNUMBER
			LEFT JOIN POS_Employee EMP ON HDR.Created_User=EMP.Employee_ID
			LEFT JOIN POS_Account ACC ON HDR.Created_User=ACC.UserID
			LEFT JOIN POS_Set_Stores STO ON HDR.Store_ID=STO.Store_ID
			LEFT JOIN POS_Set_SalesType SLS ON HDR.SalesType_ID=SLS.SalesType_ID
			LEFT JOIN (
				select distinct A.Item_Number, A.LineItem_Option, A.Variant_Name 
				FROM POS_ItemVariant A
				where A.Site_ID in(select Site_ID from POS_Set_Site where DefaultSite=1)
			)ITV ON DTL.Item_Number=ITV.Item_Number and DTL.LineItem_Option=ITV.LineItem_Option
			WHERE RTRIM(HDR.DOCNUMBER)=RTRIM(@DOCNUMBER)
		END
	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000),@ErrorSeverity INT,@ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState)
	END CATCH
END
