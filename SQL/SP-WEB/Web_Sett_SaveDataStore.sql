create or alter proc [dbo].[Web_Sett_SaveDataStore]
(
	@UserID nvarchar(20),
	@Store_ID nvarchar(20), 
	@Store_Name nvarchar(100),
	@Address nvarchar(300),
	@Country nvarchar(100),
	@CountryName nvarchar(100),
	@Province nvarchar(100),
	@City nvarchar(100),
	@Postal_Code nvarchar(10),
	@Phone nvarchar(20),
	@Description nvarchar(255)
)
AS          
BEGIN
	BEGIN TRY
		DECLARE @CurrDate datetime = SYSDATETIMEOFFSET() AT TIME ZONE 'SE Asia Standard Time'
		BEGIN
			IF LEN(ISNULL(@Store_Name,''))=0
			BEGIN
				RAISERROR('Please fill store name.',16,1)
			END
			IF LEN(ISNULL(@Address,''))=0
			BEGIN
				RAISERROR('Please fill address.',16,1)
			END
			IF LEN(ISNULL(@Country,''))=0
			BEGIN
				RAISERROR('Please choose country.',16,1)
			END
			IF LEN(ISNULL(@Phone,''))=0
			BEGIN
				RAISERROR('Please fill phone.',16,1)
			END
		END

		IF EXISTS(SELECT * FROM POS_Set_Stores WITH(NOLOCK) WHERE RTRIM(Store_ID)=RTRIM(@Store_ID))
		BEGIN
			UPDATE POS_Set_Stores
			SET Store_Name=@Store_Name, [Address]=@Address, Country=@Country, CountryName=@CountryName, Province=@Province, City=@City, Postal_Code=@Postal_Code, 
			Phone=@Phone, [Description]=@Description, Modified_User=@UserID, Modified_Date=@CurrDate
			WHERE RTRIM(Store_ID)=RTRIM(@Store_ID)
		END
		ELSE
		BEGIN
			declare @p varchar(30)
			EXEC Web_Generate_NumberMaster @TABLE=N'POS_Set_Stores', @FIELD=N'Store_ID', @DOCID=N'STR', @NEWNUMBER=@p output
			SET @Store_ID=@p

			INSERT INTO [POS_Set_Stores]
			(Store_ID, Store_Name, [Address], Country, CountryName, Province, City, Postal_Code, Phone, [Description], Created_User, Created_Date, Modified_User, Modified_Date)
			VALUES
			(@Store_ID, @Store_Name, @Address, @Country, @CountryName, @Province, @City, @Postal_Code, @Phone, @Description, @UserID, @CurrDate, '', '')
		END

		DECLARE @LINEITEM int = 0
		SELECT @LINEITEM=MAX(COALESCE(Line_Item, 0)) + 1
		FROM POS_Set_Stores_History
		WHERE Store_ID=@Store_ID

		INSERT INTO [POS_Set_Stores_History]
		(Store_ID, Line_Item, Store_Name, [Address], Country, CountryName, Province, City, Postal_Code, Phone, [Description], Created_User, Created_Date)
		VALUES
		(@Store_ID, COALESCE(@LINEITEM, 0), @Store_Name, @Address, @Country, @CountryName, @Province, @City, @Postal_Code, @Phone, @Description, @UserID, @CurrDate)
			
		SELECT CODE='200', Store_ID=@Store_ID

	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000),@ErrorSeverity INT,@ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState)
	END CATCH
END
GO