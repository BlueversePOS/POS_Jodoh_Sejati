CREATE OR ALTER PROC [dbo].[CMS_SO_GET_LU_CUSTOMERADDRESS]
(
	@USERID VARCHAR(50),
	@INTERID VARCHAR(50),
	@PREFIX VARCHAR(250) = ''
)
AS
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
			select ADRSCODE, ShipToName
			from RM00102 with(nolock) --Master Customer Address
			where CUSTNMBR = @PREFIX
			order by CUSTNMBR
	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000), @ErrorSeverity INT, @ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState)
	END CATCH
END
GO

/*
	exec CMS_SO_GET_LU_CUSTOMERADDRESS '',''

	select * from RM00102
*/


