create or alter proc TRX_Adjustment_GetDataList
(
	@Reason nvarchar(30),
	@Store_ID nvarchar(20),
	@Site_ID nvarchar(20)
)
AS          
BEGIN
	BEGIN TRY
		SELECT A.DOCNUMBER, A.DOCDATE, A.Reason, COALESCE(C.Store_Name, '') Store_Name, A.Site_ID, A.Site_Name, ISNULL(QTY, 0) QUANTITY
		FROM POS_TrxAdjustment_Header A
		INNER JOIN (
			SELECT DOCNUMBER, COUNT(DOCNUMBER) QTY
			FROM POS_TrxAdjustment_Detail
			GROUP BY DOCNUMBER
		) B ON A.DOCNUMBER=B.DOCNUMBER
		left join POS_Set_Site C ON A.Site_ID=C.Site_ID
		WHERE 1=1 and
		(A.Reason = @Reason or @Reason = '') and
		(C.Store_ID = @Store_ID or @Store_ID = '') and
		(A.Site_ID = @Site_ID or @Site_ID = '')
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