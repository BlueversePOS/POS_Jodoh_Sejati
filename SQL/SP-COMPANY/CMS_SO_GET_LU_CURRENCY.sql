CREATE OR ALTER PROC [dbo].[CMS_SO_GET_LU_CURRENCY]
(
	@USERID VARCHAR(50),
	@INTERID VARCHAR(50)
)
AS
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
			select CURNCYID, CRNCYDSC, CRNCYSYM
			, case DECSYMBL when 1 then 'space' when 2 then '.' when 3 then ',' when 4 then '$' end DECSYMBL
			, case THOUSSYM when 1 then	'space' when 2 then '.' when 3 then ',' when 4 then '''' end THOUSSYM
			, COALESCE(DECPLCUR,0) DECPLCUR
			from DYNAMICS..MC40200 with(nolock) --Master Currency
			order by CURNCYID asc
	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000), @ErrorSeverity INT, @ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState)
	END CATCH
END
GO

/*
	exec CMS_SO_GET_LU_CURRENCY '',''

	select  * from DYNAMICS..MC40200 
*/


