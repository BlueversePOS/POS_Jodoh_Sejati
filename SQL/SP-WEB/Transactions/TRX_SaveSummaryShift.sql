create or alter proc TRX_SaveSummaryShift
(
	@Batch_ID nvarchar(20),
	@Store_ID nvarchar(20),
	@POS_Device_ID nvarchar(20),
	@Opening_Date datetime,
	@Opening_time datetime,
	@Closing_Date datetime,
	@Closing_time datetime,
	@Sum_Amount_Opening numeric(19, 5),
	@Sum_Amount_Closing numeric(19, 5),
	@Sum_Invoice_Posted numeric(19, 5),
	@Sum_Tendered numeric(19, 5),
	@Sum_Changes numeric(19, 5),
	@Sum_Amount_Discount numeric(19, 5),
	@Sum_Amount_Tax numeric(19, 5),
	@Sum_Invoice_Refund_Posted numeric(19, 5),
	@Sum_Amount_PayOut numeric(19, 5),
	@Sum_Amount_PayIn numeric(19, 5),
	@Count_Customers int,
	@Status_Batch int,
	@UserID nvarchar(20)
)
AS          
BEGIN
	BEGIN TRY
		IF EXISTS(SELECT * FROM POS_Summ_OpenCloseShift WITH(NOLOCK) WHERE RTRIM(Batch_ID)=RTRIM(@Batch_ID))
		BEGIN
			UPDATE POS_Summ_OpenCloseShift
			SET LastEdit_Date=CAST(GETDATE() as date), LastEdit_time=CAST(GETDATE() as time), Store_ID=@Store_ID, POS_Device_ID=@POS_Device_ID, 
			Opening_Date=@Opening_Date, Opening_time=@Opening_time, Closing_Date=@Closing_Date, Closing_time=@Closing_time, Sum_Amount_Opening=@Sum_Amount_Opening, 
			Sum_Amount_Closing=@Sum_Amount_Closing, Sum_Invoice_Posted=@Sum_Invoice_Posted, Sum_Tendered=@Sum_Tendered, Sum_Changes=@Sum_Changes, 
			Sum_Amount_Discount=@Sum_Amount_Discount, Sum_Amount_Tax=@Sum_Amount_Tax, Sum_Invoice_Refund_Posted=@Sum_Invoice_Refund_Posted, Sum_Amount_PayOut=@Sum_Amount_PayOut, 
			Sum_Amount_PayIn=@Sum_Amount_PayIn, Count_Customers=@Count_Customers, Status_Batch=@Status_Batch
			WHERE RTRIM(Batch_ID)=RTRIM(@Batch_ID)
		END
		ELSE
		BEGIN
			INSERT INTO [POS_Summ_OpenCloseShift]
			(Batch_ID, LastEdit_Date, LastEdit_time, Store_ID, POS_Device_ID, Opening_Date, Opening_time, Closing_Date, Closing_time, Sum_Amount_Opening, 
			Sum_Amount_Closing, Sum_Invoice_Posted, Sum_Tendered, Sum_Changes, Sum_Amount_Discount, Sum_Amount_Tax, Sum_Invoice_Refund_Posted, Sum_Amount_PayOut, 
			Sum_Amount_PayIn, Count_Customers, Status_Batch, Created_User, Created_Date, Created_time)
			VALUES
			(@Batch_ID, CAST(GETDATE() as date), CAST(GETDATE() as time), @Store_ID, @POS_Device_ID, @Opening_Date, @Opening_time, @Closing_Date, @Closing_time, @Sum_Amount_Opening, 
			@Sum_Amount_Closing, @Sum_Invoice_Posted, @Sum_Tendered, @Sum_Changes, @Sum_Amount_Discount, @Sum_Amount_Tax, @Sum_Invoice_Refund_Posted, @Sum_Amount_PayOut, 
			@Sum_Amount_PayIn, @Count_Customers, @Status_Batch, @UserID, CAST(GETDATE() as date), CAST(GETDATE() as time))
		END
	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000),@ErrorSeverity INT,@ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState)
	END CATCH
END
GO