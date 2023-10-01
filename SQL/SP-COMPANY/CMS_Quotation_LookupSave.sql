CREATE OR ALTER proc [dbo].[CMS_Quotation_LookupSave]
(
 @USERID varchar(30)
)  
AS
BEGIN
	select distinct *
	from CMS01131004C3
	WHERE CRUSRID=@USERID and CMS_Status=1
	ORDER BY MODIFDT, MODIFTIME desc
END
/*
exec [CMS_Quotation_LookupSave] 'teg01'
*/
GO
