CREATE OR ALTER proc [dbo].[CMS_Container_GetDataList] 
AS
BEGIN
	SELECT GNL_Container_No, GNL_DDL_Type_Container, CONTAINER_SIZE, 
	GNL_DDL_Type_Container_2, CONTAINER_SIZE2, 
	CONTAINER_SIZE + ' ' + CONTAINER_SIZE2 STRING_CONTAINER_SIZE,
	GNL_DDL_DamageStatus, [STATUS], GNL_DDL_Kepemilikan, [OWNERSHIP],
	GNL_Contract_No, GNL_Contract_Description, CREATDDT
	FROM (
		SELECT DISTINCT RTRIM(A.GNL_Container_No) GNL_Container_No, 
		ISNULL(A.GNL_DDL_Type_Container, 0) GNL_DDL_Type_Container, 
		CASE WHEN A.GNL_DDL_Type_Container = 1 THEN '20RF'
			 WHEN A.GNL_DDL_Type_Container = 2 THEN '20Dry'
			 WHEN A.GNL_DDL_Type_Container = 3 THEN '40RF'
			 WHEN A.GNL_DDL_Type_Container = 4 THEN '40Dry'
			 ELSE ''
		END AS CONTAINER_SIZE, 
		ISNULL(A.GNL_DDL_Type_Container_2, 0) GNL_DDL_Type_Container_2,
		CASE WHEN A.GNL_DDL_Type_Container_2 = 1 THEN 'STD'
			 WHEN A.GNL_DDL_Type_Container_2 = 2 THEN 'HC'
			 ELSE ''
		END AS CONTAINER_SIZE2, 
		ISNULL(A.GNL_DDL_DamageStatus, 0) GNL_DDL_DamageStatus,
		CASE WHEN A.GNL_DDL_DamageStatus = 1 THEN 'Ready'
			 WHEN A.GNL_DDL_DamageStatus = 2 THEN 'Service'
			 WHEN A.GNL_DDL_DamageStatus = 3 THEN 'On Duty'
			 WHEN A.GNL_DDL_DamageStatus = 4 THEN 'Small Damage'
			 WHEN A.GNL_DDL_DamageStatus = 5 THEN 'Medium Damage'
			 WHEN A.GNL_DDL_DamageStatus = 6 THEN 'Breakdown'
			 ELSE ''
		END AS [STATUS], 
		ISNULL(A.GNL_DDL_Kepemilikan, 0) GNL_DDL_Kepemilikan,
		CASE WHEN A.GNL_DDL_Kepemilikan = 1 THEN 'Own'
			 WHEN A.GNL_DDL_Kepemilikan = 2 THEN 'Ownlease'
			 WHEN A.GNL_DDL_Kepemilikan = 3 THEN 'Rental'
			 ELSE ''
		END AS [OWNERSHIP], ISNULL(RTRIM(B.GNL_Contract_No),'') GNL_Contract_No,
		ISNULL(RTRIM(B.GNL_Contract_Description), '') GNL_Contract_Description,
		A.CREATDDT
		FROM GNL01001006C3 A
		LEFT JOIN (
			SELECT GNL_Container_No, MAX(LNITMSEQ) LNITMSEQ
			FROM GNL01029003C3
			GROUP BY GNL_Container_No
		) C ON A.GNL_Container_No = C.GNL_Container_No
		LEFT JOIN GNL01029003C3 B ON A.GNL_Container_No = B.GNL_Container_No
		AND B.LNITMSEQ = C.LNITMSEQ
	) A
END
/*
exec [CMS_Container_GetDataList] 
*/
GO
