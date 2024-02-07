create or alter proc Web_Sett_SaveDataDevice
(
	@UserID nvarchar(20),
	@POS_Device_ID nvarchar(20), 
	@POS_Device_Name nvarchar(250),
	@Store_ID nvarchar(20), 
	@Store_Name nvarchar(100)
)
AS          
BEGIN
	BEGIN TRY
		BEGIN
			IF LEN(ISNULL(@POS_Device_Name,''))=0
			BEGIN
				RAISERROR('Please fill device name.',16,1)
			END
			IF LEN(ISNULL(@Store_ID,''))=0
			BEGIN
				RAISERROR('Please choose store ID.',16,1)
			END
		END

		IF EXISTS(SELECT * FROM POS_Device WITH(NOLOCK) WHERE RTRIM(POS_Device_ID)=RTRIM(@POS_Device_ID))
		BEGIN
			UPDATE POS_Device
			SET POS_Device_Name=@POS_Device_Name, Store_ID=@Store_ID, Store_Name=@Store_Name, Modified_User=@UserID, Modified_Date=CAST(GETDATE() as date)
			WHERE RTRIM(POS_Device_ID)=RTRIM(@POS_Device_ID)
		END
		ELSE
		BEGIN
			declare @p varchar(30)
			EXEC Web_Generate_NumberMaster @TABLE=N'POS_Device', @FIELD=N'POS_Device_ID', @DOCID=N'DVC', @NEWNUMBER=@p output
			SET @POS_Device_ID=@p

			INSERT INTO [POS_Device]
			(POS_Device_ID, POS_Device_Name, Store_ID, Store_Name, Created_User, Created_Date, Modified_User, Modified_Date)
			VALUES
			(@POS_Device_ID, @POS_Device_Name, @Store_ID, @Store_Name, @UserID, CAST(GETDATE() as date), '', '')
		END

		DECLARE @LINEITEM int = 0
		SELECT @LINEITEM=MAX(COALESCE(Line_Item, 0)) + 1
		FROM POS_Device_History
		WHERE POS_Device_ID=@POS_Device_ID

		INSERT INTO [POS_Device_History]
		(POS_Device_ID, Line_Item, POS_Device_Name, Store_ID, Store_Name, Created_User, Created_Date)
		VALUES
		(@POS_Device_ID, COALESCE(@LINEITEM, 0), @POS_Device_Name, @Store_ID, @Store_Name, @UserID, CAST(GETDATE() as date))
			
		SELECT CODE='200', POS_Device_ID=@POS_Device_ID

	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000),@ErrorSeverity INT,@ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState)
	END CATCH
END
GO