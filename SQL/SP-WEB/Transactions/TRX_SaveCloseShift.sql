create or alter proc [dbo].[TRX_SaveCloseShift]
(
	@Batch_ID nvarchar(20),
	@Lineitmseq int,
	@Payment_ID nvarchar(20),
	@Payment_Type nvarchar(20),
	@Amount_Opening numeric(19, 5),
	@UserID nvarchar(20)
)
AS          
BEGIN
	BEGIN TRY
		DECLARE @CurrDate datetime = SYSDATETIMEOFFSET() AT TIME ZONE 'SE Asia Standard Time'
		IF EXISTS(SELECT * FROM POS_CloseShift WITH(NOLOCK) WHERE RTRIM(Batch_ID)=RTRIM(@Batch_ID) and Payment_ID=@Payment_ID)
		BEGIN
			UPDATE A
			SET A.Payment_Type=COALESCE(B.Payment_Type, ''), 
			A.Amount=@Amount_Opening, A.Modified_User=@UserID, A.Modified_Date=CAST(@CurrDate as datetime)
			FROM POS_CloseShift A
			OUTER APPLY (
				SELECT Payment_Type 
				FROM POS_Set_PayTypes where Payment_ID=@Payment_ID
			) B
			WHERE RTRIM(A.Batch_ID)=RTRIM(@Batch_ID) and A.Payment_ID=@Payment_ID
		END
		ELSE
		BEGIN
			IF LEN(RTRIM(@Batch_ID)) = 0
			BEGIN
				declare @p varchar(30)
				EXEC Web_Generate_NumberMaster @TABLE=N'POS_CloseShift', @FIELD=N'Batch_ID', @DOCID=N'SHF', @NEWNUMBER=@p output
				SET @Batch_ID=@p
			END
			
			SELECT @Lineitmseq = ISNULL(MAX(Lineitmseq), 0) + 1
			FROM POS_CloseShift
			WHERE RTRIM(Batch_ID)=RTRIM(@Batch_ID) and Payment_ID=@Payment_ID

			INSERT INTO [POS_CloseShift]
			(Batch_ID, Lineitmseq, Payment_ID, Payment_Type, Amount, Created_User, Created_Date, Modified_User, Modified_Date)
			SELECT @Batch_ID, @Lineitmseq, @Payment_ID, Payment_Type, @Amount_Opening, @UserID, CAST(@CurrDate as datetime), '', ''
			FROM POS_Set_PayTypes
			where Payment_ID=@Payment_ID
		END
			
		SELECT CODE='200', Batch_ID=@Batch_ID

	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000),@ErrorSeverity INT,@ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState)
	END CATCH
END
GO