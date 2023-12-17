create or alter proc Web_Sett_SaveDataPayment
(
	@UserID nvarchar(20),
	@Payment_ID nvarchar(20), 
	@Payment_Type nvarchar(100),
	@Payment_Name nvarchar(300),
	@AllStore int,
	@PAYTYPE PAYTYPE readonly
)
AS          
BEGIN
	BEGIN TRY
		BEGIN
			IF LEN(ISNULL(@Payment_Name,''))=0
			BEGIN
				RAISERROR('Please fill payment name.',16,1)
			END
			IF LEN(ISNULL(@Payment_Type,''))=0
			BEGIN
				RAISERROR('Please choose payment type.',16,1)
			END
		END

		IF EXISTS(SELECT * FROM POS_Set_PayTypes WITH(NOLOCK) WHERE RTRIM(Payment_ID)=RTRIM(@Payment_ID))
		BEGIN
			UPDATE POS_Set_PayTypes
			SET Payment_Type=@Payment_Type, Payment_Name=@Payment_Name, AllStore=@AllStore, Modified_User=@UserID, Modified_Date=CAST(GETDATE() as date)
			WHERE RTRIM(Payment_ID)=RTRIM(@Payment_ID)
		END
		ELSE
		BEGIN
			declare @p varchar(30)
			EXEC Web_Generate_NumberMaster @TABLE=N'POS_Set_PayTypes', @FIELD=N'Payment_ID', @DOCID=N'PAY', @NEWNUMBER=@p output
			SET @Payment_ID=@p
		END

		DELETE FROM POS_Set_PayTypes WHERE RTRIM(Payment_ID)=RTRIM(@Payment_ID) and RTRIM(Store_ID) not in(select Store_ID from @PAYTYPE)

		DECLARE @Store_ID nvarchar(20)='', @Store_Name nvarchar(100)='', @LineItem int=0

		DECLARE @PAYTYPE2 table(LineItem int, AllStore int, Store_ID nvarchar(20), Store_Name nvarchar(100), ROWID int)
		INSERT INTO @PAYTYPE2(LineItem, AllStore, Store_ID, Store_Name, ROWID)
		SELECT LineItem, AllStore, Store_ID, Store_Name, ROW_NUMBER() OVER(ORDER BY LineItem)
		FROM @PAYTYPE

		DECLARE @I int=1, @COUNT int=0
		DECLARE @LINEITEM2 int = 0

		SELECT @COUNT=COUNT(*) FROM @PAYTYPE2

		WHILE @I <= @COUNT
		BEGIN
			SELECT @LineItem=LineItem, @AllStore=AllStore, @Store_ID=Store_ID, @Store_Name=@Store_Name
			FROM @PAYTYPE2 WHERE ROWID=@I

			INSERT INTO [POS_Set_PayTypes] (Payment_ID, Payment_Type, Payment_Name, LineItem, AllStore, Store_ID, Store_Name, Created_User, Created_Date, Modified_User, Modified_Date)
			SELECT @Payment_ID, @Payment_Type, @Payment_Name, LineItem, AllStore, Store_ID, Store_Name, @UserID, CAST(GETDATE() as date), @UserID, CAST(GETDATE() as date)
			FROM @PAYTYPE2

			SELECT @LINEITEM2=MAX(COALESCE(Line_Item, 0)) + 1
			FROM POS_Set_PayTypes_History
			WHERE Payment_ID=@Payment_ID

			INSERT INTO [POS_Set_PayTypes_History]
			(Payment_ID, Payment_Type, Line_Item, Payment_Name, LineItem, AllStore, Store_ID, Store_Name, Created_User, Created_Date)
			VALUES
			(@Payment_ID, @Payment_Type, COALESCE(@LINEITEM2, 0), @Payment_Name, @LineItem, @AllStore, @Store_ID, @Store_Name, @UserID, CAST(GETDATE() as date))

			SET @I = @I + 1
		END
		SELECT CODE='200', Payment_ID=@Payment_ID

	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000),@ErrorSeverity INT,@ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState)
	END CATCH
END
GO
/*
begin tran

declare @p6 dbo.PAYTYPE
insert into @p6 values(1,0,N'STR0001',N'STORE A')

exec Web_Sett_SaveDataPayment @UserID=N'USER1',@Payment_ID=N'',@Payment_Type=N'Cash',@Payment_Name=N'Payment Cash',@AllStore=0,@PAYTYPE=@p6

rollback
*/