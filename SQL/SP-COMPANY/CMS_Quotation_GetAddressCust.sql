CREATE OR ALTER proc CMS_Quotation_GetAddressCust
(  
 @CUSTNMBR VARCHAR(30)
)
AS BEGIN  
	select * from RM00102
	WHERE CUSTNMBR=@CUSTNMBR
END  
/*  
  
exec CMS_Quotation_GetAddressCust 'AAR'
  
*/
GO