create or alter proc [dbo].[TRX_SaveCashManagement]
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
		DECLARE @CurrDate datetime = SYSDATETIMEOFFSET() AT TIME ZONE 'SE Asia Standard Time'
		--IF EXISTS(SELECT * FROM POS_CashManagement WITH(NOLOCK) WHERE RTRIM(Batch_ID)=RTRIM(@Batch_ID) and Type_CashManagement=@Type_CashManagement)
		--BEGIN
		--	UPDATE POS_CashManagement
		--	SET Amount=@Amount + ISNULL(Amount, 0), Notes=@Notes, POS_ID=@POS_ID, 
		--	Created_User=@UserID, Created_Date=CAST(@CurrDate as date), Created_time=CAST(@CurrDate as time)
		--	WHERE RTRIM(Batch_ID)=RTRIM(@Batch_ID) and Type_CashManagement=@Type_CashManagement
		--END
		--ELSE
		--BEGIN
		
		IF LEN(RTRIM(@Batch_ID)) = 0
		BEGIN
			declare @p varchar(30)
			EXEC Web_Generate_NumberMaster @TABLE=N'POS_CashManagement', @FIELD=N'Batch_ID', @DOCID=N'BCH', @NEWNUMBER=@p output
			SET @Batch_ID=@p
		END

		DECLARE @PAY_ID nvarchar(30), @IDMAX INT = 0, @p15 nvarchar(255)='', @NEWDOC nvarchar(30)='PAY'
  
		SELECT top 1 @IDMAX= cast(REPLACE(Pay_ID,@NEWDOC,'') as INT)     
		FROM POS_CashManagement
		WHERE Batch_ID=@Batch_ID
		order by Pay_ID DESC  
  
		SET @IDMAX= @IDMAX + 1

		IF @IDMAX = 9999
		BEGIN
			SET @IDMAX = 0
		
			SET @NEWDOC = @NEWDOC + '2-'

			SELECT top 1 @IDMAX= cast(REPLACE(Pay_ID,@NEWDOC,'') as INT)     
			FROM POS_CashManagement  
			order by Pay_ID DESC  
  
			SET @IDMAX= @IDMAX + 1
		END

		DECLARE @DocNo varchar(max)='' 
		SET @DocNo = @NEWDOC + REPLICATE('0', 4 - LEN(@IDMAX))+CONVERT(nvarchar(68), @IDMAX)
    
		SET @PAY_ID=@DocNo

		INSERT INTO [POS_CashManagement]
		(Batch_ID, Pay_ID, Type_CashManagement, Amount, Notes, POS_ID, Created_User, Created_Date, Created_time)
		VALUES
		(@Batch_ID, @PAY_ID, @Type_CashManagement, @Amount, @Notes, @POS_ID, @UserID, CAST(@CurrDate as date), CAST(@CurrDate as time))
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