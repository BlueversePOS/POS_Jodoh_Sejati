create or alter proc [dbo].[Web_Sett_SaveDataTaxes]
(
	@UserID nvarchar(20),
	@Tax_ID nvarchar(20), 
	@Tax_Name nvarchar(100),
	@Tax_Rate numeric(19,5),
	@Tax_Type int,
	@Tax_Option int
)
AS          
BEGIN
	BEGIN TRY
		DECLARE @CurrDate datetime = SYSDATETIMEOFFSET() AT TIME ZONE 'SE Asia Standard Time'
		IF EXISTS(SELECT * FROM POS_Set_Taxes WITH(NOLOCK) WHERE RTRIM(Tax_ID)=RTRIM(@Tax_ID))
		BEGIN
			UPDATE POS_Set_Taxes
			SET Tax_Name=@Tax_Name, Tax_Rate=@Tax_Rate, Tax_Type=@Tax_Type, Tax_Option=@Tax_Option, Modified_User=@UserID, Modified_Date=@CurrDate
			WHERE RTRIM(Tax_ID)=RTRIM(@Tax_ID)
		END
		ELSE
		BEGIN
			declare @p varchar(30)
			EXEC Web_Generate_NumberMaster @TABLE=N'POS_Set_Taxes', @FIELD=N'Tax_ID', @DOCID=N'TAX', @NEWNUMBER=@p output
			SET @Tax_ID=@p

			INSERT INTO [POS_Set_Taxes]
			(Tax_ID, Tax_Name, Tax_Rate, Tax_Type, Tax_Option, Created_User, Created_Date, Modified_User, Modified_Date)
			VALUES
			(@Tax_ID, @Tax_Name, @Tax_Rate, @Tax_Type, @Tax_Option, @UserID, @CurrDate, '', '')
		END

		DECLARE @LINEITEM int = 0
		SELECT @LINEITEM=MAX(COALESCE(Line_Item, 0)) + 1
		FROM POS_Set_Taxes_History
		WHERE Tax_ID=@Tax_ID

		INSERT INTO [POS_Set_Taxes_History]
		(Tax_ID, Line_Item, Tax_Name, Tax_Rate, Tax_Type, Tax_Option, Created_User, Created_Date)
		VALUES
		(@Tax_ID, COALESCE(@LINEITEM, 0), @Tax_Name, @Tax_Rate, @Tax_Type, @Tax_Option, @UserID, @CurrDate)
			
		SELECT CODE='200', Tax_ID=@Tax_ID

	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000),@ErrorSeverity INT,@ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState)
	END CATCH
END
GO