-- Load data from CSV into SQL Server

	-- Check if the table exists

DROP TABLE IF EXISTS housing_sales;

	-- Create table 

CREATE TABLE housing_sales(
datesold DATE,
postcode VARCHAR(50),
price BIGINT,
propertyType VARCHAR(20),
bedrooms INT
)

	-- BULK insert

BULK INSERT housing_sales
FROM 'C:\Users/mibai/SQL/portfolio-projects/housing-sales-analysis/raw_sales.csv'
WITH
(
        FORMAT='CSV',
        FIRSTROW=2
)

GO

-- Which date corresponds to the highest number of sales?

SELECT 
	TOP 1
	datesold,
	count(*) as sales
FROM
	housing_sales
GROUP BY 
	datesold
ORDER BY 
	sales desc;

-- Find out the postcode with the highest average price per sale?

SELECT 
	TOP 1
	postcode, 
	AVG(price) as 'avg_price_per_sale'
FROM 
	housing_sales
GROUP BY 
	postcode
ORDER BY 
	avg_price_per_sale DESC;

-- Which year witnessed the lowest number of sales?

SELECT 
	YEAR(datesold) as year,
	COUNT(*) as 'num_of_sales'
FROM 
	housing_sales
GROUP BY 
	YEAR(datesold)
ORDER BY 
	num_of_sales ASC;

-- Use the window function to deduce the top six postcodes by year's price.

SELECT 
	*
FROM
	(SELECT 
		Year(datesold) as year,
		postcode,
		MAX(price) AS max_price,
		RANK() OVER (PARTITION BY YEAR(datesold) ORDER BY MAX(price) desc) as rank_num
	FROM 
		housing_sales
	GROUP BY 
		YEAR(datesold), postcode) as derived_tbl
WHERE 
	 rank_num between 1 and 6
