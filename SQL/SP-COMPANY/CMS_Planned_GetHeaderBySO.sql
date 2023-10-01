CREATE OR ALTER proc [dbo].[CMS_Planned_GetHeaderBySO]
(
 @CMS_SO_NO varchar(30)
)  
AS
BEGIN
	select distinct HDR.CMS_SO_NO, HDR.CMS_SUBMITTED_DATE, HDR.CMS_CONTRACT_NO, HDR.DOCDATE, HDR.LOCNCODE, HDR.LOCNDSCR, 
	HDR.CURNCYID, HDR.CRNCYDSC, COALESCE(CRC.CRNCYSYM, '') CRNCYSYM, HDR.CUSTNMBR, HDR.CUSTNAME, HDR.PYMTRMID, HDR.CMS_CUSTNMBR_BTA, 
	HDR.CMS_STUFFING_DATE, HDR.CMS_CONT_NO, HDR.CMS_DESC, HDR.CMS_Status, COALESCE(DOC.DOCNUMBR, '') DOCNUMBR, COALESCE(DOC.DOCDATE, '') DOC_DOCDATE, 
	COALESCE(DOC.CMS_SO_FILENAME, '') CMS_SO_FILENAME, COALESCE(DOC.CMS_SO_FILEPATH, '') CMS_SO_FILEPATH,
	CASE
	WHEN HDR.CMS_SALES_TYPE=1 THEN 'Local'
	WHEN HDR.CMS_SALES_TYPE=2 THEN 'Export'
	ELSE '' END CMS_SALES_TYPE, 
	CASE
	WHEN HDR.CMS_ORDER_TYPE=1 THEN 'SO'
	WHEN HDR.CMS_ORDER_TYPE=2 THEN 'NSO'
	WHEN HDR.CMS_ORDER_TYPE=3 THEN 'RENTAL'
	ELSE '' END CMS_ORDER_TYPE, 
	CASE
	WHEN HDR.PYMTTYPE=1 THEN 'COD'
	WHEN HDR.PYMTTYPE=2 THEN 'TOP'
	ELSE '' END PYMTTYPE, 
	CASE
	WHEN HDR.CMS_CONT_TYPE=1 THEN 'SOC'
	WHEN HDR.CMS_CONT_TYPE=2 THEN 'COC'
	ELSE '' END CMS_CONT_TYPE
	from CMS01133001C3 HDR
	LEFT JOIN CMS01133002C3 DOC ON HDR.CMS_SO_NO=DOC.CMS_SO_NO
	LEFT JOIN DYNAMICS..MC40200 CRC ON HDR.CURNCYID=CRC.CURNCYID
	WHERE HDR.CMS_SO_NO=@CMS_SO_NO
END
/*
exec [CMS_Planned_GetHeaderBySO] ''
*/
GO
