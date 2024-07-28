create or alter proc [dbo].[TRX_SaveTrx_TEMP]
(
	@DOCNUMBER nvarchar(20),
	@DOCTYPE int,
	@DOCDATE DATETIME,
	@Store_ID nvarchar(20),
	@Site_ID nvarchar(20),
	@SalesType_ID nvarchar(20),
	@CustName nvarchar(200),
	@Total_Line_Item int,
	@ORIGTOTAL numeric(19,5),
	@SUBTOTAL numeric(19,5),
	@Tax_Amount numeric(19,5),
	@Discount_ID nvarchar(20),
	@Discount_Amount numeric(19,5),
	@Amount_Tendered numeric(19,5),
	@Change_Amount numeric(19,5),
	@Batch_ID nvarchar(20),
	@Payment_ID nvarchar(20),
	@Payment_Type nvarchar(20),
	@Lnitmseq int,
	@POS_Device_ID nvarchar(20),
	@POS_Version nvarchar(20),
	@SyncStatus int,
	@UserID nvarchar(20),
	@TrxDetailTYPE TrxDetailTYPE readonly
)
AS
BEGIN
	BEGIN TRY
		DECLARE @CurrDate datetime = SYSDATETIMEOFFSET() AT TIME ZONE 'SE Asia Standard Time'
		IF LEN(RTRIM(@Batch_ID)) = 0
		BEGIN
			RAISERROR('Batch_ID not found', 16, 1)
		END
		IF EXISTS(SELECT * FROM POS_TrxHeader_TEMP WITH(NOLOCK) WHERE RTRIM(DOCNUMBER)=RTRIM(@DOCNUMBER))
		BEGIN
			UPDATE POS_TrxHeader_TEMP
			SET DOCTYPE=@DOCTYPE, DOCDATE=@DOCDATE, Store_ID=@Store_ID, Site_ID=@Site_ID, SalesType_ID=@SalesType_ID, CustName=@CustName, Total_Line_Item=@Total_Line_Item, ORIGTOTAL=@ORIGTOTAL, SUBTOTAL=@SUBTOTAL, 
			Tax_Amount=@Tax_Amount, Discount_ID=@Discount_ID, Discount_Amount=@Discount_Amount, Amount_Tendered=@Amount_Tendered, Change_Amount=@Change_Amount, Batch_ID=@Batch_ID, 
			POS_Device_ID=@POS_Device_ID, POS_Version=@POS_Version, SyncStatus=@SyncStatus, Modified_User=@UserID, Modified_Date=CAST(@CurrDate as date), Modified_time=CAST(@CurrDate as time)
			WHERE RTRIM(DOCNUMBER)=RTRIM(@DOCNUMBER)
		END
		ELSE
		BEGIN
			IF LEN(RTRIM(@DOCNUMBER)) = 0
			BEGIN
				declare @p varchar(30)
				EXEC Web_Generate_NumberMaster @TABLE=N'POS_TrxHeader_POST', @FIELD=N'DOCNUMBER', @DOCID=N'PRT', @NEWNUMBER=@p output
				SET @DOCNUMBER=@p
			END
			INSERT INTO [POS_TrxHeader_TEMP]
			(DOCNUMBER, DOCTYPE, DOCDATE, Store_ID, Site_ID, SalesType_ID, CustName, Total_Line_Item, ORIGTOTAL, SUBTOTAL, Tax_Amount, Discount_ID, Discount_Amount, Amount_Tendered, 
			Change_Amount, Batch_ID, POS_Device_ID, POS_Version, SyncStatus, Created_User, Created_Date, Created_time, Modified_User, Modified_Date, Modified_time)
			VALUES
			(@DOCNUMBER, @DOCTYPE, @DOCDATE, @Store_ID, @Site_ID, @SalesType_ID, @CustName, @Total_Line_Item, @ORIGTOTAL, @SUBTOTAL, @Tax_Amount, @Discount_ID, @Discount_Amount, @Amount_Tendered, 
			@Change_Amount, @Batch_ID, @POS_Device_ID, @POS_Version, @SyncStatus, @UserID, CAST(@CurrDate as date), CAST(@CurrDate as time), '', '', '')
		END

		DELETE FROM POS_TrxDetail_TEMP
		WHERE RTRIM(DOCNUMBER)=RTRIM(@DOCNUMBER)

		INSERT INTO POS_TrxDetail_TEMP(DOCNUMBER, DOCTYPE, DOCDATE, Lineitmseq, Item_Number, Item_Description, LineItem_Option, Quantity, UofM, Item_Price, Item_Cost, Store_ID, Site_ID, 
		SalesType_ID, Discount_ID, Discount_Amount, Notes, POS_Device_ID, POS_Version, Created_User, Created_Date, Created_time, Modified_User, Modified_Date, Modified_time)
		SELECT DOCNUMBER, DOCTYPE, DOCDATE, Lineitmseq, Item_Number, Item_Description, LineItem_Option, Quantity, UofM, Item_Price, Item_Cost, Store_ID, Site_ID, 
		SalesType_ID, Discount_ID, Discount_Amount, Notes, POS_Device_ID, POS_Version, @UserID, CAST(@CurrDate as date), CAST(@CurrDate as time), '', '', ''
		FROM @TrxDetailTYPE
		WHERE RTRIM(DOCNUMBER)=RTRIM(@DOCNUMBER)

		INSERT INTO POS_TrxPayTypes_TEMP(DOCNUMBER, DOCTYPE, DOCDATE, Lnitmseq, Payment_ID, Payment_Type, ORIGTOTAL, SUBTOTAL, Amount_Tendered, 
		Change_Amount, Store_ID, POS_Device_ID, POS_Version, Created_User, Created_Date, Created_time, Modified_User, Modified_Date, Modified_time)
		SELECT @DOCNUMBER, @DOCTYPE, @DOCDATE, @Lnitmseq, @Payment_ID, Payment_Type, @ORIGTOTAL, @SUBTOTAL, @Amount_Tendered, 
		@Change_Amount, @Store_ID, @POS_Device_ID, @POS_Version, @UserID, CAST(@CurrDate as date), CAST(@CurrDate as time), '', '', ''
		FROM POS_Set_PayTypes
		where Payment_ID=@Payment_ID

		EXEC TRX_SaveTrx_POST @DOCNUMBER=@DOCNUMBER, @SyncStatus=@SyncStatus, @UserID=@UserID
			
		SELECT CODE='200', DOCNUMBER=@DOCNUMBER

	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000),@ErrorSeverity INT,@ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState)
	END CATCH
END
GO