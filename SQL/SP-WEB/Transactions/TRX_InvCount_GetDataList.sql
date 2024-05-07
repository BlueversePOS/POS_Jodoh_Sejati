/*
exec TRX_InvCount_GetDataList @DOCNUMBER=N''
*/
create or alter proc TRX_InvCount_GetDataList
(
	@DOCNUMBER nvarchar(20),
	@Status int,
	@Site_ID nvarchar(20)
)
AS          
BEGIN
	BEGIN TRY
		IF NOT EXISTS(SELECT * FROM POS_TrxInvCount_HeaderTEMP WHERE RTRIM(DOCNUMBER)=RTRIM(@DOCNUMBER))
		and NOT EXISTS(SELECT * FROM POS_TrxInvCount_HeaderPOST WHERE RTRIM(DOCNUMBER)=RTRIM(@DOCNUMBER))
		and LEN(COALESCE(@DOCNUMBER, '')) > 0
		BEGIN
			RAISERROR('Document number not found', 16, 1)
		END

		SELECT DOCNUMBER, DOCDATE, Completed_Date, Site_ID, Site_Name, Type_Inventory_Count, Total_Line_Item, 
		Notes, [Status], CASE 
		WHEN [Status]=1 THEN 'Save' 
		WHEN [Status]=2 THEN 'In progress'
		WHEN [Status]=3 THEN 'Completed'
		ELSE '' END Status_Txt,
		Created_User, Created_Date, Created_time, Modified_User, Modified_Date, Modified_time
		FROM POS_TrxInvCount_HeaderTEMP 
		WHERE (RTRIM(DOCNUMBER)=RTRIM(@DOCNUMBER) or LEN(COALESCE(@DOCNUMBER, ''))=0)
		and ([Status]=@Status or @Status=0) and (Site_ID=@Site_ID or LEN(COALESCE(@Site_ID, ''))=0)
		UNION
		SELECT DOCNUMBER, DOCDATE, Completed_Date, Site_ID, Site_Name, Type_Inventory_Count, Total_Line_Item, 
		Notes, [Status], CASE 
		WHEN [Status]=1 THEN 'Save' 
		WHEN [Status]=2 THEN 'In progress'
		WHEN [Status]=3 THEN 'Completed'
		ELSE '' END Status_Txt,
		Created_User, Created_Date, Created_time, Modified_User, Modified_Date, Modified_time
		FROM POS_TrxInvCount_HeaderPOST 
		WHERE (RTRIM(DOCNUMBER)=RTRIM(@DOCNUMBER) or LEN(COALESCE(@DOCNUMBER, ''))=0)
		and ([Status]=@Status or @Status=0) and (Site_ID=@Site_ID or LEN(COALESCE(@Site_ID, ''))=0)
	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000),@ErrorSeverity INT,@ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState)
	END CATCH
END
GO
