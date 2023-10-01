USE [DYNAMICS]
GO

/****** Object:  StoredProcedure [dbo].[AI_GETDATAUSER_GUIDAD]    Script Date: 05/24/2023 16:31:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROC [dbo].[AI_GETDATAUSER_GUIDAD]
(  
	@GUID VARCHAR(500)
)  
AS  
BEGIN  
	set nocount on;
	
	select tblUser.USERID, tblUser.USERNAME, tblUser.ADObjectGuid as [GUID]
		from SY01400 tblUser
	where RTRIM(tblUser.ADObjectGuid)=RTRIm(@GUID)
END  
  
  /*
  --sp_help SY01400

  exec [AI_GETDATAUSER_GUIDAD] '1128687a-5480-46d4-857a-f413d6abbf41'

  */
GO


