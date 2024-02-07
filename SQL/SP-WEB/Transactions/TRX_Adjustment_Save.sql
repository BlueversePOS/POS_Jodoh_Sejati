/*
begin tran

declare @p9 dbo.TrxAdjDetailTYPE
insert into @p9 values('2024-01-27 09:46:54',N'Receive Items',10,N'ITM0001',N'tester',0.0,50.0,0.0,0.0,50.0,0.0,0.0)

exec TRX_Adjustment_Save @DOCNUMBER=N'',@DOCDATE='2024-01-27 09:46:54',@Site_ID=N'SITE0001',@Site_Name=N'SITE A',@Reason=N'Receive Items',@Total_Line_Item=1,@Notes=N'tester',@UserID=N'USER1',@TrxAdjDetailTYPE=@p9

rollback
*/
create or alter proc TRX_Adjustment_Save
(
	@DOCNUMBER nvarchar(20), 
	@DOCDATE DATETIME,
	@Site_ID nvarchar(20), 
	@Site_Name nvarchar(100), 
	@Reason nvarchar(30), 
	@Total_Line_Item int,
	@Notes nvarchar(500),
	@UserID nvarchar(20),
	@TrxAdjDetailTYPE TrxAdjDetailTYPE readonly
)
AS          
BEGIN
	BEGIN TRY
		IF LEN(RTRIM(@Reason)) = 0
		BEGIN
			RAISERROR('Please choose reason', 16, 1)
		END
		IF LEN(RTRIM(@Site_ID)) = 0
		BEGIN
			RAISERROR('Please choose site', 16, 1)
		END
		IF NOT EXISTS(SELECT * FROM @TrxAdjDetailTYPE)
		BEGIN
			RAISERROR('Please fill items', 16, 1)
		END
		IF EXISTS(SELECT * FROM POS_TrxAdjustment_Header WITH(NOLOCK) WHERE RTRIM(DOCNUMBER)=RTRIM(@DOCNUMBER))
		BEGIN
			UPDATE POS_TrxAdjustment_Header
			SET DOCDATE=@DOCDATE, Site_ID=@Site_ID, Site_Name=@Site_Name, Reason=@Reason, Total_Line_Item=@Total_Line_Item, Notes=@Notes,
			Modified_User=@UserID, Modified_Date=CAST(GETDATE() as date), Modified_time=CAST(GETDATE() as time)
			WHERE RTRIM(DOCNUMBER)=RTRIM(@DOCNUMBER)
		END
		ELSE
		BEGIN
			IF LEN(RTRIM(@DOCNUMBER)) = 0
			BEGIN
				declare @p varchar(30)
				EXEC Web_Generate_NumberMaster @TABLE=N'POS_TrxAdjustment_Header', @FIELD=N'DOCNUMBER', @DOCID=N'SA', @NEWNUMBER=@p output
				SET @DOCNUMBER=@p
			END
			INSERT INTO [POS_TrxAdjustment_Header]
			(DOCNUMBER, DOCDATE, Site_ID, Site_Name, Reason, Total_Line_Item, Notes, Created_User, Created_Date, Created_time, Modified_User, Modified_Date, Modified_time)
			VALUES
			(@DOCNUMBER, @DOCDATE, @Site_ID, @Site_Name, @Reason, @Total_Line_Item, @Notes, @UserID, CAST(GETDATE() as date), CAST(GETDATE() as time), '', '', '')
		END

		DELETE FROM POS_TrxAdjustment_Detail WHERE RTRIM(DOCNUMBER)=RTRIM(@DOCNUMBER)
			
		INSERT INTO POS_TrxAdjustment_Detail(DOCNUMBER, DOCDATE, Reason, Lineitmseq, Item_Number, Item_Description, Qty_Stock, Qty_Add_Stock, Qty_Remove_Stock, 
		Item_Cost, Qty_After_Stock, Expected_Stock, Counted_Stock, Created_User, Created_Date, Created_time, Modified_User, Modified_Date, Modified_time)
		SELECT @DOCNUMBER, DOCDATE, Reason, Lineitmseq, Item_Number, Item_Description, Qty_Stock, Qty_Add_Stock, Qty_Remove_Stock, 
		Item_Cost, Qty_After_Stock, Expected_Stock, Counted_Stock, @UserID, CAST(GETDATE() as date), CAST(GETDATE() as time), '', '', ''
		FROM @TrxAdjDetailTYPE

		UPDATE A
		SET A.InStock=CASE
			WHEN LOWER(RTRIM(@Reason)) = 'inventory count' THEN ISNULL(B.Counted_Stock, 0)
			ELSE ISNULL(B.Qty_After_Stock, 0) END
		FROM POS_Item A
		INNER JOIN POS_TrxAdjustment_Detail B ON A.Item_Number=B.Item_Number
		WHERE RTRIM(B.DOCNUMBER)=RTRIM(@DOCNUMBER)

		INSERT INTO POS_TrxAdjustment_HeaderHIST(DOCNUMBER, DOCDATE, Site_ID, Site_Name, Reason, Total_Line_Item, Notes, Created_User, Created_Date, Created_time)
		SELECT DOCNUMBER, DOCDATE, Site_ID, Site_Name, Reason, Total_Line_Item, Notes, @UserID, CAST(GETDATE() as date), CAST(GETDATE() as time)
		FROM POS_TrxAdjustment_Header
		WHERE RTRIM(DOCNUMBER)=RTRIM(@DOCNUMBER)

		INSERT INTO POS_TrxAdjustment_DetailHIST(DOCNUMBER, DOCDATE, Reason, Lineitmseq, Item_Number, Item_Description, Qty_Stock, 
		Qty_Add_Stock, Qty_Remove_Stock, Item_Cost, Qty_After_Stock, Expected_Stock, Counted_Stock, Created_User, Created_Date, Created_time)
		SELECT DOCNUMBER, DOCDATE, Reason, Lineitmseq, Item_Number, Item_Description, Qty_Stock, Qty_Add_Stock, Qty_Remove_Stock, Item_Cost, 
		Qty_After_Stock, Expected_Stock, Counted_Stock, @UserID, CAST(GETDATE() as date), CAST(GETDATE() as time)
		FROM POS_TrxAdjustment_Detail
		WHERE RTRIM(DOCNUMBER)=RTRIM(@DOCNUMBER)

		SELECT CODE='200', DOCNUMBER=@DOCNUMBER

	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000),@ErrorSeverity INT,@ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState)
	END CATCH
END
GO