create or alter proc TRX_TrfItem_GetDataTransferDTL
(
@DOCNUMBER nvarchar(20)
)
AS          
BEGIN
	BEGIN TRY
		select *
		from(
			select A.DOCNUMBER, A.DOCDATE, A.Lineitmseq, A.Item_Number, A.Item_Description, 
			ISNULL(B.LineItem_Option, 0) LineItem_Option, A.Item_SKU, A.Source_Stock, A.Dest_Stock, A.Qty_Transfer
			from POS_TrxItemTrf_DetailTEMP A
			inner join POS_TrxItemTrf_HeaderTEMP HDR ON A.DOCNUMBER=HDR.DOCNUMBER
			left join POS_ItemVariant B ON A.Item_Number=B.Item_Number and A.Item_SKU=B.Item_SKU and HDR.SourceSite_ID=B.Site_ID
			where A.DOCNUMBER=@DOCNUMBER
			UNION
			select A.DOCNUMBER, A.DOCDATE, A.Lineitmseq, A.Item_Number, A.Item_Description, 
			ISNULL(B.LineItem_Option, 0) LineItem_Option, A.Item_SKU, A.Source_Stock, A.Dest_Stock, A.Qty_Transfer
			from POS_TrxItemTrf_DetailPOST A
			inner join POS_TrxItemTrf_HeaderPOST HDR ON A.DOCNUMBER=HDR.DOCNUMBER
			left join POS_ItemVariant B ON A.Item_Number=B.Item_Number and A.Item_SKU=B.Item_SKU and HDR.SourceSite_ID=B.Site_ID
			where A.DOCNUMBER=@DOCNUMBER
		) X
	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000),@ErrorSeverity INT,@ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState)
	END CATCH
END
GO
/*
exec TRX_TrfItem_GetDataTransferDTL 'TRF0001'
*/