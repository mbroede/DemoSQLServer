USE Northwind
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE name = 'vOlapTime' AND xtype = 'V')
	DROP VIEW vOlapTime
GO

CREATE VIEW vOlapTime
AS
	SELECT
		PK_Date = x.OrderDate,
		Date_Name = CONVERT(VARCHAR(10), x.OrderDate, 104),
		Month_Date = CAST(CONVERT(VARCHAR(6), x.OrderDate, 112) + '01' AS DATETIME),
		Month_Name = LEFT(DATENAME(mm, x.OrderDate), 3) + ' ' + CAST(YEAR(x.OrderDate) AS varchar),
		Year_Date = CAST(CONVERT(VARCHAR(4), x.OrderDate, 112) + '0101' AS DATETIME),
		Year_Name = 'Jahr ' + CAST(YEAR(x.OrderDate) AS varchar)
	FROM Orders x
	--(
	--	SELECT
	--		OrderDate = CAST(CAST(o.minYear AS VARCHAR) + '0101' AS DATETIME) + ROW_NUMBER() OVER (ORDER BY z) - 1,
	--		o.maxYear
	--	FROM
	--	(
	--		SELECT
	--			z = 1
	--		FROM Orders
	--		CROSS JOIN 
	--		(
	--			SELECT x = 1 
	--			UNION SELECT 2
	--			UNION SELECT 3
	--		) x
	--	) x
	--	CROSS JOIN 
	--	(
	--		SELECT
	--			minYear = MIN(YEAR(OrderDate)),
	--			maxYear = MAX(YEAR(OrderDate))
	--		FROM Orders
	--	) o
	--) x
	--WHERE YEAR(x.OrderDate) <= x.maxYear
GO


/*

select * from vOlapTime


*/




