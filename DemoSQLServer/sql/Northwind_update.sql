USE Northwind
GO

/*
update orders set
	OrderDate = dateadd(yy, 20, OrderDate),
	RequiredDate = dateadd(yy, 20, RequiredDate),
	ShippedDate = dateadd(yy, 20, ShippedDate)

*/



-- DROP TABLE GeoPosition
-- TRUNCATE TABLE GeoPosition

CREATE TABLE GeoPosition
(
	GeoPosition_ID INT IDENTITY(1,1) PRIMARY KEY,
	Latitude float NOT NULL, 
    Longitude float NOT NULL, 
	Coordinate AS ([geography]::STGeomFromText(((('POINT('+CONVERT([varchar](20),[Longitude]))+' ')+CONVERT([varchar](20),[Latitude]))+')',(4326))),
	CustomerID nchar(5) NULL
)

ALTER TABLE GeoPosition WITH CHECK ADD
	CONSTRAINT FK_GeoPosition_CustomerID FOREIGN KEY(CustomerID) 
		REFERENCES Customers (CustomerID)
		--ON UPDATE CASCADE ON DELETE CASCADE
GO

--SELECT * FROM GeoPosition
--SELECT * FROM Customers


--TRUNCATE TABLE GeoPosition
INSERT INTO GeoPosition
(
	CustomerID,
	Latitude, 
    Longitude
)
SELECT
	CustomerID,
	Latitude = 49.0 + 7.0 * 0.0000000001 * ABS(CHECKSUM(NEWID())),
	Longitude = 9.0 + 7.0 * 0.0000000001 * ABS(CHECKSUM(NEWID()))
FROM Customers
GO




