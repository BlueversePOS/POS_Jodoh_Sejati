CREATE OR ALTER proc [dbo].[Web_AccessRight_Getdatalist]
AS
BEGIN
	BEGIN TRY
		SELECT A.Role_ID, A.Role_Name, 
		CASE 
		WHEN A.BckOffice_Flag = 1 and A.POS_Flag = 1
		THEN 'Back Office and POS' 
		WHEN A.BckOffice_Flag = 1 and A.POS_Flag = 0
		THEN 'Back Office' 
		WHEN A.BckOffice_Flag = 0 and A.POS_Flag = 1
		THEN 'POS' 
		ELSE '' END Access, ISNULL(B.Access_Employee, 0) Access_Employee
		FROM POS_EmployeeRole A
		LEFT JOIN(
			select Role_ID, COUNT(Role_ID) Access_Employee from POS_Employee
			group by Role_ID
		) B ON A.Role_ID=B.Role_ID
		ORDER BY A.Role_Name asc
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
