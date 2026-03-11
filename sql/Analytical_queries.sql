/* =====================================================
   Analytical SQL Queries
   Purpose:
   These queries analyze order trends, customer spending,
   refunds, product filtering, and shipping performance.
   ===================================================== */

-- Purpose: Monthly Order Volume
-- Determine total orders shipped each month===================================================== */

SELECT
    EXTRACT(MONTH FROM ship_ts) AS ship_month,
    COUNT(DISTINCT order_id) AS order_count
FROM core.order_status
GROUP BY ship_month
ORDER BY ship_month DESC;



-- Purpose: Average Order Value by Year
-- Analyze how customer spending (average order value) changes over time by calculating yearly averages.


Select 
  extract(year from purchase_ts) as year,
  round(avg(usd_price),2) as aov,
from core.orders
group by 1
order by 1;



-- Purpose: Refund Flag Creation
-- Create a helper column that identifies whether an order was refunded. 
-- This can be used later for refund rate analysis and customer behavior insights.


SELECT
    *,
    CASE
        WHEN refund_ts IS NOT NULL THEN 1
        ELSE 0
    END AS is_refund
FROM core.order_status
LIMIT 20;



-- Purpose: Apple Product Identification
-- Identify orders containing Apple products and clean inconsistent product naming within the dataset.


SELECT DISTINCT
    product_id,
    CASE
        WHEN product_name = '27in" 4k gaming monitor'
        THEN '27in 4K gaming monitor'
        ELSE product_name
    END AS cleaned_product_name
FROM core.orders
WHERE product_name LIKE '%Apple%'
   OR product_name LIKE '%Macbook%';



-- Purpose: Order Shipping Time Analysis
-- Calculate the number of days between purchase and shipment to evaluate order fulfillment efficiency.


SELECT
    *,
    DATE_DIFF(ship_ts, purchase_ts, DAY) AS time_to_ship_days
FROM core.order_status;



-- Purpose: Monthly Order Volume by Product
-- Calculate total monthly order volume by product while cleaning inconsistent product names.

SELECT
    DATE_TRUNC(purchase_ts, MONTH) AS order_month,
    CASE
        WHEN product_name = '27in" 4k gaming monitor'
        THEN '27in 4K gaming monitor'
        ELSE product_name
    END AS cleaned_product_name,
    COUNT(DISTINCT id) AS order_count
FROM core.orders
group by 1,2
order by 1,2;  
   


-- Purpose: Average Order Value for Laptops and Headphones
-- Analyze yearly average order value for laptop and headphone purchases to understand spending trends within these categories.


SELECT
    EXTRACT(YEAR FROM purchase_ts) AS order_year,
    ROUND(AVG(usd_price), 2) AS avg_order_value_usd
FROM core.orders
WHERE LOWER(product_name) LIKE '%laptop%'
   OR LOWER(product_name) LIKE '%headphones%'
GROUP BY order_year
ORDER BY order_year;