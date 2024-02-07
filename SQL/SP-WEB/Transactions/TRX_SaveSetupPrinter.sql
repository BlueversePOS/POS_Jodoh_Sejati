create or alter proc TRX_SaveSetupPrinter
(
	@PrinterID nvarchar(20), 
	@PrinterName nvarchar(20), 
	@Printer_Checkbox1 int,
	@Printer_Checkbox2 int,
	@Printer_Checkbox3 int,
	@UserID nvarchar(20)
)
AS          
BEGIN
	BEGIN TRY
		IF LEN(RTRIM(@PrinterName)) = 0
		BEGIN
			RAISERROR('Please fill printer name', 16, 1)
		END
		IF EXISTS(SELECT * FROM POS_PrinterSetup WITH(NOLOCK) WHERE RTRIM(PrinterID)=RTRIM(@PrinterID))
		BEGIN
			UPDATE POS_PrinterSetup
			SET PrinterName=@PrinterName, Printer_Checkbox1=@Printer_Checkbox1, Printer_Checkbox2=@Printer_Checkbox2, Printer_Checkbox3=@Printer_Checkbox3,
			Modified_User=@UserID, Modified_Date=CAST(GETDATE() as date), Modified_time=CAST(GETDATE() as time)
			WHERE RTRIM(PrinterID)=RTRIM(@PrinterID)
		END
		ELSE
		BEGIN
			IF LEN(RTRIM(@PrinterID)) = 0
			BEGIN
				declare @p varchar(30)
				EXEC Web_Generate_NumberMaster @TABLE=N'POS_PrinterSetup', @FIELD=N'PrinterID', @DOCID=N'PRT', @NEWNUMBER=@p output
				SET @PrinterID=@p
			END
			INSERT INTO [POS_PrinterSetup]
			(PrinterID, PrinterName, Printer_Checkbox1, Printer_Checkbox2, Printer_Checkbox3, Created_User, Created_Date, Created_time, Modified_User, Modified_Date, Modified_time)
			VALUES
			(@PrinterID, @PrinterName, @Printer_Checkbox1, @Printer_Checkbox2, @Printer_Checkbox3, @UserID, CAST(GETDATE() as date), CAST(GETDATE() as time), '', '', '')
		END
			
		SELECT CODE='200', PrinterID=@PrinterID

	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000),@ErrorSeverity INT,@ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState)
	END CATCH
END
GO