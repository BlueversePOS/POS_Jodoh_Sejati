CREATE OR ALTER PROC [dbo].[CMS_SO_GET_DATALIST]
(
	@USERID VARCHAR(50),
	@INTERID VARCHAR(50)
)
AS
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		select A.CMS_SO_NO, A.CMS_SUBMITTED_DATE, A.CMS_CONTRACT_NO, case A.CMS_SALES_TYPE when 1 then 'Local' when 2 then 'Export' end CMS_SALES_TYPE
		, A.CMS_ORDER_TYPE, A.DOCDATE, A.LOCNCODE, A.LOCNDSCR, A.CURNCYID, A.CRNCYDSC, A.CUSTNMBR, A.CUSTNAME, A.PYMTTYPE
		, A.PYMTRMID, A.CMS_CUSTNMBR_BTA, A.CMS_STUFFING_DATE, A.CMS_CONT_TYPE, A.CMS_CONT_NO, A.CMS_DESC
		--, case A.CMS_Status when 1 then 'Saved' when 2 then 'Submitted' when 3 then 'Approved' when 4 then 'Rejected' when 5 then 'Complete' end CMS_Status
		, A.CMS_Status, 'HDR' DATATYPE, B.CRNCYSYM, B.DECPLCUR
		, case B.DECSYMBL when 1 then 'space' when 2 then '.' when 3 then ',' when 4 then '$' end DECSYMBL
		, case B.THOUSSYM when 1 then	'space' when 2 then '.' when 3 then ',' when 4 then '''' end THOUSSYM
		from CMS01133001C3 A with(nolock) --CMS_SO_HEADER
		left join DYNAMICS..MC40200 B on B.CURNCYID=A.CURNCYID--Currency Setup
	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000), @ErrorSeverity INT, @ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState)
	END CATCH
END
GO

/*
	exec CMS_SO_GET_DATALIST '',''

	select * from CMS01133001C3 --CMS_SO_HEADER
	select * from DYNAMICS..MC40200 --Currency Setup
	
*/


