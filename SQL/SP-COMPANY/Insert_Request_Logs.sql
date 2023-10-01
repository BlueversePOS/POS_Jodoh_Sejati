CREATE OR ALTER proc [dbo].[Insert_Request_Logs]
(
@URL varchar(300),
@Header_1 varchar(200),
@Header_2 varchar(200),
@Header_3 varchar(200),
@Header_4 varchar(200),
@Header_5 varchar(200),
@msg varchar(300),
@USERID varchar(30),
@INTERID varchar(30),
@calledfrom varchar(100),
@logdate varchar(30),
@logtime varchar(30)
)
AS
BEGIN
	insert into PWO0103200500(url, Header_1, Header_2, Header_3, Header_4, Header_5, Body, http_code, msg, USERID, INTERID, calledfrom, logdate, logtime, apiresult)
	values
	(@URL, @Header_1, @Header_2, @Header_3, @Header_4, @Header_5, '', 0, @msg, @USERID, @INTERID, @calledfrom, CAST(@logdate as date), CAST(@logtime as time), '')

	DECLARE	@ID INT
	DECLARE @CNT INT=0, @LOGMAXRECORD INT=1000000, @TOBEDELETED INT=0, @DEX_ROW_ID INT=0

	SELECT @CNT = COUNT(1) FROM PWO0103200500 WITH(NOLOCK)
	
	IF @CNT IS NULL SELECT @CNT = 0
	
	SELECT @TOBEDELETED = CASE WHEN @CNT-@LOGMAXRECORD > 0 THEN @CNT-@LOGMAXRECORD ELSE 0 END
	
	SELECT @DEX_ROW_ID=MAX(DEX_ROW_ID) FROM (SELECT TOP(@TOBEDELETED) DEX_ROW_ID FROM PWO0103200500 ORDER BY DEX_ROW_ID)A
	
	IF @DEX_ROW_ID IS NULL SELECT @DEX_ROW_ID=0
	
	DELETE PWO0103200500 WHERE DEX_ROW_ID<=@DEX_ROW_ID
END
/*
exec [Insert_Request_Logs] '1234'
*/
GO
