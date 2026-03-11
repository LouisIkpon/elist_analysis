/* =====================================================
   Exploratory SQL Queries
   Dataset: Elist Ecommerce Dataset
   Purpose: Initial exploration of customer behavior,
            transactions, and geographic data
   ===================================================== */

-- Purpose:
-- Identifying the earliest and latest purchase timestamps helps
-- determine the time period covered by the dataset.

-- select min purchase_ts and max purchase_ts from orders table 

select 
  min(purchase_ts) as earliest_date,
  MAX(purchase_ts) as latest_date
from core.orders; 


-- Purpose:
-- This helps understand customer spending behavior during a specific year.

-- SELECT average usd_price from orders table and filter to where currency = usd and filterto where purchase_ts is in the year 2019

select 
  avg(usd_price) as USD_AOV
from core.orders
where currency = 'USD'
AND extract(YEAR from purchase_ts) = 2019;


-- Purpose:
-- Helps understand which platforms customers prefer when creating accounts.

-- select id, loyalty program status, and account creation date from customer table and filter to where the aacount creation method is moblie or desktop 

SELECT
    id AS customer_id,
    loyalty_program AS is_loyalty_member,
    created_on AS account_creation_date
FROM core.customers
WHERE account_creation_method IN ('desktop', 'mobile');



-- Purpose:
-- Identifies the product catalog available to customers paying in AUD.

-- select disticit products name from orders table and filter to where currecy is AUD,account_creation_method is website and order by ASC  

SELECT DISTINCT
    product_name
FROM core.orders
WHERE currency = 'AUD'
AND purchase_platform = 'website'
ORDER BY product_name ASC;



-- Purpose:
-- Helps understand geographic segmentation for regional analysis.


-- select country code from geo lookup table and filter to where region is NA and order the counry in DESC order and limit to only 10 result to find the first 10

SELECT
    country_code
FROM core.geo_lookup
WHERE region = 'NA'
ORDER BY country_code DESC
LIMIT 10;


-- Purpose: Seasonality by Calendar Month
-- Summarize total sales by calendar month across all years.

SELECT
  EXTRACT(MONTH FROM purchase_ts) AS month_num,
  FORMAT_DATE(
    '%b',
    DATE(EXTRACT(YEAR FROM CURRENT_DATE()), EXTRACT(MONTH FROM purchase_ts), 1)
  ) AS month_name,
  ROUND(SUM(usd_price), 2) AS total_sales
FROM core.orders
GROUP BY 1, 2
ORDER BY 1;



-- Purpose: Top 3 Customers by Purchase Platform
-- Rank the top three customers within each purchase platform by number of purchases.


WITH customer_product_count AS (
  SELECT
    purchase_platform,
    customer_id,
    COUNT(DISTINCT id) AS num_of_purchases
  FROM core.orders
  GROUP BY 1, 2
),

ranking_customers AS (
  SELECT
    *,
    ROW_NUMBER() OVER (
      PARTITION BY purchase_platform
      ORDER BY num_of_purchases DESC
    ) AS order_ranking
  FROM customer_product_count
)

SELECT *
FROM ranking_customers
WHERE order_ranking <= 3;



-- Purpose: Top 3 Customers by Platform Using QUALIFY
-- Return the top three customers per purchase platform using a more concise window function approach.


SELECT
  purchase_platform,
  customer_id,
  COUNT(DISTINCT id) AS num_purchases
FROM core.orders
GROUP BY 1, 2
QUALIFY ROW_NUMBER() OVER (
  PARTITION BY purchase_platform
  ORDER BY COUNT(DISTINCT id) DESC
) <= 3;



-- Purpose: Customer Third Order in Purchase History
-- Return orders that occurred on the customer's third purchase day, including all orders placed on that same day.

WITH ranking_cte AS (
  SELECT
    *,
    DENSE_RANK() OVER (
      PARTITION BY customer_id
      ORDER BY purchase_ts ASC
    ) AS order_ranking
  FROM core.orders
)

SELECT *
FROM ranking_cte
WHERE order_ranking = 3;



-- Purpose: Apple Orders by Country in 2022
-- Return Apple order counts by country in 2022 and treat null countries as United States.


SELECT
  g.country_code AS orginal_country,
  COALESCE(g.country_code, 'US') AS updated_country,
  COUNT(DISTINCT o.id) AS order_count
FROM `core.orders` o
LEFT JOIN `core.customers` c
  ON o.customer_id = c.id
LEFT JOIN `core.geo_lookup` g
  ON c.country_code = g.country_code
WHERE LOWER(o.product_name) LIKE '%apple%'
  AND EXTRACT(YEAR FROM o.purchase_ts) = 2022
GROUP BY 1, 2
ORDER BY 3 DESC;