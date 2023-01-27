USE Northwind
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE name = 'vOrderDetails' AND xtype = 'V')
	DROP VIEW vOrderDetails
GO

CREATE VIEW vOrderDetails
AS
	SELECT
		o.OrderID,
		OrderYear = YEAR(o.OrderDate),
		OrderMonth = FORMAT(o.OrderDate, 'MM') + '/' + CAST(YEAR(o.OrderDate) AS varchar),
		OrderDate = o.OrderDate,
		od.UnitPrice,
		od.Quantity,
		od.Discount,
		Amount = CAST(od.UnitPrice * od.Quantity * (1.0 - od.Discount) AS decimal(12,2)),
		cu.CustomerID,
		CustomerCompany = cu.CompanyName,
		cu.Country,
		cu.PostalCode,
		cu.City,
		cu.[Address],
		p.ProductID,
		p.ProductName,
		cat.CategoryID,
		cat.CategoryName,
		sh.ShipperID,
		ShipperCompany = sh.CompanyName,
		--
		OrderYearBGColor =
			CASE YEAR(o.OrderDate)
				WHEN 2016 THEN 'NavajoWhite'
				WHEN 2017 THEN 'Pink'
				WHEN 2018 THEN 'Lavender'
				ELSE 'White'
			END
	FROM [Order Details] od
	INNER JOIN Orders o
		ON o.OrderID = od.OrderID
	INNER JOIN Customers cu
		ON cu.CustomerID = o.CustomerID
	INNER JOIN Products p
		ON p.ProductID = od.ProductID
	INNER JOIN Categories cat
		ON cat.CategoryID = p.CategoryID
	INNER JOIN Shippers sh
		ON sh.ShipperID = o.ShipVia
GO


/*

select * from vOrderDetails


*/

