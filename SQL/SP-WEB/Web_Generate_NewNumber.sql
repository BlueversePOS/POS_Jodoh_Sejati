IF EXISTS(SELECT * FROM SYSOBJECTS WHERE name='Web_Generate_NewNumber')
	DROP PROC Web_Generate_NewNumber
GO
CREATE proc [dbo].[Web_Generate_NewNumber]  
(  
 @TABLE NVARCHAR(30),
 @FIELD NVARCHAR(30),
 @DOCID NVARCHAR(30)
)  
AS BEGIN  
 DECLARE @QUERY VARCHAR(MAX) = ''  
 
	 IF @DOCID != ''
	 begin
		 SET @QUERY = 'declare @IDMAX INT = 0, @p15 nvarchar(255)='''', @NEWDOC nvarchar(30)='''+@DOCID+'''
  
		SELECT top 1 @IDMAX= cast(REPLACE('+@FIELD+',@NEWDOC,'''') as INT)     
		FROM '+@TABLE+' 
		order by '+@FIELD+' DESC  
  
		SET @IDMAX= @IDMAX + 1

		IF @IDMAX = 9999
		BEGIN
			SET @IDMAX = 0
		
			SET @NEWDOC = @NEWDOC + ''2-''

			SELECT top 1 @IDMAX= cast(REPLACE('+@FIELD+',@NEWDOC,'''') as INT)     
			FROM '+@TABLE+'  
			order by '+@FIELD+' DESC  
  
			SET @IDMAX= @IDMAX + 1
		END

		DECLARE @DocNo varchar(max)='''' 
		SET @DocNo = @NEWDOC + REPLICATE(''0'', 4 - LEN(@IDMAX))+CONVERT(nvarchar(68), @IDMAX)
    
		select @DocNo as NEWNUMBER'
	 end

	 declare @t table (NEWNUMBER varchar(50))  
	 insert into @t  
	 EXEC(@QUERY)  
  
	 SELECT NEWNUMBER from @t  
END  
GO
/*  
  
exec Web_Generate_NewNumber @TABLE=N'POS_Discount', @FIELD=N'Discount_ID', @DOCID=N'DISC'
  
*/