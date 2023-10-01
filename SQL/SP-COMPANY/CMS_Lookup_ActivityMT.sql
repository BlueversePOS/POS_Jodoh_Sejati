CREATE OR ALTER proc [dbo].[CMS_Lookup_ActivityMT]
AS
BEGIN
	select distinct * from MFRE001
	WHERE FRER_Inactive=0
END
/*
exec [CMS_Lookup_ActivityMT]
*/
GO
