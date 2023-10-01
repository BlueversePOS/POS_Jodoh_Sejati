CREATE OR ALTER proc CMS_Contract_GenerateNumber
(  
 @INTERID VARCHAR(30)
)  
AS BEGIN  
DECLARE @QUERY VARCHAR(MAX) = ''
	DECLARE @DOCID varchar(30)='', @p15 varchar(255)='', @LASTNUMBER VARCHAR(50)=''

	SELECT @DOCID = COALESCE(CMS_Contract_ID,'') FROM CMS01036001C3

	select @LASTNUMBER=AI_LAST_DOCUMENT_NUMBER 
	from AISM0001
	where RTRIM(DOCID)=RTRIM(@DOCID)

	exec DYNAMICS..GetRandomNextNumber @INTERID, @DOCID, @NextNumber=@p15 output
	set @LASTNUMBER = @p15

	select GENNUMBER=@LASTNUMBER
END  
/*  
  
exec CMS_Contract_GenerateNumber 'E_MKA'
  
*/
GO