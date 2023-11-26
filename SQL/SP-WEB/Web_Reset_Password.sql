create or alter proc Web_Reset_Password
(
	@EmailAddress nvarchar(250)
)
AS          
BEGIN
	BEGIN TRY
		DECLARE @TEXT AS VARCHAR(MAX)
		DECLARE @BODY VARCHAR(MAX)=''

		DECLARE @PASSWORD as varchar(6)
		SELECT @PASSWORD = SUBSTRING(CONVERT(varchar(255), NEWID()), 0, 7)

		if not exists(select * from POS_LoginUser where EmailAddress=@EmailAddress)
		begin
			RAISERROR('This email is not registered', 16, 1)
		end
		SELECT @TEXT ='<span>Dear </span><b>'+RTRIM(@EmailAddress)+'</b>'

			SET @BODY = @BODY +'
				<body>
					<table width="1000">
					<tr>
						<td colspan="6" valign="middle" align="right" style="font-size:36px; font-family:''Segoe UI''; font-weight:400; padding-top: 60px; padding-bottom: 0px; padding-right: 200px;">
							Reset Password
						</td>
					</tr>
					<tr>
						<td colspan="6" style="font-size: 15px;font-family:''Segoe UI''; padding-left: 20px;">
						<br />
						</td>
					</tr>
					<tr>
						<td colspan="6" style="font-size: 15px;font-family:''Segoe UI''; padding-left: 20px;">
						'+@TEXT+'
						<br />
						<br />
						</td>
					</tr>
					<tr>
						<td colspan="6" style="font-size: 15px;font-family:''Segoe UI''; padding-left: 20px;">
						<b><i> Congratulations, your password has been reset successfully</i></b>
						</td>
					</tr>
					<tr>
						<td colspan="1" style="font-size: 13px;font-family:''Segoe UI''; padding-left: 20px; padding-bottom: 1px;" width="15%">Email</td>
						<td colspan="1" style="font-size: 13px;font-family:''Segoe UI''; padding-bottom: 1px;" width="2%">:</td>
						<td colspan="1" style="font-size: 13px;font-family:''Segoe UI''; padding-bottom: 1px;">'+RTRIM(@EMAIL)+'</td>
						<td colspan="3" style="font-size: 13px;font-family:''Segoe UI'';">
					</tr>
					<tr>
						<td colspan="6" style="font-size: 15px;font-family:''Segoe UI''; padding-left: 20px;">
						Your Temporary Password is <b>'+@PASSWORD+'</b>
						<br />
						<br />
						<i>Please log in and change with your new password.</i>
						<br />
						<br />
						<br />
						</td>
					</tr>
					<tr>
						<td colspan="6" style="font-size: 15px;font-family:''Segoe UI''; padding-left: 20px;">
						Thank You for using Blueverse POS and seeing again
						<br />
						<br />
						</td>
					</tr>
					<tr>
						<td colspan="6" style="font-size: 15px;font-family:''Segoe UI''; padding-left: 20px;">Blueverse Team
						<br />
						<br />
						<br />
						<br />
						</td>
					</tr>
					<tr>
						<td colspan="6" style="font-size: 15px;font-family:''Segoe UI''; padding-left: 20px;">
						This email is computer system generated. For assistance/support.
						</td>
					</tr>
					<tr>
						<td colspan="6" style="font-size: 15px;font-family:''Segoe UI''; padding-left: 20px;">
						<br />
						<br />
						</td>
					</tr>
				</table>
				</body>
							 '
				declare @PROFILE_NAME nvarchar(255)
				
				select top 1 @PROFILE_NAME=p.[name]
				from msdb.dbo.sysmail_profile p 
				join msdb.dbo.sysmail_profileaccount pa on p.profile_id = pa.profile_id 
				join msdb.dbo.sysmail_account a on pa.account_id = a.account_id 
				join msdb.dbo.sysmail_server s on a.account_id = s.account_id

				EXEC msdb.dbo.sp_send_dbmail                
				@profile_name = @PROFILE_NAME,
				@recipients = @EmailAddress,
				@body = @BODY,                
				@body_format = 'HTML',              
				@subject = 'Blueverse Reset Password'
   
		   SELECT CODE='200'

	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000), @ErrorSeverity INT, @ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState)
	END CATCH
END