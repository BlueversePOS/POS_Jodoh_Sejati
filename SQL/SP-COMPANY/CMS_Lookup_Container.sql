CREATE OR ALTER proc [dbo].[CMS_Lookup_Container]
AS
BEGIN	
	select distinct A.GNL_DDL_Type_Container, A.GNL_DDL_Type_Container_2,
	CASE 
	WHEN GNL_DDL_Type_Container=1 THEN '20RF'
	WHEN GNL_DDL_Type_Container=2 THEN '20Dry'
	WHEN GNL_DDL_Type_Container=3 THEN '40RF'
	WHEN GNL_DDL_Type_Container=4 THEN '40Dry'
	ELSE '' END SIZE
	from GNL01001006C3 A
END
/*
exec [CMS_Lookup_Container]
*/
GO
