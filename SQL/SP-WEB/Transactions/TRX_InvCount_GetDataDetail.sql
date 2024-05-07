/*
exec TRX_InvCount_GetDataDetail @DOCNUMBER=N'IVC-31-03-2024-001'
*/
create or alter proc TRX_InvCount_GetDataDetail
(
	@DOCNUMBER nvarchar(20)
)
AS          
BEGIN
	BEGIN TRY
		IF NOT EXISTS(SELECT * FROM POS_TrxInvCount_HeaderTEMP with (nolock) WHERE RTRIM(DOCNUMBER)=RTRIM(@DOCNUMBER))
		and NOT EXISTS(SELECT * FROM POS_TrxInvCount_HeaderPOST with (nolock) WHERE RTRIM(DOCNUMBER)=RTRIM(@DOCNUMBER))
		and LEN(COALESCE(@DOCNUMBER, '')) > 0
		BEGIN
			RAISERROR('Document number not found', 16, 1)
		END

		SELECT A.DOCNUMBER, A.DOCDATE, A.Lineitmseq, A.Item_Number, A.Item_Description, A.Item_SKU, A.Expected_Stock, A.Counted_Stock, A.Different_Stock, 
		A.Item_Cost, A.Item_Cost_Different, A.Created_User, A.Created_Date, A.Created_time, A.Modified_User, A.Modified_Date, A.Modified_time, 
		ISNULL(B.Total_Different_Stock, 0) Total_Different_Stock, ISNULL(B.Total_Item_Cost_Different, 0) Total_Item_Cost_Different, ISNULL(C.LineItem_Option, 0) LineItem_Option
		FROM POS_TrxInvCount_DetailTEMP A with (nolock)
		LEFT JOIN (
			select DOCNUMBER, SUM(Different_Stock) Total_Different_Stock, SUM(Item_Cost_Different) Total_Item_Cost_Different
			from POS_TrxInvCount_DetailTEMP with (nolock)
			GROUP BY DOCNUMBER
		) B ON A.DOCNUMBER=B.DOCNUMBER
		LEFT JOIN POS_ItemVariant C with (nolock) ON A.Item_Number=C.Item_Number and A.Item_SKU=C.Item_SKU
		WHERE RTRIM(A.DOCNUMBER)=RTRIM(@DOCNUMBER)
		UNION
		SELECT A.DOCNUMBER, A.DOCDATE, A.Lineitmseq, A.Item_Number, A.Item_Description, A.Item_SKU, A.Expected_Stock, A.Counted_Stock, A.Different_Stock, 
		A.Item_Cost, A.Item_Cost_Different, A.Created_User, A.Created_Date, A.Created_time, A.Modified_User, A.Modified_Date, A.Modified_time, 
		ISNULL(B.Total_Different_Stock, 0) Total_Different_Stock, ISNULL(B.Total_Item_Cost_Different, 0) Total_Item_Cost_Different, ISNULL(C.LineItem_Option, 0) LineItem_Option
		FROM POS_TrxInvCount_DetailPOST A with (nolock)
		LEFT JOIN (
			select DOCNUMBER, SUM(Different_Stock) Total_Different_Stock, SUM(Item_Cost_Different) Total_Item_Cost_Different
			from POS_TrxInvCount_DetailPOST with (nolock)
			GROUP BY DOCNUMBER
		) B ON A.DOCNUMBER=B.DOCNUMBER
		LEFT JOIN POS_ItemVariant C with (nolock) ON A.Item_Number=C.Item_Number and A.Item_SKU=C.Item_SKU
		WHERE RTRIM(A.DOCNUMBER)=RTRIM(@DOCNUMBER)
	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000),@ErrorSeverity INT,@ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState)
	END CATCH
END
GO
