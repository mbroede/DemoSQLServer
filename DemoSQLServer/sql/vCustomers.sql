USE Northwind
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE name = 'vCustomers' AND xtype = 'V')
	DROP VIEW vCustomers
GO

CREATE VIEW vCustomers
AS
	SELECT
		c.CustomerID,
		c.CompanyName,
		c.ContactName,
		c.ContactTitle,
		c.Address,
		c.City,
		c.Region,
		c.PostalCode,
		c.Country,
		c.Phone,
		c.Fax,
		gp.Coordinate
	FROM [Customers] c
	INNER JOIN GeoPosition gp	
		ON gp.CustomerID = c.CustomerID
GO


/*

select * from vCustomers


*/

