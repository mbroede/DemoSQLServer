USE Northwind
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE name = 'vOlapSuppliers' AND xtype = 'V')
	DROP VIEW vOlapSuppliers
GO

CREATE VIEW vOlapSuppliers
AS
	SELECT
		PK_SupplierID = s.SupplierID,
		Supplier_Name = s.CompanyName
	FROM [Suppliers] s
GO


/*

select * from vOlapSuppliers



*/

