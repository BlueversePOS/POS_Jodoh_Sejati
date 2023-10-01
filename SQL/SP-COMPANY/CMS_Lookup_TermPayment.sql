CREATE OR ALTER proc [dbo].[CMS_Lookup_TermPayment]
AS
BEGIN	
	select distinct A.PYMTRMID, A.DUEDTDS 
	from SY03300 A
END
/*
exec [CMS_Lookup_TermPayment]
*/
GO
