create or alter proc TRX_TrfItem_GetItemBySite
(
	@SourceSite_ID nvarchar(20),
	@DestSite_ID nvarchar(20)
)
AS          
BEGIN
	BEGIN TRY
		SELECT A.Item_Number, A.Item_Description, A.InStock SourceStock, COALESCE(B.DestinationStock, 0) DestinationStock, A.Site_ID
		FROM POS_Item A
		LEFT JOIN (
			SELECT Item_Number, Item_Description, InStock DestinationStock, Site_ID
			FROM POS_Item
			WHERE Site_ID=@DestSite_ID
		) B ON A.Item_Number=B.Item_Number
		WHERE A.Site_ID=@SourceSite_ID or @SourceSite_ID=''
	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000),@ErrorSeverity INT,@ErrorState INT
		SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState)
	END CATCH
END
GO
/*
exec TRX_TrfItem_GetItemBySite '', ''
*/