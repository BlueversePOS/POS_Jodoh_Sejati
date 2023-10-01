SET NOCOUNT ON
--DECLARE @DBNAME VARCHAR(50)='A05_D,P08_D,DKGI_D,K01_D'
EXEC master.dbo.sp_configure 'show advanced options', 1
RECONFIGURE
EXEC master.dbo.sp_configure 'xp_cmdshell', 1
RECONFIGURE

--Create the Folder- en filetables.
DECLARE @SQLFolders TABLE ( SQLFolderName VARCHAR(MAX))
DECLARE @SQLFiles TABLE ( SQLFileName VARCHAR(MAX))
DECLARE @MainFolder VARCHAR(MAX)
DECLARE @FileName VARCHAR(MAX)
DECLARE @FolderName VARCHAR(MAX)
DECLARE @SQLStatement VARCHAR(2000)

DECLARE @QUERY VARCHAR(MAX)   
DECLARE @INTERID VARCHAR(10) 

SET @MainFolder = 'C:\Artha\'

--Fill the foldertable and loop through them.
INSERT INTO @SQLFolders VALUES ('SPCOMPANY\')
--INSERT INTO @SQLFolders VALUES ('SPDYNAMICS\')
--INSERT INTO @SQLFolders VALUES ('TABLETYPES\')

DECLARE cFolders CURSOR LOCAL FOR
    SELECT [SQLFolderName]
    FROM @SQLFolders
OPEN cFolders
FETCH NEXT FROM cFolders INTO @FolderName
WHILE @@FETCH_STATUS = 0
BEGIN
    --Fill the file-table and loop through.
    SET @SQLStatement = 'dir /b "' + @MainFolder + @FolderName + '*.sql"'
    INSERT INTO @SQLFiles

    EXECUTE master.dbo.xp_cmdshell @SQLStatement

    DECLARE cFiles CURSOR LOCAL FOR
        SELECT DISTINCT [SQLFileName]
        FROM @SQLFiles
        WHERE [SQLFileName] IS NOT NULL AND
              [SQLFileName] != 'NULL' AND
              [SQLFileName] != 'File Not Found'
        ORDER BY [SQLFileName]
    OPEN cFiles
    FETCH NEXT FROM cFiles INTO @FileName
    WHILE @@FETCH_STATUS = 0
    BEGIN

		/* CURSOR USE INTERID */
		DECLARE CURRINTERID CURSOR FOR   
			select A.INTERID
			from DYNAMICS..SY01500 A
			INNER JOIN SYS.DATABASES B ON A.INTERID=B.[NAME]
			where INTERID like 'E_%'

			/*
			select A.INTERID
			from DYNAMICS..SY01500 A
			INNER JOIN SYS.DATABASES B ON A.INTERID=B.[NAME]
			where INTERID like 'H_%'
			*/
			
		OPEN CURRINTERID   
		FETCH NEXT   
		 FROM CURRINTERID INTO @INTERID  
		WHILE @@FETCH_STATUS = 0   
		 BEGIN  
		  --SET @QUERY = 'USE '+@INTERID
		  --EXEC (@QUERY)
		  
		  PRINT @INTERID

		  /* RUNNING CREATE OR ALTER SP */
		  SET @SQLStatement = 'SQLCMD -d '+@INTERID+' -i' +  @MainFolder + @FolderName + @FileName
		  EXECUTE master.dbo.xp_cmdshell @SQLStatement
  
		  FETCH NEXT FROM CURRINTERID INTO @INTERID  
		 END   
		CLOSE CURRINTERID   
		DEALLOCATE CURRINTERID

        FETCH NEXT FROM cFiles INTO @FileName
    END

    DELETE FROM @SQLFiles

    CLOSE cFiles
    DEALLOCATE cFiles
    FETCH NEXT FROM cFolders INTO @FolderName
END

CLOSE cFolders
DEALLOCATE cFolders
GO

EXEC master.dbo.sp_configure 'xp_cmdshell', 0
RECONFIGURE
EXEC master.dbo.sp_configure 'show advanced options', 0
RECONFIGURE

SET NOCOUNT OFF