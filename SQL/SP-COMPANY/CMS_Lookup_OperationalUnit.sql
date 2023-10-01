CREATE OR ALTER proc [dbo].[CMS_Lookup_OperationalUnit]
AS
BEGIN 
	select distinct * from BILDN010
END
/*
exec [CMS_Lookup_OperationalUnit]
*/
GO
