CREATE OR ALTER proc [dbo].[CMS_Container_GetData] 
	@CONTAINER_NO VARCHAR(15)
AS
BEGIN
	SELECT RTRIM(GNL_Container_No) GNL_Container_No, 
	ISNULL(GNL_DDL_Type_Container, 0) GNL_DDL_Type_Container,
	ISNULL(GNL_DDL_Type_Container_2, 0) GNL_DDL_Type_Container_2, 
	ISNULL(GNL_DDL_Kepemilikan, 0) GNL_DDL_Kepemilikan, 
	ISNULL(GNL_DDL_DamageStatus, 0) GNL_DDL_DamageStatus
	FROM GNL01001006C3
	WHERE GNL_Container_No = @CONTAINER_NO

	SELECT RTRIM(GNL_Container_No) GNL_Container_No, LNITMSEQ,
	RTRIM(GNL_Contract_No) GNL_Contract_No, 
	RTRIM(GNL_Contract_Description) GNL_Contract_Description
	FROM GNL01029003C3
	WHERE GNL_Container_No = @CONTAINER_NO
END
/*
exec [CMS_Container_GetData] 'COBA' 
*/
GO