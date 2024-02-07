create or alter proc Web_Discounts_SaveData
(
	@UserID nvarchar(20),
	@Discount_ID nvarchar(30),
	@Discount_Name nvarchar(100),
	@Discount_Type int,
	@Discount_Value numeric(19,5),
	@Restricted_Access int
)
AS          
BEGIN
	BEGIN TRY
		BEGIN
			IF LEN(ISNULL(@Discount_Name,''))=0
			BEGIN
				RAISERROR('Please fill discount name.',16,1)
			END
			IF ISNULL(@Discount_Type,0)=0
			BEGIN
				RAISERROR('Please choose discount type.',16,1)
			END
			IF LEN(ISNULL(@Discount_Value,''))=0
			BEGIN
				RAISERROR('Please fill discount value.',16,1)
			END
		END

		IF EXISTS(SELECT * FROM POS_Discount WITH(NOLOCK) WHERE RTRIM(Discount_ID)=RTRIM(@Discount_ID))
		BEGIN
			UPDATE POS_Discount
			SET Discount_Name=@Discount_Name, Discount_Type=@Discount_Type, Discount_Value=@Discount_Value, 
			Restricted_Access=@Restricted_Access, Modified_User=@UserID, Modified_Date=DATEADD(HOUR,1,GETDATE())
			WHERE RTRIM(Discount_ID)=RTRIM(@Discount_ID)
		END
		ELSE
		BEGIN
			declare @p varchar(30)
			EXEC Web_Generate_NumberMaster @TABLE=N'POS_Discount', @FIELD=N'Discount_ID', @DOCID=N'DISC', @NEWNUMBER=@p output
			SET @Discount_ID=@p

			INSERT INTO [POS_Discount]
			(Discount_ID, Discount_Name, Discount_Type, Discount_Value, Restricted_Access, Created_User, Created_Date, Modified_User, Modified_Date)
			VALUES
			(@Discount_ID, @Discount_Name, @Discount_Type, @Discount_Value, @Restricted_Access, @UserID, DATEADD(HOUR,1,GETDATE()), '', '')
		END

		DECLARE @LINEITEM int = 0
		SELECT @LINEITEM=MAX(COALESCE(Line_Item, 0)) + 1
		FROM POS_Discount_History
		WHERE Discount_ID=@Discount_ID

		INSERT INTO [POS_Discount_History]
		(Discount_ID, Discount_Name, Line_Item, Discount_Type, Discount_Value, Restricted_Access, Created_User, Created_Date)
		VALUES
		(@Discount_ID, @Discount_Name, COALESCE(@LINEITEM, 0), @Discount_Type, @Discount_Value, @Restricted_Access, @UserID, DATEADD(HOUR,1,GETDATE()))
			
		SELECT CODE='200', Discount_Name=@Discount_Name

	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000),@ErrorSeverity INT,@ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState)
	END CATCH
END
GO