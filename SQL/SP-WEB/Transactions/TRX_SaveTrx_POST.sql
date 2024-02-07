create or alter proc TRX_SaveTrx_POST
(
	@DOCNUMBER nvarchar(20),
	@SyncStatus int,
	@UserID nvarchar(20)
)
AS
BEGIN
	BEGIN TRY
		IF EXISTS(SELECT * FROM POS_TrxHeader_TEMP WITH(NOLOCK) WHERE RTRIM(DOCNUMBER)=RTRIM(@DOCNUMBER))
		BEGIN
			RAISERROR('Something error when save data', 16, 1)
		END
		IF (SELECT ISNULL(A.InStock - B.Quantity, 0) FROM POS_Item A
			INNER JOIN POS_TrxDetail_TEMP B ON A.Item_Number=B.Item_Number
			WHERE RTRIM(B.DOCNUMBER)=RTRIM(@DOCNUMBER)) < 0
		BEGIN
			RAISERROR('Not enough quantity', 16, 1)
		END
		-- Header
		INSERT INTO [POS_TrxHeader_POST]
		(DOCNUMBER, DOCTYPE, DOCDATE, Store_ID, Site_ID, SalesType_ID, CustName, Total_Line_Item, ORIGTOTAL, SUBTOTAL, Tax_Amount, Discount_ID, Discount_Amount, Amount_Tendered, 
		Change_Amount, Batch_ID, POS_Device_ID, POS_Version, SyncStatus, Created_User, Created_Date, Created_time, Modified_User, Modified_Date, Modified_time)
		SELECT DOCNUMBER, DOCTYPE, DOCDATE, Store_ID, Site_ID, SalesType_ID, CustName, Total_Line_Item, ORIGTOTAL, SUBTOTAL, Tax_Amount, Discount_ID, Discount_Amount, Amount_Tendered, 
		Change_Amount, Batch_ID, POS_Device_ID, POS_Version, @SyncStatus, @UserID, CAST(GETDATE() as date), CAST(GETDATE() as time), '', '', ''
		FROM POS_TrxHeader_TEMP A
		WHERE RTRIM(A.DOCNUMBER)=RTRIM(@DOCNUMBER)

		INSERT INTO [POS_TrxHeader_HIST]
		(DOCNUMBER, DOCTYPE, DOCDATE, Store_ID, Site_ID, SalesType_ID, CustName, Total_Line_Item, ORIGTOTAL, SUBTOTAL, Tax_Amount, Discount_ID, Discount_Amount, Amount_Tendered, 
		Change_Amount, Batch_ID, POS_Device_ID, POS_Version, SyncStatus, Created_User, Created_Date, Created_time, Modified_User, Modified_Date, Modified_time)
		SELECT DOCNUMBER, DOCTYPE, DOCDATE, Store_ID, Site_ID, SalesType_ID, CustName, Total_Line_Item, ORIGTOTAL, SUBTOTAL, Tax_Amount, Discount_ID, Discount_Amount, Amount_Tendered, 
		Change_Amount, Batch_ID, POS_Device_ID, POS_Version, @SyncStatus, @UserID, CAST(GETDATE() as date), CAST(GETDATE() as time), '', '', ''
		FROM POS_TrxHeader_TEMP A
		WHERE RTRIM(A.DOCNUMBER)=RTRIM(@DOCNUMBER)
		-- Detail
		INSERT INTO POS_TrxDetail_POST(DOCNUMBER, DOCTYPE, DOCDATE, Lineitmseq, Item_Number, Item_Description, Quantity, UofM, Item_Price, Item_Cost, Store_ID, Site_ID, 
		SalesType_ID, Discount_ID, Discount_Amount, Notes, POS_Device_ID, POS_Version, Created_User, Created_Date, Created_time, Modified_User, Modified_Date, Modified_time)
		SELECT DOCNUMBER, DOCTYPE, DOCDATE, Lineitmseq, Item_Number, Item_Description, Quantity, UofM, Item_Price, Item_Cost, Store_ID, Site_ID, 
		SalesType_ID, Discount_ID, Discount_Amount, Notes, POS_Device_ID, POS_Version, @UserID, CAST(GETDATE() as date), CAST(GETDATE() as time), '', '', ''
		FROM POS_TrxDetail_TEMP
		WHERE RTRIM(DOCNUMBER)=RTRIM(@DOCNUMBER)

		INSERT INTO POS_TrxDetail_HIST(DOCNUMBER, DOCTYPE, DOCDATE, Lineitmseq, Item_Number, Item_Description, Quantity, UofM, Item_Price, Item_Cost, Store_ID, Site_ID, 
		SalesType_ID, Discount_ID, Discount_Amount, Notes, POS_Device_ID, POS_Version, Created_User, Created_Date, Created_time, Modified_User, Modified_Date, Modified_time)
		SELECT DOCNUMBER, DOCTYPE, DOCDATE, Lineitmseq, Item_Number, Item_Description, Quantity, UofM, Item_Price, Item_Cost, Store_ID, Site_ID, 
		SalesType_ID, Discount_ID, Discount_Amount, Notes, POS_Device_ID, POS_Version, @UserID, CAST(GETDATE() as date), CAST(GETDATE() as time), '', '', ''
		FROM POS_TrxDetail_TEMP
		WHERE RTRIM(DOCNUMBER)=RTRIM(@DOCNUMBER)
		-- payment type
		INSERT INTO POS_TrxPayTypes_POST(DOCNUMBER, DOCTYPE, DOCDATE, Lnitmseq, Payment_ID, Payment_Type, ORIGTOTAL, SUBTOTAL, Amount_Tendered, 
		Change_Amount, Store_ID, POS_Device_ID, POS_Version, Created_User, Created_Date, Created_time, Modified_User, Modified_Date, Modified_time)
		SELECT DOCNUMBER, DOCTYPE, DOCDATE, Lnitmseq, Payment_ID, Payment_Type, ORIGTOTAL, SUBTOTAL, Amount_Tendered, 
		Change_Amount, Store_ID, POS_Device_ID, POS_Version, @UserID, CAST(GETDATE() as date), CAST(GETDATE() as time), '', '', ''
		FROM POS_TrxPayTypes_TEMP
		WHERE RTRIM(DOCNUMBER)=RTRIM(@DOCNUMBER)
		
		INSERT INTO POS_TrxPayTypes_HIST(DOCNUMBER, DOCTYPE, DOCDATE, Lnitmseq, Payment_ID, Payment_Type, ORIGTOTAL, SUBTOTAL, Amount_Tendered, 
		Change_Amount, Store_ID, POS_Device_ID, POS_Version, Created_User, Created_Date, Created_time, Modified_User, Modified_Date, Modified_time)
		SELECT DOCNUMBER, DOCTYPE, DOCDATE, Lnitmseq, Payment_ID, Payment_Type, ORIGTOTAL, SUBTOTAL, Amount_Tendered, 
		Change_Amount, Store_ID, POS_Device_ID, POS_Version, @UserID, CAST(GETDATE() as date), CAST(GETDATE() as time), '', '', ''
		FROM POS_TrxPayTypes_TEMP
		WHERE RTRIM(DOCNUMBER)=RTRIM(@DOCNUMBER)

		UPDATE A
		SET A.InStock=(A.InStock - B.Quantity)
		FROM POS_Item A
		INNER JOIN POS_TrxDetail_TEMP B ON A.Item_Number=B.Item_Number
		WHERE RTRIM(B.DOCNUMBER)=RTRIM(@DOCNUMBER)


		DELETE FROM POS_TrxHeader_TEMP WHERE RTRIM(DOCNUMBER)=RTRIM(@DOCNUMBER)
		DELETE FROM POS_TrxDetail_TEMP WHERE RTRIM(DOCNUMBER)=RTRIM(@DOCNUMBER)
		DELETE FROM POS_TrxPayTypes_TEMP WHERE RTRIM(DOCNUMBER)=RTRIM(@DOCNUMBER)
			
		SELECT CODE='200', DOCNUMBER=@DOCNUMBER

	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000),@ErrorSeverity INT,@ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState)
	END CATCH
END
GO