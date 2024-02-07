IF EXISTS(SELECT * FROM SYSOBJECTS WHERE name='TRX_GenerateNumberPerDay_Master')
	DROP PROC TRX_GenerateNumberPerDay_Master
GO
CREATE proc [dbo].[TRX_GenerateNumberPerDay_Master]  
(  
 @DOCID NVARCHAR(30)
)  
AS BEGIN
	BEGIN TRY
		declare @IDMAX INT = 0, @p15 nvarchar(255)=''
		DECLARE @DocNo varchar(max)=''
		DECLARE @CURRENTDATE DATETIME = CAST(GETDATE() as DATE)
		DECLARE @LineItem int = 10

		IF RTRIM(COALESCE(@DOCID, '')) = ''
		BEGIN
			RAISERROR('Document ID not found.', 16, 1)
		END

		IF NOT EXISTS(select DocumentID from POS_RunningNumber where DocumentID=@DOCID and CAST(CurrentDate as DATE)=CAST(@CURRENTDATE as DATE))
		BEGIN
			SET @IDMAX = @IDMAX + 1
			SET @DocNo = @DOCID + '-' + FORMAT(@CURRENTDATE, 'dd-MM-yyyy') + '-' + REPLICATE('0', 3 - LEN(@IDMAX)) + CONVERT(nvarchar(68), @IDMAX)
		END
		ELSE
		BEGIN
			SELECT top 1 @IDMAX=ISNULL(cast(REPLACE(CurrentNumber,@DOCID + '-' + FORMAT(@CURRENTDATE, 'dd-MM-yyyy') + '-','') as INT), 0)
			FROM POS_RunningNumber 
			WHERE DocumentID=@DOCID

			SET @IDMAX = @IDMAX + 1

			SET @DocNo = @DOCID + '-' + FORMAT(@CURRENTDATE, 'dd-MM-yyyy') + '-' + REPLICATE('0', 3 - LEN(@IDMAX)) + CONVERT(nvarchar(68), @IDMAX)
		END

		IF NOT EXISTS(select DocumentID from POS_RunningNumber where DocumentID=@DOCID)
		BEGIN
			INSERT INTO POS_RunningNumber(DocumentID, CurrentNumber, CurrentDate)
			select @DOCID, @DocNo, @CURRENTDATE
		END
		ELSE
		BEGIN
			UPDATE POS_RunningNumber
			SET CurrentNumber=@DocNo, CurrentDate=@CURRENTDATE
			WHERE DocumentID=@DOCID
		END

		IF NOT EXISTS(select DocumentID from POS_RunningNumber_History where DocumentID=@DOCID)
		BEGIN
			INSERT INTO POS_RunningNumber_History(DocumentID, LineItem, CurrentNumber, CurrentDate)
			select @DOCID, @LineItem, @DocNo, @CURRENTDATE
		END
		ELSE IF NOT EXISTS(select DocumentID from POS_RunningNumber_History where DocumentID=@DOCID and CAST(CurrentDate as DATE)=CAST(@CURRENTDATE as DATE))
		BEGIN
			SELECT @LineItem=ISNULL(MAX(LineItem), 0) + 10
			from POS_RunningNumber_History where DocumentID=@DOCID

			INSERT INTO POS_RunningNumber_History(DocumentID, LineItem, CurrentNumber, CurrentDate)
			select @DOCID, @LineItem, @DocNo, @CURRENTDATE
		END
		ELSE IF EXISTS(select DocumentID from POS_RunningNumber_History where DocumentID=@DOCID)
		BEGIN
			UPDATE POS_RunningNumber_History
			SET CurrentNumber=@DocNo
			WHERE DocumentID=@DOCID
		END

		select @DocNo as GENNUMBER
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
/*  
begin tran
exec TRX_GenerateNumberPerDay_Master @DOCID=N'INV'
select * from POS_RunningNumber
select * from POS_RunningNumber_History
exec TRX_GenerateNumberPerDay_Master @DOCID=N'INV'
rollback
*/