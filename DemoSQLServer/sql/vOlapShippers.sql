USE Northwind
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE name = 'vOlapShippers' AND xtype = 'V')
	DROP VIEW vOlapShippers
GO

CREATE VIEW vOlapShippers
AS
	SELECT
		PK_ShipperID = s.ShipperID,
		Shipper_Name = s.CompanyName
	FROM [Shippers] s
GO


/*

select * from vOlapShippers


*/

