create or alter proc TRX_InvHistory_GetDataList
(
	@DateFrom datetime,
	@DateTo datetime,
	@Reason nvarchar(MAX),
	@Employee nvarchar(MAX),
	@Store_ID nvarchar(MAX),
	@Site_ID nvarchar(MAX),
	@SEARCH nvarchar(MAX)
)
AS          
BEGIN
	BEGIN TRY
		SELECT DISTINCT A.DOCNUMBER, A.DOCDATE, A.Item_Number, A.Item_Description, A.Site_ID, A.Site_Name, 
		A.Reason, A.Created_User, A.Created_Time, A.QTY_Adjustment, A.Qty_After_Stock, COALESCE(ACC.Business_Name, '') Username
		FROM(
			SELECT DISTINCT HDR.DOCNUMBER, HDR.DOCDATE, COALESCE(DTL.Item_Number, '') Item_Number, 
			COALESCE(DTL.Item_Description, '') Item_Description, HDR.Site_ID, HDR.Site_Name, HDR.Reason, HDR.Created_User, HDR.Created_Time,
			CASE
			WHEN LOWER(HDR.Reason) = 'inventory count' THEN ISNULL(DTL.Counted_Stock, 0)
			WHEN LOWER(HDR.Reason) = 'receive items' THEN ISNULL(DTL.Qty_Add_Stock, 0)
			ELSE ISNULL(DTL.Qty_Remove_Stock, 0) END QTY_Adjustment, ISNULL(DTL.Qty_After_Stock, 0) Qty_After_Stock
			FROM POS_TrxAdjustment_HeaderHIST HDR with(nolock)
			LEFT JOIN POS_TrxAdjustment_DetailHIST DTL with(nolock) ON HDR.DOCNUMBER=DTL.DOCNUMBER
			UNION
			SELECT DISTINCT HDR.DOCNUMBER, HDR.DOCDATE, COALESCE(DTL.Item_Number, '') Item_Number, COALESCE(DTL.Item_Description, '') Item_Description, HDR.DestSite_ID, HDR.DestSite_Name,
			'Transfer' Reason, HDR.Created_User, HDR.Created_Time, ISNULL(DTL.Qty_Transfer, 0) QTY_Adjustment, ISNULL(DTL.Dest_Stock, 0) Qty_After_Stock
			FROM POS_TrxItemTrf_HeaderHIST HDR with(nolock)
			LEFT JOIN POS_TrxItemTrf_DetailHIST DTL with(nolock) ON HDR.DOCNUMBER=DTL.DOCNUMBER
			UNION
			SELECT DISTINCT HDR.DOCNUMBER, HDR.DOCDATE, COALESCE(DTL.Item_Number, '') Item_Number, 
			COALESCE(DTL.Item_Description, '') Item_Description, HDR.Site_ID, HDR.Site_Name, 
			'Counted' Reason, HDR.Created_User, HDR.Created_Time, ISNULL(DTL.Counted_Stock, 0) QTY_Adjustment, ISNULL(DTL.Different_Stock, 0) Qty_After_Stock
			FROM POS_TrxInvCount_HeaderHIST HDR with(nolock)
			LEFT JOIN POS_TrxInvCount_DetailHIST DTL with(nolock) ON HDR.DOCNUMBER=DTL.DOCNUMBER
			UNION
			SELECT DISTINCT HDR.DOCNUMBER, HDR.DOCDATE, COALESCE(DTL.Item_Number, '') Item_Number, COALESCE(DTL.Item_Description, '') Item_Description,
			HDR.Site_ID, COALESCE(ST.Site_Name, '') Site_Name, 'Sale' Reason, HDR.Created_User, HDR.Created_Time, ISNULL(DTL.Quantity, 0) QTY_Adjustment, ISNULL(ITM.InStock, 0) Qty_After_Stock
			FROM POS_TrxHeader_HIST HDR with(nolock)
			LEFT JOIN POS_TrxDetail_HIST DTL with(nolock) ON HDR.DOCNUMBER=DTL.DOCNUMBER
			LEFT JOIN POS_Set_Site ST with(nolock) ON HDR.Site_ID=ST.Site_ID
			LEFT JOIN POS_Item ITM with(nolock) ON DTL.Item_Number=ITM.Item_Number
			UNION
			SELECT DISTINCT RFN.REFUNDNUMBER, RFN.DOCDATE, COALESCE(DTL.Item_Number, '') Item_Number, COALESCE(DTL.Item_Description, '') Item_Description,
			RFN.Site_ID, COALESCE(ST.Site_Name, '') Site_Name, 'Refund' Reason, RFN.Created_User, HDR.Created_Time, ISNULL(DTL.Quantity, 0) QTY_Adjustment, ISNULL(ITM.InStock, 0) Qty_After_Stock
			FROM POS_TrxRefund_HIST RFN
			LEFT JOIN POS_TrxHeader_HIST HDR with(nolock) ON RFN.DOCNUMBER=HDR.DOCNUMBER
			LEFT JOIN POS_TrxDetail_HIST DTL with(nolock) ON HDR.DOCNUMBER=DTL.DOCNUMBER
			LEFT JOIN POS_Set_Site ST with(nolock) ON HDR.Site_ID=ST.Site_ID
			LEFT JOIN POS_Item ITM with(nolock) ON DTL.Item_Number=ITM.Item_Number
		) A
		LEFT JOIN POS_Account ACC with(nolock) ON A.Created_User=ACC.UserID
		WHERE CAST(A.DOCDATE as date) BETWEEN CAST(@DateFrom as date) AND CAST(@DateTo as date)
		AND A.Item_Description like '%'+@SEARCH+'%'
		AND A.Reason in(select value from STRING_SPLIT(@Reason, ','))
		--AND A.Created_User in(select value from STRING_SPLIT(@Employee, ','))
		--AND A.Store_ID in(select value from STRING_SPLIT(@Store_ID, ','))
		AND A.Site_ID in(select value from STRING_SPLIT(@Site_ID, ','))
	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000),@ErrorSeverity INT,@ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState)
	END CATCH
END
GO
/*
exec TRX_InvHistory_GetDataList '2024-03-01', '2024-03-30', '', '', '', '', ''
exec TRX_InvHistory_GetDataList @DateFrom='2024-03-01 00:00:00',@DateTo='2024-03-31 00:00:00',@Reason=N'Sale,Refund,Receive items,Counted,Transfer,Inventory count,Damage,Loss',
@Employee=N'EMP0001',@Store_ID=N'STR0001',@Site_ID=N'SITE0001,SITE0002,SITE0003',@SEARCH=N''
*/