create or alter proc TRX_GetSummaryShift
(
	@Batch_ID nvarchar(20)
)
AS          
BEGIN
	BEGIN TRY
		SELECT Batch_ID, LastEdit_Date, LastEdit_time, Store_ID, POS_Device_ID, Opening_Date, Opening_time, Closing_Date, Closing_time, 
		Sum_Amount_Opening, Sum_Amount_Closing, Sum_Invoice_Posted, Sum_Tendered, Sum_Changes, Sum_Amount_Discount, Sum_Amount_Tax, 
		Sum_Invoice_Refund_Posted, Sum_Amount_PayOut, Sum_Amount_PayIn, Count_Customers, Status_Batch, Created_User, Created_Date, Created_time
		FROM POS_Summ_OpenCloseShift WITH(NOLOCK) 
		WHERE RTRIM(Batch_ID)=RTRIM(@Batch_ID)
	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000),@ErrorSeverity INT,@ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState)
	END CATCH
END
GO