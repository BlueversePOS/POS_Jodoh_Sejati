CREATE OR ALTER proc [dbo].[CMS_Lookup_Route]
AS
BEGIN	
	select distinct *
	from CMS01036002C3 A
END
/*
exec [CMS_Lookup_Route]
*/
GO
