CREATE OR ALTER proc [dbo].[CMS_Lookup_ContractNo]
(
 @USERID varchar(30)
)  
AS
BEGIN
	select distinct *
	from CMS01131001C3
	WHERE CRUSRID=@USERID and CMS_Status=1
	ORDER BY MODIFDT, MODIFTIME desc
END
/*
exec [CMS_Lookup_ContractNo] 'teg01'
*/
GO
