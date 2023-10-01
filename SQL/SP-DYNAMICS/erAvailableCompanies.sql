USE [DYNAMICS]
GO

/****** Object:  StoredProcedure [dbo].[erAvailableCompanies]    Script Date: 05/24/2023 16:31:56 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

 CREATE OR ALTER procedure [dbo].[erAvailableCompanies] @user_id char(15)=NULL as  set nocount on  if @user_id is NULL begin  return -1 end  if @user_id not in (select USERID from SY01400) begin  return -2 end  select   company_id  = company.CMPANYID,  company_name  = company.CMPNYNAM,  database_name  = company.INTERID  from    SY60100 company_access join   SY01500 company on company_access.CMPANYID = company.CMPANYID  where  company_access.USERID = @user_id and  company_access.CMPANYID in  (select   versions1.companyID  from  DU000020 versions1 join  DU000020 versions2 on  versions1.versionMajor = versions2.versionMajor and  versions1.versionMinor = versions2.versionMinor  where  versions2.companyID = -32767)  return 0   
GO


