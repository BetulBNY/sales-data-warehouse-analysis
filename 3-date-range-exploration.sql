/*
===============================================================================
Date Range Exploration 
===============================================================================
Purpose:
    - To determine the temporal boundaries of key data points.
    - To understand the range of historical data.

SQL Functions Used:
    - MIN(), MAX(), DATEDIFF()/DATE_PART, AGE()
===============================================================================
*/

SELECT * FROM gold.fact_sales;

-- Determine the first and last order date and the total duration in months
-- DATEDIFF is not a function in PostgreSQL so, I used AGE and DATE_PART methods.
SELECT AGE(MAX(order_date), MIN(order_date)) FROM gold.fact_sales; -- When we check result we see there is no months.
-----------
SELECT 
    MIN(order_date) AS first_order_date,
    MAX(order_date) AS last_order_date,
    (
        DATE_PART('year', AGE(MAX(order_date), MIN(order_date))) * 12 +
        DATE_PART('month', AGE(MAX(order_date), MIN(order_date))) 
    ) AS order_range_months
FROM gold.fact_sales;	
/*
NOTES:
AGE()
AGE(date1, date2)
İki tarih arasındaki farkı verir (year, month, day olarak)
---------------
DATE_PART()
DATE_PART('year', ...)
DATE_PART('month', ...)
O farkın içinden yıl ve ayı alıyoruz
*/

-- Find the youngest and oldest customer based on birthdate
SELECT 
	MIN(birthdate) AS youngest,
	MAX(birthdate) AS oldest
FROM gold.dim_customers;

-- Instead of year for writing age:
SELECT 
DATE_PART('year', AGE(CURRENT_DATE, MIN(birthdate))) AS oldest,
DATE_PART('year', AGE(CURRENT_DATE, MAX(birthdate))) AS youngest
FROM gold.dim_customers;