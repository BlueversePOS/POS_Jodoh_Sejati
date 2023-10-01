CREATE OR ALTER PROC [dbo].[CMS_SO_GET_LU_CONTRACT]
(
	@USERID VARCHAR(50),
	@INTERID VARCHAR(50)
)
AS
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
			select CMS_CONTRACT_NO CONTRACTNO, DOCDATE, CMS_KETERANGAN CONTRACTDESC, A.CURNCYID, A.CRNCYSYM, CUSTNMBR, CUSTNAME
			, case B.DECSYMBL when 1 then 'space' when 2 then '.' when 3 then ',' when 4 then '$' end DECSYMBL
			, case B.THOUSSYM when 1 then	'space' when 2 then '.' when 3 then ',' when 4 then '''' end THOUSSYM
			, COALESCE(B.DECPLCUR,0) DECPLCUR, B.CRNCYDSC
			from CMS01131001C3 A --CMS_CONTRACT_HEADER
			left join DYNAMICS..MC40200 B on A.CURNCYID = B.CURNCYID
	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000), @ErrorSeverity INT, @ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState)
	END CATCH
END
GO

/*
	exec CMS_SO_GET_LU_CONTRACT '',''

	select * from CMS01131001C3 --CMS_CONTRACT_HEADER
	select * from DYNAMICS..MC40200 --Currency Setup
	
*/


