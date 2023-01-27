USE Northwind
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE name = 'vOlapOrderDetails' AND xtype = 'V')
	DROP VIEW vOlapOrderDetails
GO

CREATE VIEW vOlapOrderDetails
AS
	SELECT
		o.OrderID,
		o.OrderDate,
		od.UnitPrice,
		od.Quantity,
		Amount = CAST(od.UnitPrice * od.Quantity * (1.0 - od.Discount) AS decimal(12,2)),
		cu.CustomerID,
		p.ProductID,
		sh.ShipperID
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

select * from vOlapOrderDetails


*/

