CREATE OR ALTER proc [dbo].[Web_Sett_StoresGetData]
(
	@Store_ID nvarchar(20)
)
AS
BEGIN
	BEGIN TRY
		SELECT *, 
		FULL_ADDRESS=
		CASE WHEN LEN(RTRIM([Address])) > 0 THEN [Address] ELSE '' END +
		CASE WHEN LEN(RTRIM(City)) > 0 THEN ', ' + City ELSE '' END + 
		CASE WHEN LEN(RTRIM(Province)) > 0 THEN ', ' + Province ELSE '' END + 
		CASE WHEN LEN(RTRIM(CountryName)) > 0 THEN ', ' + CountryName ELSE '' END + 
		CASE WHEN LEN(RTRIM(Postal_Code)) > 0 THEN ', ' + Postal_Code ELSE '' END
		FROM POS_Set_Stores
		WHERE Store_ID=@Store_ID or @Store_ID = ''
	END TRY
	BEGIN	CATCH
			DECLARE @ErrorMessage NVARCHAR(4000)
			DECLARE @ErrorSeverity INT
			DECLARE @ErrorState INT

			SELECT @ErrorMessage = ERROR_MESSAGE(),
				@ErrorSeverity = ERROR_SEVERITY(),
				@ErrorState = ERROR_STATE()

			RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState)
	END CATCH
END
/*
EXEC Web_Sett_StoresGetData ''
*/
