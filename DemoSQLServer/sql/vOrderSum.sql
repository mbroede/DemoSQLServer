USE Northwind
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE name = 'vOrderSum' AND xtype = 'V')
	DROP VIEW vOrderSum
GO

CREATE VIEW vOrderSum
AS
	SELECT
		o.OrderID,
		o.OrderDate,
		--OrderMonth = CAST(CONVERT(VARCHAR(6), o.OrderDate, 112) + '01' AS DATETIME),
		--OrderYear =  CAST(CONVERT(VARCHAR(4), o.OrderDate, 112) + '0101' AS DATETIME),
		c.CustomerID,
		c.CompanyName,
		Amount =
			(
				SELECT
					SUM(UnitPrice * Quantity)
				FROM [Order Details] od
				WHERE od.OrderID = o.OrderID
			),
		--o.RequiredDate,
		--o.ShippedDate,
		o.ShipVia,
		ShCompanyName = sh.CompanyName,
		--o.Freight,
		--o.ShipName,
		--o.ShipAddress,
		--o.ShipCity,
		--o.ShipRegion,
		--o.ShipPostalCode,
		--o.ShipCountry,
		--c.ContactName,
		--c.ContactTitle,
		--c.Address,
		--c.City,
		--c.Region,
		--c.PostalCode,
		--c.Country,
		--c.Phone,
		--c.Fax,
		CustomerCoordinate = gp.Coordinate
	FROM [Orders] o
	INNER JOIN [Customers] c
		ON c.CustomerID = o.CustomerID
	INNER JOIN GeoPosition gp	
		ON gp.CustomerID = c.CustomerID
	INNER JOIN Shippers sh
		ON sh.ShipperID = o.ShipVia
GO


/*

select * from vOrderSum


*/

