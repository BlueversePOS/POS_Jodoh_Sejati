create or alter proc TRX_TrfItem_GetDataTransferHDR
(
@DOCNUMBER nvarchar(20)
)
AS          
BEGIN
	BEGIN TRY
		select X.*, COALESCE(Z.Role_Name, '') Role_Name
		from(
			select DOCNUMBER, DOCDATE, SourceSite_ID, SourceSite_Name, DestSite_ID, DestSite_Name, Total_Line_Item, Notes, [Status], 
			CASE
			WHEN COALESCE(Modified_User, '') = '' THEN Created_User
			WHEN COALESCE(Modified_User, '') <> '' THEN Modified_User
			ELSE '' END Modified_User
			from POS_TrxItemTrf_HeaderTEMP A
			where A.DOCNUMBER=@DOCNUMBER
			UNION
			select DOCNUMBER, Modified_Date DOCDATE, SourceSite_ID, SourceSite_Name, DestSite_ID, DestSite_Name, Total_Line_Item, Notes, [Status], 
			CASE
			WHEN COALESCE(Modified_User, '') = '' THEN Created_User
			WHEN COALESCE(Modified_User, '') <> '' THEN Modified_User
			ELSE '' END Modified_User
			from POS_TrxItemTrf_HeaderPOST A
			where A.DOCNUMBER=@DOCNUMBER
		) X
		left join POS_Account XY ON X.Modified_User=XY.UserID
		left join POS_Employee Y ON XY.EmailAddress=Y.Email
		left join POS_EmployeeRole Z ON Y.Role_ID=Z.Role_ID
	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000),@ErrorSeverity INT,@ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState)
	END CATCH
END
GO
/*
exec TRX_TrfItem_GetDataTransferHDR 'TRF0001'
*/