CREATE OR ALTER proc CMS_Quotation_GetStatus
(
 @USERID varchar(30)
)
AS BEGIN  
	SELECT DISTINCT CMS_Status
	FROM CMS01131004C3
	WHERE CRUSRID=@USERID or MDFUSRID=@USERID
	ORDER BY CMS_Status
END  
/*  
  
exec CMS_Quotation_GenerateNumber 'E_MKA'
  
*/
GO