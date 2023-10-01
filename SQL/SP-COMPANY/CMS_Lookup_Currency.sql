CREATE OR ALTER proc [dbo].[CMS_Lookup_Currency]
AS
BEGIN	
	select distinct A.CURNCYID, CRNCYDSC, CRNCYSYM 
	from DYNAMICS..MC40200 A
END
/*
exec [CMS_Lookup_Currency]
*/
GO
