create or alter proc Web_Sett_SaveDataSite
(
	@UserID nvarchar(20),
	@Site_ID nvarchar(20), 
	@DefaultSite int,
	@Site_Name nvarchar(100),
	@Store_ID nvarchar(20), 
	@Store_Name nvarchar(100)
)
AS          
BEGIN
	BEGIN TRY
		BEGIN
			IF LEN(ISNULL(@Site_Name,''))=0
			BEGIN
				RAISERROR('Please fill site name.',16,1)
			END
			IF LEN(ISNULL(@Store_ID,''))=0
			BEGIN
				RAISERROR('Please choose store ID.',16,1)
			END
		END

		IF EXISTS(SELECT * FROM POS_Set_Site WITH(NOLOCK) WHERE RTRIM(Site_ID)=RTRIM(@Site_ID))
		BEGIN
			UPDATE POS_Set_Site
			SET DefaultSite=@DefaultSite, Site_Name=@Site_Name, Store_ID=@Store_ID, Store_Name=@Store_Name, Modified_User=@UserID, Modified_Date=CAST(GETDATE() as date)
			WHERE RTRIM(Site_ID)=RTRIM(@Site_ID)
		END
		ELSE
		BEGIN
			declare @p varchar(30)
			EXEC Web_Generate_NumberMaster @TABLE=N'POS_Set_Site', @FIELD=N'Site_ID', @DOCID=N'SITE', @NEWNUMBER=@p output
			SET @Site_ID=@p

			INSERT INTO [POS_Set_Site]
			(Site_ID, DefaultSite, Site_Name, Store_ID, Store_Name, Created_User, Created_Date, Modified_User, Modified_Date)
			VALUES
			(@Site_ID, @DefaultSite, @Site_Name, @Store_ID, @Store_Name, @UserID, CAST(GETDATE() as date), '', '')
		END

		IF @DefaultSite = 1
		BEGIN
			UPDATE POS_Set_Site
			SET DefaultSite=0, Modified_User=@UserID, Modified_Date=CAST(GETDATE() as date)
			WHERE RTRIM(Site_ID) <> RTRIM(@Site_ID) and DefaultSite=1
		END

		DECLARE @LINEITEM int = 0
		SELECT @LINEITEM=MAX(COALESCE(Line_Item, 0)) + 1
		FROM POS_Set_Site_History
		WHERE Site_ID=@Site_ID

		INSERT INTO [POS_Set_Site_History]
		(Site_ID, Line_Item, DefaultSite, Site_Name, Store_ID, Store_Name, Created_User, Created_Date)
		VALUES
		(@Site_ID, COALESCE(@LINEITEM, 0), @DefaultSite, @Site_Name, @Store_ID, @Store_Name, @UserID, CAST(GETDATE() as date))
			
		SELECT CODE='200', Site_ID=@Site_ID

	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000),@ErrorSeverity INT,@ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState)
	END CATCH
END