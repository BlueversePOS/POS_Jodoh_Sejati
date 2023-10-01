CREATE OR ALTER PROC [dbo].[CMS_SO_GET_LU_CUSTOMER]
(
	@USERID VARCHAR(50),
	@INTERID VARCHAR(50)
)
AS
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
			select CUSTNMBR, CUSTNAME
			from RM00101 with(nolock) --Master Customer
			order by CUSTNMBR asc
	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000), @ErrorSeverity INT, @ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState)
	END CATCH
END
GO

/*
	exec CMS_SO_GET_LU_CUSTOMER '',''
*/


