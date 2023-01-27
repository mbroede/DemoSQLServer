USE Northwind
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE name = 'vOlapProducts' AND xtype = 'V')
	DROP VIEW vOlapProducts
GO

CREATE VIEW vOlapProducts
AS
	SELECT
		PK_ProductID = p.ProductID,
		Product_Name = p.ProductName,
		p.SupplierID,
		p.CategoryID
	FROM [Products] p
GO


/*

select * from vOlapProducts


*/

