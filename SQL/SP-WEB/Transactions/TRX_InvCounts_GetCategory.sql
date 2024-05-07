create or alter proc TRX_InvCounts_GetCategory
AS          
BEGIN
	BEGIN TRY
		select Category_ID, Category_Name from POS_CategoryItem
		--where Category_ID in(select Category_ID from POS_Item where Site_ID=@Site_ID)
	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000),@ErrorSeverity INT,@ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState)
	END CATCH
END
GO
/*
exec TRX_InvCounts_GetCategory
*/