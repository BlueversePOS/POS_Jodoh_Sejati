CREATE OR ALTER proc [dbo].[CMS_Lookup_Vehicle]
AS
BEGIN
	DECLARE @VEHICLE table(Vehicle varchar(30), Description varchar(100))
	INSERT INTO @VEHICLE(Vehicle, Description)
	VALUES
	('Truck', 'Truck'),
	('Shipping', 'Shipping'),
	('Train', 'Train')

	SELECT * FROM @VEHICLE
END
/*
exec [CMS_Lookup_Vehicle]
*/
GO
