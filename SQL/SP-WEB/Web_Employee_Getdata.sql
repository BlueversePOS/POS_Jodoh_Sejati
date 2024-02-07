CREATE OR ALTER proc [dbo].[Web_Employee_Getdata]
(
	@Employee_ID nvarchar(20)
)
AS
BEGIN
	BEGIN TRY
		SELECT A.*, COALESCE(B.Role_Name, '') Role_Name
		FROM POS_Employee A
		LEFT JOIN POS_EmployeeRole B ON A.Role_ID=B.Role_ID
		WHERE A.Employee_ID=@Employee_ID or @Employee_ID = ''
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
GO
/*
EXEC Web_Employee_Getdat ''
*/
