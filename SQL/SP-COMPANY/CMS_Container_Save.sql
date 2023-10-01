CREATE OR ALTER proc CMS_Container_Save
(  
 @CONTAINER_NO varchar(21),
 @CONTAINER_SIZE int,
 @CONTAINER_SIZE2 int,
 @OWNERSHIP int,
 @STATUS int,
 @USERID varchar(30),
 @EDIT int,
 @DTCONTAINERDTL DTCONTAINERDTL readonly
)  
AS BEGIN  
	BEGIN TRY
		--begin transaction
		--header

		IF EXISTS(select top 1 * from GNL01001006C3 WHERE GNL_Container_No=@CONTAINER_NO) AND @EDIT = 1
		BEGIN
			UPDATE GNL01001006C3 SET GNL_DDL_Type_Container=@CONTAINER_SIZE, 
			GNL_DDL_Type_Container_2=@CONTAINER_SIZE2, GNL_DDL_Kepemilikan = @OWNERSHIP,
			GNL_DDL_DamageStatus = @STATUS, MDFUSRID=@USERID, MODIFDT=CAST(GETDATE() as date)
			WHERE GNL_Container_No=@CONTAINER_NO
		END
		ELSE IF EXISTS(select top 1 * from GNL01001006C3 WHERE GNL_Container_No=@CONTAINER_NO) AND @EDIT = 0
		BEGIN
			RAISERROR('Container Number already exists. Cannot Insert', 16, 1)
		END
		ELSE 
		BEGIN
			insert into GNL01001006C3(
				GNL_Container_No
				,GNL_DDL_Type_Container
				,GNL_DDL_Type_Container_2
				,GNL_DDL_DamageStatus
				,GNL_DDL_Kepemilikan
				,NOTEINDX
				,CRUSRID
				,CREATDDT
				,MDFUSRID
				,MODIFDT
			)
			values
			(@CONTAINER_NO, @CONTAINER_SIZE, @CONTAINER_SIZE2, @STATUS, @OWNERSHIP, 0, 
			@USERID, CAST(GETDATE() as date), '', '')
		END
		
		--detail Container
		MERGE GNL01029003C3 AS A
		USING @DTCONTAINERDTL AS B
		ON A.LNITMSEQ = B.LNITMSEQ
		AND A.GNL_Container_No = @CONTAINER_NO

		/*FOR UPDATE*/
		WHEN MATCHED THEN
			UPDATE SET 
			A.GNL_Contract_No = isnull(B.CONTRACT_NO,''),  
			A.GNL_Contract_Description = isnull(B.[DESCRIPTION],''),  
			A.MDFUSRID = @USERID,  
			A.MODIFDT = CAST(GETDATE() AS DATE)
						
		/*FOR INSERT*/
		WHEN NOT MATCHED BY Target THEN
			INSERT(
				GNL_Container_No
				,LNITMSEQ
				,GNL_Contract_No
				,GNL_Contract_Description
				,CRUSRID
				,CREATDDT
				,MDFUSRID
				,MODIFDT
			)
			VALUES(@CONTAINER_NO, B.LNITMSEQ, B.CONTRACT_NO,
					B.[DESCRIPTION], @USERID, 
					CAST(GETDATE() AS DATE), '', '');

			DELETE FROM GNL01029003C3
			WHERE GNL_Container_No = @CONTAINER_NO
			AND LNITMSEQ NOT IN (
				SELECT LNITMSEQ FROM @DTCONTAINERDTL
			)
	--commit
	END TRY
	BEGIN CATCH
		--rollback
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
/*  

declare @p23 dbo.DTCONTAINERDTL
insert into @p23 values(16384,N'1',N'TEST 1')
insert into @p23 values(32768,N'2',N'TEST 2')
insert into @p23 values(49152,N'3',N'TEST 3')

exec CMS_Container_Save @CONTAINER_NO=N'TEST',@CONTAINER_SIZE=1,@CONTAINER_SIZE2=1,
@OWNERSHIP=1,@STATUS=1,@USERID=N'ARTHA001',@DTCONTAINERDTL=@p23

*/
GO