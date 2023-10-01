CREATE OR ALTER proc [dbo].[CMS_Lookup_UofM]
AS
BEGIN 
	select distinct * from IV40201
END
/*
exec [CMS_Lookup_UofM]
*/
GO
