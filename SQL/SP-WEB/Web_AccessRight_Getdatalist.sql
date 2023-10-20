CREATE OR ALTER proc [dbo].[Web_AccessRight_Getdatalist]
AS
BEGIN
	BEGIN TRY
		SELECT Role_ID, Role_Name, 
		CASE 
		WHEN BckOffice_Flag = 1 and POS_Flag = 1
		THEN 'Back Office and POS' 
		WHEN BckOffice_Flag = 1 and POS_Flag = 0
		THEN 'Back Office' 
		WHEN BckOffice_Flag = 0 and POS_Flag = 1
		THEN 'POS' 
		ELSE '' END Access,
		COUNT(Role_ID) Access_Employee
		FROM POS_EmployeeRole
		GROUP BY Role_ID, Role_Name, BckOffice_Flag, POS_Flag
		ORDER BY Role_Name asc
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
EXEC Web_AccessRight_Getdatalist
*/