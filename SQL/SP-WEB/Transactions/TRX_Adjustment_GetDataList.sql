create or alter proc TRX_Adjustment_GetDataList
(
	@Reason nvarchar(30),
	@Store_ID nvarchar(20),
	@Site_ID nvarchar(20)
)
AS          
BEGIN
	BEGIN TRY
		SELECT A.DOCNUMBER, A.DOCDATE, A.Reason, COALESCE(C.Store_Name, '') Store_Name, A.Site_ID, A.Site_Name, SUM(ISNULL(QTY, 0)) QUANTITY
		FROM POS_TrxAdjustment_Header A
		INNER JOIN (
			SELECT DOCNUMBER, 
			CASE
			WHEN LOWER(Reason) = 'inventory count' THEN ISNULL(Counted_Stock, 0)
			WHEN LOWER(Reason) = 'receive items' THEN ISNULL(Qty_Add_Stock, 0)
			ELSE ISNULL(Qty_Remove_Stock, 0) END QTY
			FROM POS_TrxAdjustment_Detail
		) B ON A.DOCNUMBER=B.DOCNUMBER
		left join POS_Set_Site C ON A.Site_ID=C.Site_ID
		WHERE 1=1 and
		(A.Reason = @Reason or @Reason = '') and
		(C.Store_ID = @Store_ID or @Store_ID = '') and
		(A.Site_ID = @Site_ID or @Site_ID = '')
		GROUP BY A.DOCNUMBER, A.DOCDATE, A.Reason, C.Store_Name, A.Site_ID, A.Site_Name
	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000),@ErrorSeverity INT,@ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState)
	END CATCH
END
GO
/*
exec TRX_Adjustment_GetDataList '', '', ''
*/