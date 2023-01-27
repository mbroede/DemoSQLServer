USE Northwind
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE name = 'vOlapCustomers' AND xtype = 'V')
	DROP VIEW vOlapCustomers
GO

CREATE VIEW vOlapCustomers
AS
	SELECT
		PK_CustomerID = c.CustomerID,
		Customer_Name = c.CompanyName
	FROM [Customers] c
GO


/*

select * from vOlapCustomers


*/

