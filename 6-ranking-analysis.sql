/*
===============================================================================
Ranking Analysis
===============================================================================
Purpose:
    - To rank items (e.g., products, customers) based on performance or other metrics.
    - To identify top performers or laggards.
	- Rank[Dimension] By Total[Measure]
	- Rank Countries By Total Sales
	- Top 5 Products By Quantity
	- Bottom 3 Customers By Total Orders

SQL Functions Used:
    - Window Ranking Functions: RANK(), DENSE_RANK(), ROW_NUMBER(), TOP/LIMIT
    - Clauses: GROUP BY, ORDER BY
===============================================================================
*/

-- Which 5 products Generating the Highest Revenue?
-- Simple Ranking
SELECT
    p.product_name,
    SUM(f.sales_amount) AS total_revenue
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p
    ON p.product_key = f.product_key
GROUP BY p.product_name
ORDER BY total_revenue DESC
LIMIT 5;

-- Complex but Flexibly Ranking Using Window Functions
SELECT *
FROM (
    SELECT
        p.product_name,
        SUM(f.sales_amount) AS total_revenue,
        RANK() OVER (ORDER BY SUM(f.sales_amount) DESC) AS rank_products
    FROM gold.fact_sales f
    LEFT JOIN gold.dim_products p
        ON p.product_key = f.product_key
    GROUP BY p.product_name
) AS ranked_products
WHERE rank_products <= 5;

-- What are the 5 worst-performing products in terms of sales?
SELECT
    p.product_name,
    SUM(f.sales_amount) AS total_revenue
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p
    ON p.product_key = f.product_key
GROUP BY p.product_name
ORDER BY total_revenue
LIMIT 5;

-- Find the top 10 customers who have generated the highest revenue
SELECT 
	cu.customer_key,
	cu.first_name, 
	cu.last_name, 
	SUM(sa.sales_amount) as sales_revenue
FROM gold.fact_sales sa
LEFT JOIN gold.dim_customers cu
	ON cu.customer_key = sa.customer_key
GROUP BY cu.customer_key, cu.first_name, cu.last_name 
ORDER BY sales_revenue DESC
LIMIT 10;

-- The 3 customers with the fewest orders placed
SELECT 
	cu.customer_key,
	cu.first_name, 
	cu.last_name, 
	COUNT(DISTINCT sa.order_number) as orders_number
FROM gold.fact_sales sa
LEFT JOIN gold.dim_customers cu
	ON cu.customer_key = sa.customer_key
GROUP BY cu.customer_key, cu.first_name, cu.last_name 
ORDER BY orders_number 
LIMIT 3;

