CREATE OR ALTER proc [dbo].[CMS_Lookup_Checkbook]
AS
BEGIN
	select distinct * from CM00100
	WHERE INACTIVE=0
END
/*
exec [CMS_Lookup_Checkbook]
*/
GO
