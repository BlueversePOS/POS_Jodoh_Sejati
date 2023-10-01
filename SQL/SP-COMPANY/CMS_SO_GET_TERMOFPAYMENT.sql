CREATE OR ALTER PROC [dbo].[CMS_SO_GET_LU_TERMOFPAYMENT]
(
	@USERID VARCHAR(50),
	@INTERID VARCHAR(50)
)
AS
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
			select PYMTRMID, DUEDTDS PYMTRMDESC 
			from SY03300 with(nolock) --Term of Payment
			order by PYMTRMID asc
	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000), @ErrorSeverity INT, @ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState)
	END CATCH
END
GO

/*
	exec CMS_SO_GET_LU_TERMOFPAYMENT '',''

	select * from SY03300
*/


