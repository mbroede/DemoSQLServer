USE Northwind
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE name = 'vOlapCategories' AND xtype = 'V')
	DROP VIEW vOlapCategories
GO

CREATE VIEW vOlapCategories
AS
	SELECT
		PK_CategoryID = c.CategoryID,
		Categorie_Name = c.CategoryName
	FROM [Categories] c
GO


/*

select * from vOlapCategories


*/

