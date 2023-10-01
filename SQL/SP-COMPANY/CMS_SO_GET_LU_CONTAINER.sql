CREATE OR ALTER PROC [dbo].[CMS_SO_GET_LU_CONTAINER]
(
	@USERID VARCHAR(50),
	@INTERID VARCHAR(50)
)
AS
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
			select GNL_Container_No
			, case GNL_DDL_Type_Container when 1 then '20RF' when 2 then '20Dry' when 3 then '40RF' when 4 then '40Dry' else '' end GNL_DDL_Type_Container
			, case GNL_DDL_Type_Container_2 when 1 then 'STD' when 2 then 'HC' else '' end GNL_DDL_Type_Container_2
			, case GNL_DDL_DamageStatus when 1 then 'Ready' when 2 then 'Service' when 3 then 'On Duty' when 4 then 'Small Damage' when 5 then 'Medium Damage' when 6 then 'Breakdown' else '' end GNL_DDL_DamageStatus
			, case GNL_DDL_Kepemilikan when 1 then 'Own' when 2 then 'Ownlease' when 3 then 'Rental' else '' end GNL_DDL_Kepemilikan
			from GNL01001006C3 with(nolock) 
			order by GNL_Container_No asc
	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000), @ErrorSeverity INT, @ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState)
	END CATCH
END
GO

/*
	exec CMS_SO_GET_LU_CONTAINER '',''

	select * from GNL01001006C3 where GNL_Container_No = 'APRU 5065649'   

*/


