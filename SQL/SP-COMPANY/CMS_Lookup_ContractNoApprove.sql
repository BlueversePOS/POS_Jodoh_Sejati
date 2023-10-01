CREATE OR ALTER proc [dbo].[CMS_Lookup_ContractNoApprove]
(
 @USERID varchar(30)
)  
AS
BEGIN
	select distinct *
	from CMS01131001C3
	WHERE CRUSRID=@USERID and CMS_Status=3
	ORDER BY MODIFDT, MODIFTIME desc
END
/*
exec [CMS_Lookup_ContractNoApprove] 'teg01'
*/
GO
