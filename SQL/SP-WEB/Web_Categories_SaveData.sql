create or alter proc Web_Categories_SaveData
(
	@UserID nvarchar(20),
	@Category_ID nvarchar(20),
	@Category_Name nvarchar(250),
	@Category_Color nvarchar(20)
)
AS          
BEGIN
	BEGIN TRY
		BEGIN
			IF LEN(ISNULL(@Category_Name,''))=0
			BEGIN
				RAISERROR('Please fill category name.',16,1)
			END
			IF LEN(ISNULL(@Category_Color,''))=0
			BEGIN
				RAISERROR('Please choose category color.',16,1)
			END
		END

		IF EXISTS(SELECT * FROM POS_CategoryItem WITH(NOLOCK) WHERE RTRIM(Category_ID)=RTRIM(@Category_ID))
		BEGIN
			UPDATE POS_CategoryItem
			SET Category_Name=@Category_Name, Category_Color=@Category_Color, Modified_User=@UserID, Modified_Date=DATEADD(HOUR,1,GETDATE())
			WHERE RTRIM(Category_ID)=RTRIM(@Category_ID)
		END
		ELSE
		BEGIN
			declare @p varchar(30)
			EXEC Web_Generate_NumberMaster @TABLE=N'POS_CategoryItem', @FIELD=N'Category_ID', @DOCID=N'CAT', @NEWNUMBER=@p output
			SET @Category_ID=@p

			INSERT INTO [POS_CategoryItem]
			(Category_ID, Category_Name, Category_Color, Created_User, Created_Date, Modified_User, Modified_Date)
			VALUES
			(@Category_ID, @Category_Name, @Category_Color, @UserID, DATEADD(HOUR,1,GETDATE()), '', '')
		END

		DECLARE @LINEITEM int = 0
		SELECT @LINEITEM=MAX(COALESCE(Line_Item, 0)) + 1
		FROM POS_CategoryItem_History
		WHERE Category_ID=@Category_ID

		INSERT INTO [POS_CategoryItem_History]
		(Category_ID, Line_Item, Category_Name, Category_Color, Created_User, Created_Date)
		VALUES
		(@Category_ID, COALESCE(@LINEITEM, 0), @Category_Name, @Category_Color, @UserID, DATEADD(HOUR,1,GETDATE()))
			
		SELECT CODE='200', Category_Name=@Category_Name

	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000),@ErrorSeverity INT,@ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState)
	END CATCH
END
GO