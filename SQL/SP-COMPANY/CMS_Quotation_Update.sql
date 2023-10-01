CREATE OR ALTER proc CMS_Quotation_Update
(  
 @CMS_QUOTATION_NO varchar(21),
 @CMS_Status int,
 @USERID varchar(30)
)  
AS BEGIN  
	BEGIN TRY
		--begin transaction
		--header
		IF EXISTS(select top 1 * from CMS01131004C3 WHERE CMS_QUOTATION_NO=@CMS_QUOTATION_NO)
		BEGIN
			UPDATE CMS01131004C3 SET CMS_Status=@CMS_Status, MDFUSRID=@USERID, MODIFDT=CAST(GETDATE() as date), MODIFTIME=CAST(GETDATE() as time)
			WHERE CMS_QUOTATION_NO=@CMS_QUOTATION_NO
		END
		ELSE 
		BEGIN
			DECLARE @MESSAGE varchar(MAX)='Document ' + @CMS_QUOTATION_NO + ' is not exists'
			RAISERROR(@MESSAGE, 16, 1)
		END
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

exec CMS_Quotation_Update @CMS_CONTRACT_NO=N'CONTRACT/ID/00002',@CMS_Status=1,@USERID=N'teg01          '

*/
GO