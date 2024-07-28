create or alter proc [dbo].[Web_Sett_SaveDataSalesType]
(
	@UserID nvarchar(20),
	@SalesType_ID nvarchar(20), 
	@SalesType_Name nvarchar(100),
	@Store_ID nvarchar(20), 
	@Store_Name nvarchar(100)
)
AS          
BEGIN
	BEGIN TRY
		DECLARE @CurrDate datetime = SYSDATETIMEOFFSET() AT TIME ZONE 'SE Asia Standard Time'
		BEGIN
			IF LEN(ISNULL(@SalesType_ID,''))=0
			BEGIN
				RAISERROR('Sales type ID not found.',16,1)
			END
			IF LEN(ISNULL(@SalesType_Name,''))=0
			BEGIN
				RAISERROR('Please fill sales type name.',16,1)
			END
			IF LEN(ISNULL(@Store_ID,''))=0
			BEGIN
				RAISERROR('Please choose store ID.',16,1)
			END
		END

		IF EXISTS(SELECT * FROM POS_Set_SalesType WITH(NOLOCK) WHERE RTRIM(SalesType_ID)=RTRIM(@SalesType_ID))
		BEGIN
			UPDATE POS_Set_SalesType
			SET SalesType_Name=@SalesType_Name, Store_ID=@Store_ID, Store_Name=@Store_Name, Modified_User=@UserID, Modified_Date=@CurrDate
			WHERE RTRIM(SalesType_ID)=RTRIM(@SalesType_ID)
		END
		ELSE
		BEGIN
			INSERT INTO [POS_Set_SalesType]
			(SalesType_ID, SalesType_Name, Store_ID, Store_Name, Created_User, Created_Date, Modified_User, Modified_Date)
			VALUES
			(@SalesType_ID, @SalesType_Name, @Store_ID, @Store_Name, @UserID, @CurrDate, '', '')
		END

		DECLARE @LINEITEM int = 0
		SELECT @LINEITEM=MAX(COALESCE(Line_Item, 0)) + 1
		FROM POS_Set_SalesType_History
		WHERE SalesType_ID=@SalesType_ID

		INSERT INTO [POS_Set_SalesType_History]
		(SalesType_ID, Line_Item, SalesType_Name, Store_ID, Store_Name, Created_User, Created_Date)
		VALUES
		(@SalesType_ID, COALESCE(@LINEITEM, 0), @SalesType_Name, @Store_ID, @Store_Name, @UserID, @CurrDate)
			
		SELECT CODE='200', SalesType_ID=@SalesType_ID

	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000),@ErrorSeverity INT,@ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState)
	END CATCH
END
GO