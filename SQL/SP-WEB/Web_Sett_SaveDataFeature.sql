create or alter proc [dbo].[Web_Sett_SaveDataFeature]
(
	@UserID nvarchar(20),
	@Feature_ID nvarchar(20),
	@Feature_Shift int, 
	@Feature_TimeClock int,
	@Feature_LowStock int,
	@Feature_NegativeStock int
)
AS          
BEGIN
	BEGIN TRY
		DECLARE @CurrDate datetime = SYSDATETIMEOFFSET() AT TIME ZONE 'SE Asia Standard Time'
		IF EXISTS(SELECT * FROM POS_Set_Features WITH(NOLOCK) WHERE RTRIM(Feature_ID)=RTRIM(@Feature_ID))
		BEGIN
			UPDATE POS_Set_Features
			SET Feature_Shift=@Feature_Shift, Feature_TimeClock=@Feature_TimeClock, Feature_LowStock=@Feature_LowStock, 
			Feature_NegativeStock=@Feature_NegativeStock, Modified_User=@UserID, Modified_Date=@CurrDate
			WHERE RTRIM(Feature_ID)=RTRIM(@Feature_ID)
		END
		ELSE
		BEGIN
			declare @p varchar(30)
			EXEC Web_Generate_NumberMaster @TABLE=N'POS_Set_Features', @FIELD=N'Feature_ID', @DOCID=N'FTR', @NEWNUMBER=@p output
			SET @Feature_ID=@p

			INSERT INTO [POS_Set_Features]
			(Feature_ID, Feature_Shift, Feature_TimeClock, Feature_LowStock, Feature_NegativeStock, Created_User, Created_Date, Modified_User, Modified_Date)
			VALUES
			(@Feature_ID, @Feature_Shift, @Feature_TimeClock, @Feature_LowStock, @Feature_NegativeStock, @UserID, @CurrDate, '', '')
		END

		DECLARE @LINEITEM int = 0
		SELECT @LINEITEM=MAX(COALESCE(Line_Item, 0)) + 1
		FROM POS_Set_Features_History
		WHERE Feature_ID=@Feature_ID

		INSERT INTO [POS_Set_Features_History]
		(Feature_ID, Line_Item, Feature_Shift, Feature_TimeClock, Feature_LowStock, Feature_NegativeStock, Created_User, Created_Date)
		VALUES
		(@Feature_ID, COALESCE(@LINEITEM, 0), @Feature_Shift, @Feature_TimeClock, @Feature_LowStock, @Feature_NegativeStock, @UserID, @CurrDate)
			
		SELECT CODE='200', Feature_ID=@Feature_ID

	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000),@ErrorSeverity INT,@ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState)
	END CATCH
END
GO