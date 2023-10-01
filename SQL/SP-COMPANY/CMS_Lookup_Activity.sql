CREATE OR ALTER proc [dbo].[CMS_Lookup_Activity]
AS
BEGIN	
	select distinct *
	from PRYF002
	WHERE PR_Charges_Type=1
END
/*
exec [CMS_Lookup_Activity]
*/
GO
