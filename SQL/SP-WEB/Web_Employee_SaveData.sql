create or alter proc Web_Employee_SaveData
(
	@UserID nvarchar(20),
	@Employee_ID nvarchar(20),
	@Employee_Name nvarchar(250),
	@Email nvarchar(250),
	@Phone nvarchar(20),
	@Role_ID nvarchar(20),
	@User_ID nvarchar(20),
	@UserPassword nvarchar(250)
)
AS          
BEGIN
	BEGIN TRY
		BEGIN
			IF LEN(ISNULL(@Employee_Name,''))=0
			BEGIN
				RAISERROR('Please fill name.',16,1)
			END
			IF LEN(ISNULL(@User_ID,''))=0
			BEGIN
				RAISERROR('Please fill user id.',16,1)
			END
			IF LEN(ISNULL(@UserPassword,''))=0
			BEGIN
				RAISERROR('Please fill password.',16,1)
			END
			IF LEN(ISNULL(@Email,''))=0
			BEGIN
				RAISERROR('Please fill email.',16,1)
			END
			IF LEN(ISNULL(@Role_ID,''))=0
			BEGIN
				RAISERROR('Please choose role.',16,1)
			END
		END

		IF EXISTS(SELECT * FROM POS_Employee WITH(NOLOCK) WHERE RTRIM(Employee_ID)=RTRIM(@Employee_ID))
		BEGIN
			UPDATE POS_Employee
			SET Employee_Name=@Employee_Name, UserID=@User_ID, UserPassword=@UserPassword, Email=@Email, 
			Phone=@Phone, Role_ID=@Role_ID, Modified_User=@UserID, Modified_Date=CAST(GETDATE() as date)
			WHERE RTRIM(Employee_ID)=RTRIM(@Employee_ID)
		END
		ELSE
		BEGIN
			declare @p varchar(30)
			EXEC Web_Generate_NumberMaster @TABLE=N'POS_Employee', @FIELD=N'Employee_ID', @DOCID=N'EMP', @NEWNUMBER=@p output
			SET @Employee_ID=@p

			INSERT INTO [POS_Employee]
			(Employee_ID, Employee_Name, UserID, UserPassword, Email, Phone, Role_ID, Created_User, Created_Date, Modified_User, Modified_Date)
			VALUES
			(@Employee_ID, @Employee_Name, @User_ID, @UserPassword, @Email, @Phone, @Role_ID, @UserID, CAST(GETDATE() as date), '', '')
		END

		DECLARE @LINEITEM int = 0
		SELECT @LINEITEM=MAX(COALESCE(Line_Item, 0)) + 1
		FROM POS_Employee_History
		WHERE Employee_ID=@Employee_ID

		INSERT INTO [POS_Employee_History]
		(Employee_ID, Line_Item, Employee_Name, UserID, UserPassword, Email, Phone, Role_ID, Created_User, Created_Date)
		VALUES
		(@Employee_ID, COALESCE(@LINEITEM, 0), @Employee_Name, @User_ID, @UserPassword, @Email, @Phone, @Role_ID, @UserID, CAST(GETDATE() as date))
			
		SELECT CODE='200', Employee_ID=@Employee_ID

	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000),@ErrorSeverity INT,@ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState)
	END CATCH
END
GO

