create or alter proc TRX_SaveCashManagement
(
	@Batch_ID nvarchar(20),
	@Type_CashManagement nvarchar(20),
	@Amount numeric(19, 5),
	@Notes nvarchar(200),
	@POS_ID nvarchar(20),
	@UserID nvarchar(20)
)
AS          
BEGIN
	BEGIN TRY
		--IF EXISTS(SELECT * FROM POS_CashManagement WITH(NOLOCK) WHERE RTRIM(Batch_ID)=RTRIM(@Batch_ID) and Type_CashManagement=@Type_CashManagement)
		--BEGIN
		--	UPDATE POS_CashManagement
		--	SET Amount=@Amount + ISNULL(Amount, 0), Notes=@Notes, POS_ID=@POS_ID, 
		--	Created_User=@UserID, Created_Date=CAST(GETDATE() as date), Created_time=CAST(GETDATE() as time)
		--	WHERE RTRIM(Batch_ID)=RTRIM(@Batch_ID) and Type_CashManagement=@Type_CashManagement
		--END
		--ELSE
		--BEGIN
		DECLARE @PAY_ID nvarchar(20)
		declare @pay varchar(30)
		EXEC Web_Generate_NumberMaster @TABLE=N'POS_CashManagement', @FIELD=N'Pay_ID', @DOCID=N'PAY', @NEWNUMBER=@pay output
		SET @PAY_ID=@pay
			IF LEN(RTRIM(@Batch_ID)) = 0
			BEGIN
				declare @p varchar(30)
				EXEC Web_Generate_NumberMaster @TABLE=N'POS_CashManagement', @FIELD=N'Batch_ID', @DOCID=N'BCH', @NEWNUMBER=@p output
				SET @Batch_ID=@p
			END
			INSERT INTO [POS_CashManagement]
			(Batch_ID, Pay_ID, Type_CashManagement, Amount, Notes, POS_ID, Created_User, Created_Date, Created_time)
			VALUES
			(@Batch_ID, @PAY_ID, @Type_CashManagement, @Amount, @Notes, @POS_ID, @UserID, CAST(GETDATE() as date), CAST(GETDATE() as time))
		--END
			
		SELECT CODE='200', Batch_ID=@Batch_ID

	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000),@ErrorSeverity INT,@ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState)
	END CATCH
END
GO