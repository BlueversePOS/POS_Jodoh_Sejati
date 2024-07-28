/*
begin tran

declare @p8 dbo.TrxInvCountTYPE
insert into @p8 values(10,N'ITM0003',N'SERAGAM SD (S / GS)',N'',100.0,0.0,0.0,0.0,0.0)
insert into @p8 values(20,N'ITM0003',N'SERAGAM SD (S / SUPER)',N'',100.0,0.0,0.0,0.0,0.0)

exec TRX_InvCount_Save @DOCNUMBER=N'',@Site_ID=N'SITE0002',@Site_Name=N'SITE B',@Type_Inventory_Count=1,@Notes=N'tester',@Status=1,@UserID=N'USER1',@TrxInvCountTYPE=@p8

rollback
*/
create or alter proc [dbo].[TRX_InvCount_Save]
(
	@DOCNUMBER nvarchar(20), 
	@Site_ID nvarchar(20), 
	@Site_Name nvarchar(100), 
	@Type_Inventory_Count int,
	@Notes nvarchar(500), 
	@Status int,
	@InvCount int,
	@UserID nvarchar(20),
	@TrxInvCountTYPE TrxInvCountTYPE readonly
)
AS          
BEGIN
	BEGIN TRY
		DECLARE @CurrDate datetime = SYSDATETIMEOFFSET() AT TIME ZONE 'SE Asia Standard Time'
		IF @InvCount=1
		BEGIN
			SELECT @Site_ID=Site_ID, @Site_Name=Site_Name, @Type_Inventory_Count=Type_Inventory_Count, @Notes=Notes 
			FROM POS_TrxInvCount_HeaderTEMP with (nolock)
			WHERE RTRIM(DOCNUMBER)=RTRIM(@DOCNUMBER)
		END

		IF LEN(RTRIM(@Site_ID)) = 0 and @Status = 3
		BEGIN
			RAISERROR('Please choose site', 16, 1)
		END
		IF NOT EXISTS(SELECT * FROM @TrxInvCountTYPE) and @Type_Inventory_Count=1
		BEGIN
			RAISERROR('Please fill items', 16, 1)
		END

		DECLARE @TrxInvCountTABLE table(Lineitmseq int, Item_Number nvarchar(20), Item_Description nvarchar(250), Item_SKU nvarchar(20), 
		Expected_Stock numeric(19,5), Counted_Stock numeric(19,5), Different_Stock numeric(19,5), Item_Cost numeric(19,5), Item_Cost_Different numeric(19,5))

		INSERT INTO @TrxInvCountTABLE(Lineitmseq, Item_Number, Item_Description, Item_SKU, Expected_Stock, Counted_Stock, Different_Stock, Item_Cost, Item_Cost_Different)
		select distinct Z.Lineitmseq, Z.Item_Number, Z.Item_Description, Z.Item_SKU, Z.Expected_Stock, Z.Counted_Stock, Z.Different_Stock, 
		CASE WHEN COALESCE(B.Item_SKU, '') <> '' THEN ISNULL(B.Item_Cost, 0) ELSE ISNULL(A.Item_Cost, 0) END, Z.Item_Cost_Different
		from @TrxInvCountTYPE Z
		left join POS_Item A ON Z.Item_Number=A.Item_Number
		left join POS_ItemVariant B ON Z.Item_Number=B.Item_Number and Z.Item_SKU=B.Item_SKU

		IF @Type_Inventory_Count=2
		BEGIN
			DELETE FROM @TrxInvCountTABLE

			INSERT INTO @TrxInvCountTABLE(Lineitmseq, Item_Number, Item_Description, Item_SKU, Expected_Stock, Counted_Stock, Different_Stock, Item_Cost, Item_Cost_Different)
			SELECT ROW_NUMBER() OVER(ORDER BY Item_Number), Item_Number, Item_Description, Item_SKU, 0, 0, 0, Item_Cost, 0
			FROM(
				select Z.Item_Number, Z.Item_Description, Z.LineItem_Option, Z.Item_SKU, 
				CASE WHEN @Site_ID='' THEN 0 ELSE ISNULL(B.InStock, 0) END InStock, ISNULL(B.Item_Cost, 0) Item_Cost
				from(
					SELECT DISTINCT A.Item_Number, 
					A.Item_Name + CASE
					WHEN COALESCE(B.Variant_Name, '') <> '' THEN ' (' + COALESCE(B.Variant_Name, '') + ')'
					ELSE '' END Item_Description, 
					ISNULL(B.LineItem_Option, 0) LineItem_Option, COALESCE(B.Item_SKU, '') Item_SKU
					FROM POS_Item A with (nolock)
					left join POS_ItemVariant B with (nolock) ON A.Item_Number=B.Item_Number
				) Z
				left join POS_ItemVariant B ON Z.Item_Number=B.Item_Number and Z.Item_SKU=B.Item_SKU
				where B.Site_ID=@Site_ID
				UNION
				select X.Item_Number, X.Item_Description, 0 LineItem_Option, X.Item_SKU, 
				CASE WHEN @Site_ID='' THEN 0 ELSE X.InStock END InStock, X.Item_Cost
				from POS_Item X
				where X.Site_ID=@Site_ID and X.Item_Number not in(select Item_Number from POS_ItemVariant) 
			) A
			order by A.Item_SKU
		END
		DECLARE @DOCDATE DATETIME = CAST(@CurrDate as date), @Completed_Date DATETIME = '1900-01-01',
				@Total_Line_Item int=0
		
		SELECT @Total_Line_Item=COUNT(*) FROM @TrxInvCountTABLE

		IF @Status=3 BEGIN SET @Completed_Date = CAST(@CurrDate as date) END

		IF @Status < 3
		BEGIN
			IF EXISTS(SELECT * FROM POS_TrxInvCount_HeaderTEMP WITH(NOLOCK) WHERE RTRIM(DOCNUMBER)=RTRIM(@DOCNUMBER))
			BEGIN
				UPDATE POS_TrxInvCount_HeaderTEMP
				SET Completed_Date=CASE WHEN @Status=3 THEN @Completed_Date ELSE '' END, Site_ID=@Site_ID, Site_Name=@Site_Name, Type_Inventory_Count=@Type_Inventory_Count,
				Total_Line_Item=@Total_Line_Item, Notes=@Notes, [Status]=@Status, Modified_User=@UserID, Modified_Date=CAST(@CurrDate as date), Modified_time=CAST(@CurrDate as time)
				WHERE RTRIM(DOCNUMBER)=RTRIM(@DOCNUMBER)
			END
			ELSE IF LEN(RTRIM(@DOCNUMBER)) = 0
			BEGIN
				declare @I int=0
				declare @TEMPTABLE table(CurrentNumber varchar(20))
				WHILE @I < 1
				BEGIN
					DELETE FROM @TEMPTABLE
					INSERT INTO @TEMPTABLE(CurrentNumber)
					EXEC TRX_GenerateNumberPerDay_Master @DOCID=N'IVC'

					SELECT TOP 1 @DOCNUMBER=CurrentNumber, @I=1 FROM @TEMPTABLE

					IF EXISTS(SELECT * FROM POS_TrxInvCount_HeaderTEMP WITH(NOLOCK) WHERE RTRIM(DOCNUMBER)=RTRIM(@DOCNUMBER))
					or EXISTS(SELECT * FROM POS_TrxInvCount_HeaderPOST WITH(NOLOCK) WHERE RTRIM(DOCNUMBER)=RTRIM(@DOCNUMBER))
					BEGIN
						SET @I = 0
					END
				END

				INSERT INTO [POS_TrxInvCount_HeaderTEMP]
				(DOCNUMBER, DOCDATE, Completed_Date, Site_ID, Site_Name, Type_Inventory_Count, Total_Line_Item, 
				Notes, [Status], Created_User, Created_Date, Created_time, Modified_User, Modified_Date, Modified_time)
				VALUES
				(@DOCNUMBER, @DOCDATE, @Completed_Date, @Site_ID, @Site_Name, @Type_Inventory_Count, @Total_Line_Item, 
				@Notes, @Status, @UserID, CAST(@CurrDate as date), CAST(@CurrDate as time), '', '', '')
			END
		END

		DELETE FROM POS_TrxInvCount_DetailTEMP
		WHERE RTRIM(DOCNUMBER)=RTRIM(@DOCNUMBER) and Lineitmseq not in(select Lineitmseq from @TrxInvCountTABLE)
			
		MERGE POS_TrxInvCount_DetailTEMP AS A --TARGET
		USING (
			SELECT *
			FROM @TrxInvCountTABLE X 
		) AS B --SOURCE
		ON A.DOCNUMBER = @DOCNUMBER and A.Lineitmseq=B.Lineitmseq

		WHEN MATCHED THEN
		UPDATE 
		SET Item_Number=B.Item_Number, Item_Description=B.Item_Description, Item_SKU=B.Item_SKU, Expected_Stock=B.Expected_Stock, Counted_Stock=B.Counted_Stock, Different_Stock=B.Different_Stock, 
		Item_Cost=B.Item_Cost, Item_Cost_Different=B.Item_Cost_Different, Modified_User=@UserID, Modified_Date= cast(@CurrDate as date), Modified_time= cast(@CurrDate as time)

		WHEN NOT MATCHED BY TARGET THEN
		INSERT(DOCNUMBER, DOCDATE, Lineitmseq, Item_Number, Item_Description, Item_SKU, Expected_Stock, Counted_Stock, Different_Stock, 
		Item_Cost, Item_Cost_Different, Created_User, Created_Date, Created_time, Modified_User, Modified_Date, Modified_time)
		VALUES(@DOCNUMBER, @DOCDATE, B.Lineitmseq, B.Item_Number, B.Item_Description, B.Item_SKU, B.Expected_Stock, B.Counted_Stock, B.Different_Stock, 
		B.Item_Cost, B.Item_Cost_Different, @UserID, cast(@CurrDate as date), cast(@CurrDate as time), '','','' );
		
		INSERT INTO POS_TrxInvCount_HeaderHIST(DOCNUMBER, DOCDATE, Completed_Date, Site_ID, Site_Name, Type_Inventory_Count, Total_Line_Item, Notes, [Status], Created_User, Created_Date, Created_time)
		SELECT DOCNUMBER, DOCDATE, Completed_Date, Site_ID, Site_Name, Type_Inventory_Count, Total_Line_Item, Notes, @Status, Created_User, cast(@CurrDate as date), cast(@CurrDate as time)
		FROM POS_TrxInvCount_HeaderTEMP WHERE RTRIM(DOCNUMBER)=RTRIM(@DOCNUMBER)

		INSERT INTO POS_TrxInvCount_DetailHIST(DOCNUMBER, DOCDATE, Lineitmseq, Item_Number, Item_Description, Item_SKU, Expected_Stock, 
		Counted_Stock, Different_Stock, Item_Cost, Item_Cost_Different, Created_User, Created_Date, Created_time, Modified_User, Modified_Date, Modified_time)
		SELECT DOCNUMBER, DOCDATE, Lineitmseq, Item_Number, Item_Description, Item_SKU, Expected_Stock, Counted_Stock, Different_Stock, 
		Item_Cost, Item_Cost_Different, Created_User, cast(@CurrDate as date), cast(@CurrDate as time), Modified_User, cast(@CurrDate as date), cast(@CurrDate as time)
		FROM POS_TrxInvCount_DetailTEMP WHERE RTRIM(DOCNUMBER)=RTRIM(@DOCNUMBER)

		IF @Status=3
		BEGIN
			INSERT INTO POS_TrxInvCount_HeaderPOST(DOCNUMBER, DOCDATE, Completed_Date, Site_ID, Site_Name, Type_Inventory_Count, 
			Total_Line_Item, Notes, [Status], Created_User, Created_Date, Created_time, Modified_User, Modified_Date, Modified_time)
			SELECT DOCNUMBER, DOCDATE, cast(@CurrDate as date), Site_ID, Site_Name, Type_Inventory_Count, Total_Line_Item, 
			Notes, @Status, Created_User, cast(@CurrDate as date), cast(@CurrDate as time), Modified_User, cast(@CurrDate as date), cast(@CurrDate as time)
			FROM POS_TrxInvCount_HeaderTEMP WHERE RTRIM(DOCNUMBER)=RTRIM(@DOCNUMBER)

			INSERT INTO POS_TrxInvCount_DetailPOST(DOCNUMBER, DOCDATE, Lineitmseq, Item_Number, Item_Description, Item_SKU, Expected_Stock, 
			Counted_Stock, Different_Stock, Item_Cost, Item_Cost_Different, Created_User, Created_Date, Created_time, Modified_User, Modified_Date, Modified_time)
			SELECT DOCNUMBER, DOCDATE, Lineitmseq, Item_Number, Item_Description, Item_SKU, Expected_Stock, Counted_Stock, Different_Stock, 
			Item_Cost, Item_Cost_Different, Created_User, cast(@CurrDate as date), cast(@CurrDate as time), Modified_User, cast(@CurrDate as date), cast(@CurrDate as time)
			FROM POS_TrxInvCount_DetailTEMP WHERE RTRIM(DOCNUMBER)=RTRIM(@DOCNUMBER)
			
			DELETE FROM POS_TrxInvCount_HeaderTEMP WHERE RTRIM(DOCNUMBER)=RTRIM(@DOCNUMBER)
			DELETE FROM POS_TrxInvCount_DetailTEMP WHERE RTRIM(DOCNUMBER)=RTRIM(@DOCNUMBER)
		END

		SELECT CODE='200', DOCNUMBER=@DOCNUMBER

	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000),@ErrorSeverity INT,@ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState)
	END CATCH
END
GO
