CREATE OR ALTER proc CMS_Quotation_GetSite
AS BEGIN  
	select distinct * from IV40700
END  
/*  
  
exec CMS_Quotation_GetSite
  
*/
GO