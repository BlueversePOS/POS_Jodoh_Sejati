create or alter proc [dbo].[TRX_SaveOpenShift]
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
		IF EXISTS(SELECT * FROM POS_OpenShift WITH(NOLOCK) WHERE RTRIM(Batch_ID)=RTRIM(@Batch_ID))
		BEGIN
			UPDATE A
			SET A.Lineitmseq=@Lineitmseq, A.Payment_ID=@Payment_ID, A.Payment_Type=COALESCE(B.Payment_Type, ''), 
			Amount_Opening=@Amount_Opening, Modified_User=@UserID, Modified_Date=CAST(@CurrDate as datetime)
			FROM POS_OpenShift A
			OUTER APPLY (
				SELECT Payment_Type 
				FROM POS_Set_PayTypes where Payment_ID=@Payment_ID
			) B
			WHERE RTRIM(Batch_ID)=RTRIM(@Batch_ID)
		END
		ELSE
		BEGIN
			IF LEN(RTRIM(@Batch_ID)) = 0
			BEGIN
				declare @p varchar(30)
				EXEC Web_Generate_NumberMaster @TABLE=N'POS_OpenShift', @FIELD=N'Batch_ID', @DOCID=N'SHF', @NEWNUMBER=@p output
				SET @Batch_ID=@p
			END
			INSERT INTO [POS_OpenShift]
			(Batch_ID, Lineitmseq, Payment_ID, Payment_Type, Amount_Opening, Created_User, Created_Date, Modified_User, Modified_Date)
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