CREATE OR ALTER PROC [dbo].[CMS_SO_GET_DOCUMENT_CHECKLIST]
(
	@USERID VARCHAR(50),
	@INTERID VARCHAR(50),
	@PREFIX VARCHAR(50) = ''
)
AS
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		select 0 CHECKED, B.CUSTNMBR, B.DOCNUMBR, B.DSCRIPTN from CMS01036009C3 A --Cust vs Doc --Customer
		left join CMS01036010C3 B on B.CUSTNMBR = A.CUSTNMBR --Cust vs Doc --Document
		where B.CUSTNMBR = @PREFIX
		order by DOCNUMBR desc
	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000), @ErrorSeverity INT, @ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState)
	END CATCH
END
GO

/*
	exec CMS_SO_GET_DOCUMENT_CHECKLIST '','','AAM'
	
	select * from CMS01036009C3 --Cust vs Doc --Customer
	select * from CMS01036010C3 --Cust vs Doc --Document

*/


