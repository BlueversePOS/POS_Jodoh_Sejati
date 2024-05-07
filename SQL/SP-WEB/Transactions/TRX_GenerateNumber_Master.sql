CREATE OR ALTER proc [dbo].[TRX_GenerateNumber_Master]  
(  
 @TABLE NVARCHAR(30),
 @FIELD NVARCHAR(30),
 @DOCID NVARCHAR(30)
)  
AS BEGIN
	BEGIN TRY
		DECLARE @QUERY VARCHAR(MAX) = ''  
 
		 IF @DOCID != ''
		 begin
			SET @QUERY = '
			IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N''[dbo].['+@TABLE+']'') AND type in (N''U''))
			BEGIN
				RAISERROR(''Ups, something went wrong.'', 16, 1)
			END
			ELSE IF NOT EXISTS (SELECT 1 FROM sys.schemas s
							JOIN sys.tables t ON s.schema_id = t.schema_id
							JOIN sys.columns c ON t.object_id = c.object_id
							WHERE s.name = N''dbo'' AND t.name = N'''+@TABLE+''' AND c.name = N'''+@FIELD+''')
			BEGIN
				RAISERROR(''Ups, cannot find new number.'', 16, 1)
			END'
			EXEC(@QUERY)

			SET @QUERY = 'declare @IDMAX INT = 0, @p15 nvarchar(255)='''', @NEWDOC nvarchar(30)='''+@DOCID+'''
			DECLARE @DocNo varchar(max)=''''

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

			SET @DocNo = @NEWDOC + REPLICATE(''0'', 6 - LEN(@IDMAX))+CONVERT(nvarchar(68), @IDMAX)
			select @DocNo as OUTPUT'
		 end

		 EXEC(@QUERY)
	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000)
		DECLARE @ErrorSeverity INT
		DECLARE @ErrorState INT

		SELECT @ErrorMessage = ERROR_MESSAGE(),
			   @ErrorSeverity = ERROR_SEVERITY(),
			   @ErrorState = ERROR_STATE()

		RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState)
		select @ErrorMessage as output
	END CATCH 
END  
GO