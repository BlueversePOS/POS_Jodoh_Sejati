CREATE OR ALTER proc [dbo].[CMS_Lookup_Department]
AS
BEGIN 
	select distinct * from UPR40300
END
/*
exec [CMS_Lookup_Department]
*/
GO
