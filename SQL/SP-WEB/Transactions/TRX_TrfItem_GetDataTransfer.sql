create or alter proc TRX_TrfItem_GetDataTransfer
(
@Status int,
@SourceSite_ID nvarchar(20),
@DestSite_ID nvarchar(20)
)
AS          
BEGIN
	BEGIN TRY
		select *
		from(
			select A.DOCNUMBER, A.DOCDATE DOCDATE, '1900-01-01' DATERECEIVED, A.SourceSite_ID, A.SourceSite_Name, 
			A.DestSite_ID, A.DestSite_Name, A.[Status], ISNULL(B.Qty_Transfer, 0) Qty_Transfer
			from POS_TrxItemTrf_HeaderTEMP A
			left join (
				select DOCNUMBER, SUM(ISNULL(Qty_Transfer, 0)) Qty_Transfer
				from POS_TrxItemTrf_DetailTEMP
				group by DOCNUMBER
			) B ON A.DOCNUMBER=B.DOCNUMBER
			where A.[Status]=@Status or @Status=0
			UNION
			select A.DOCNUMBER, A.DOCDATE DOCDATE, Modified_Date DATERECEIVED, A.SourceSite_ID, A.SourceSite_Name, 
			A.DestSite_ID, A.DestSite_Name, A.[Status], ISNULL(B.Qty_Transfer, 0) Qty_Transfer
			from POS_TrxItemTrf_HeaderPOST A
			left join (
				select DOCNUMBER, SUM(ISNULL(Qty_Transfer, 0)) Qty_Transfer
				from POS_TrxItemTrf_DetailPOST
				group by DOCNUMBER
			) B ON A.DOCNUMBER=B.DOCNUMBER
			where A.[Status]=@Status or @Status=0
		) X
		where (X.SourceSite_ID=@SourceSite_ID or @SourceSite_ID='')
		and (X.DestSite_ID=@DestSite_ID or @DestSite_ID='')
	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000),@ErrorSeverity INT,@ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState)
	END CATCH
END
GO
/*
exec TRX_TrfItem_GetDataTransfer 0, '', ''
*/