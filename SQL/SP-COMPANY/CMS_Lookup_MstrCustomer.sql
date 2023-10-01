CREATE OR ALTER proc [dbo].[CMS_Lookup_MstrCustomer]
AS
BEGIN	
	select distinct A.CUSTNMBR, A.CUSTNAME
	from RM00101 A
	where INACTIVE=0
END
/*
exec [CMS_Lookup_MstrCustomer]
*/
GO
