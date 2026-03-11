/* =====================================================
   Business SQL Queries
   Purpose:
   These queries focus on business performance metrics such as sales, AOV, refunds, product popularity, delivery speed,
   and customer purchase behavior.
   ===================================================== */

-- Purpose: Refund Rate by Year
-- Calculate the yearly refund rate as a percentage to evaluate refund trends and overall order quality over time.


SELECT
    EXTRACT(YEAR FROM purchase_ts) AS order_year,
    ROUND(
        AVG(CASE WHEN refund_ts IS NOT NULL THEN 1 ELSE 0 END) * 100,
        2
    ) AS refund_rate_pct
FROM core.order_status
GROUP BY order_year
ORDER BY order_year;



-- Purpose: Macbook Orders, Sales, and AOV by Quarter in North America
-- Show quarterly order counts, sales, and average order value for Macbooks sold in North America across all years.


SELECT
  DATE_TRUNC(o.purchase_ts, QUARTER) AS purchase_quarter,
  COUNT(o.id) AS order_count,
  ROUND(SUM(o.usd_price), 2) AS sales,
  ROUND(AVG(o.usd_price), 2) AS AOV
FROM `core.orders` o
LEFT JOIN `core.customers` c
  ON o.customer_id = c.id
LEFT JOIN `core.geo_lookup` g
  ON g.country_code = c.country_code
WHERE g.region = 'NA'
  AND LOWER(o.product_name) LIKE '%macbook%'
GROUP BY 1
ORDER BY 1 DESC;



-- Purpose: Average Quarterly Orders and Sales for Macbooks in North America
-- Calculate the average number of orders and average sales per quarter for Macbooks sold in North America.


WITH quarterly_metrics AS (
  SELECT
    DATE_TRUNC(o.purchase_ts, QUARTER) AS purchase_quarter,
    COUNT(DISTINCT o.id) AS order_count,
    ROUND(SUM(o.usd_price), 2) AS sales
  FROM `core.orders` o
  LEFT JOIN `core.customers` c
    ON o.customer_id = c.id
  LEFT JOIN `core.geo_lookup` g
    ON g.country_code = c.country_code
  WHERE g.region = 'NA'
    AND LOWER(o.product_name) LIKE '%macbook%'
  GROUP BY 1
  ORDER BY 1 DESC
)

SELECT
  AVG(order_count) AS avg_orders_per_quarter,
  AVG(sales) AS avg_sales_per_quarter
FROM quarterly_metrics;


-- Purpose: Average Time to Deliver by Region
-- For products purchased in 2022 on the website or purchased
-- on mobile in any year, identify which region has the highest average delivery time.


SELECT
  geo_lookup.region,
  AVG(DATE_DIFF(order_status.delivery_ts, order_status.purchase_ts, DAY)) AS time_to_deliver
FROM core.order_status
LEFT JOIN core.orders
  ON order_status.order_id = orders.id
LEFT JOIN core.customers
  ON customers.id = orders.customer_id
LEFT JOIN core.geo_lookup
  ON geo_lookup.country_code = customers.country_code
WHERE (EXTRACT(YEAR FROM orders.purchase_ts) = 2022 AND purchase_platform = 'website')
   OR purchase_platform = 'mobile app'
GROUP BY 1
ORDER BY 2 DESC;



-- Purpose: Average Time to Deliver in Weeks by Region
-- For website purchases made in 2022 or Samsung purchases made in 2021, calculate average delivery time in weeks.


SELECT
  geo_lookup.region,
  AVG(DATE_DIFF(order_status.delivery_ts, order_status.purchase_ts, WEEK)) AS time_to_deliver
FROM core.order_status
LEFT JOIN core.orders
  ON order_status.order_id = orders.id
LEFT JOIN core.customers
  ON customers.id = orders.customer_id
LEFT JOIN core.geo_lookup
  ON geo_lookup.country_code = customers.country_code
WHERE (EXTRACT(YEAR FROM orders.purchase_ts) = 2022 AND purchase_platform = 'website')
   OR (EXTRACT(YEAR FROM orders.purchase_ts) = 2021 AND product_name LIKE 'Samsung%')
GROUP BY 1
ORDER BY 2 DESC;


-- Purpose: Refund Rate and Refund Count by Product
-- Measure refund counts and refund rates for each product overall.

SELECT
  CASE
    WHEN product_name = '27in"" 4k gaming monitor' THEN '27in 4K gaming monitor'
    ELSE product_name
  END AS product_clean,
  SUM(CASE WHEN refund_ts IS NOT NULL THEN 1 ELSE 0 END) AS refunds,
  AVG(CASE WHEN refund_ts IS NOT NULL THEN 1 ELSE 0 END) AS refund_rate
FROM core.orders
LEFT JOIN core.order_status
  ON orders.id = order_status.order_id
GROUP BY 1
ORDER BY 3 DESC;



-- Purpose: Refund Rate and Refund Count by Product per Year
-- Measure yearly refund counts and refund rates for each product.


SELECT
  EXTRACT(YEAR FROM orders.purchase_ts) AS purchase_year,
  CASE
    WHEN product_name = '27in"" 4k gaming monitor' THEN '27in 4K gaming monitor'
    ELSE product_name
  END AS product_clean,
  SUM(CASE WHEN refund_ts IS NOT NULL THEN 1 ELSE 0 END) AS refunds,
  AVG(CASE WHEN refund_ts IS NOT NULL THEN 1 ELSE 0 END) AS refund_rate
FROM core.orders
LEFT JOIN core.order_status
  ON orders.id = order_status.order_id
GROUP BY 1, 2
ORDER BY 3 DESC;



-- Purpose: Most Popular Product Within Each Region
-- Identify the product with the highest order volume in each region.


WITH sales_by_product AS (
  SELECT
    region,
    CASE
      WHEN product_name = '27in"" 4k gaming monitor' THEN '27in 4K gaming monitor'
      ELSE product_name
    END AS product_clean,
    COUNT(DISTINCT orders.id) AS total_orders
  FROM core.orders
  LEFT JOIN core.customers
    ON orders.customer_id = customers.id
  LEFT JOIN core.geo_lookup
    ON geo_lookup.country_code = customers.country_code
  GROUP BY 1, 2
),

ranked_orders AS (
  SELECT
    *,
    ROW_NUMBER() OVER (PARTITION BY region ORDER BY total_orders DESC) AS order_ranking
  FROM sales_by_product
)

SELECT *
FROM ranked_orders
WHERE order_ranking = 1;



-- Purpose: Time to Purchase by Loyalty Program
-- Compare how long it takes loyalty vs. non-loyalty customers to make a purchase after account creation.

SELECT
  customers.loyalty_program,
  ROUND(AVG(DATE_DIFF(orders.purchase_ts, customers.created_on, DAY)), 1) AS days_to_purchase,
  ROUND(AVG(DATE_DIFF(orders.purchase_ts, customers.created_on, MONTH)), 1) AS months_to_purchase
FROM core.customers
LEFT JOIN core.orders
  ON customers.id = orders.customer_id
GROUP BY 1;


-- Purpose: Time to Purchase by Loyalty Program and Purchase Platform
-- Split time-to-purchase by platform and loyalty program, and include row counts to benchmark null severity.


SELECT
  orders.purchase_platform,
  customers.loyalty_program,
  ROUND(AVG(DATE_DIFF(orders.purchase_ts, customers.created_on, DAY)), 1) AS days_to_purchase,
  ROUND(AVG(DATE_DIFF(orders.purchase_ts, customers.created_on, MONTH)), 1) AS months_to_purchase,
  COUNT(*) AS row_count
FROM core.customers
LEFT JOIN core.orders
  ON customers.id = orders.customer_id
GROUP BY 1, 2;


-- Purpose: Overall Sales Trend by Month
-- Summarize monthly order count, sales, and average order value from 2019 through 2022.


SELECT
  DATE_TRUNC(purchase_ts, MONTH) AS purchase_month,
  COUNT(DISTINCT id) AS order_count,
  ROUND(SUM(usd_price), 0) AS sales,
  ROUND(AVG(usd_price), 2) AS AOV
FROM core.orders
WHERE purchase_ts >= '2019-01-01'
  AND purchase_ts < '2023-01-01'
GROUP BY 1
ORDER BY 1 ASC;



-- Purpose: Year-over-Year Growth Rates
-- Calculate yearly changes and YoY growth percentages for orders, sales, and average order value.


WITH yearly_sales AS (
  SELECT
    EXTRACT(YEAR FROM purchase_ts) AS year,
    COUNT(DISTINCT id) AS order_count,
    ROUND(SUM(usd_price), 0) AS sales,
    ROUND(AVG(usd_price), 2) AS aov
  FROM core.orders
  GROUP BY 1
),

last_growth_rates AS (
  SELECT
    year,
    order_count,
    sales,
    aov,
    LAG(order_count) OVER (ORDER BY year) AS prev_order_count,
    LAG(sales) OVER (ORDER BY year) AS prev_sales,
    LAG(aov) OVER (ORDER BY year) AS prev_aov
  FROM yearly_sales
)

SELECT
  year,
  ROUND(order_count - prev_order_count, 0) AS order_count_change,
  ROUND(SAFE_DIVIDE(order_count - prev_order_count, prev_order_count) * 100, 0) AS order_count_yoy_pct,
  ROUND(sales - prev_sales, 0) AS sales_change,
  ROUND(SAFE_DIVIDE(sales - prev_sales, prev_sales) * 100, 0) AS sales_yoy_pct,
  ROUND(aov - prev_aov, 2) AS aov_change,
  ROUND(SAFE_DIVIDE(aov - prev_aov, prev_aov) * 100, 2) AS aov_yoy_pct
FROM last_growth_rates
WHERE prev_sales IS NOT NULL
ORDER BY year;



-- Purpose: Rolling 3-Month Trend Overall
-- Track rolling 3-month sales and orders to smooth short-term volatility and show broader business momentum.

WITH monthly AS (
  SELECT
    DATE_TRUNC(DATE(purchase_ts), MONTH) AS month,
    ROUND(SUM(usd_price), 2) AS sales,
    COUNT(DISTINCT id) AS orders
  FROM core.orders
  WHERE purchase_ts IS NOT NULL
  GROUP BY 1
)

SELECT
  month,
  sales,
  orders,
  ROUND(AVG(sales) OVER (
    ORDER BY month
    ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
  ), 2) AS rolling_3mo_avg_sales,
  ROUND(sales - LAG(sales) OVER (ORDER BY month), 2) AS sales_mom_change,
  ROUND(SUM(sales) OVER (
    ORDER BY month
    ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
  ), 2) AS rolling_3mo_sales,
  SUM(orders) OVER (
    ORDER BY month
    ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
  ) AS rolling_3mo_orders
FROM monthly
ORDER BY month;



-- Purpose: Rolling 3-Month Trend by Product
-- Track rolling 3-month sales and orders for each product to compare momentum across products.

WITH monthly AS (
  SELECT
    DATE_TRUNC(DATE(purchase_ts), MONTH) AS month,
    CASE
      WHEN product_name = '27in"" 4k gaming monitor' THEN '27in 4K gaming monitor'
      ELSE product_name
    END AS product_name,
    ROUND(SUM(usd_price), 2) AS sales,
    COUNT(DISTINCT id) AS orders
  FROM core.orders
  WHERE purchase_ts IS NOT NULL
  GROUP BY 1, 2
)

SELECT
  month,
  product_name,
  sales,
  orders,
  ROUND(AVG(sales) OVER (
    PARTITION BY product_name
    ORDER BY month
    ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
  ), 2) AS rolling_3mo_avg_sales,
  ROUND(sales - LAG(sales) OVER (
    PARTITION BY product_name
    ORDER BY month
  ), 2) AS sales_mom_change,
  ROUND(SUM(sales) OVER (
    PARTITION BY product_name
    ORDER BY month
    ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
  ), 2) AS rolling_3mo_sales,
  SUM(orders) OVER (
    PARTITION BY product_name
    ORDER BY month
    ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
  ) AS rolling_3mo_orders
FROM monthly
ORDER BY product_name, month;



-- Purpose: New vs Returning Customers by Month
-- Label each customer-month as new or returning and count both groups.

WITH customers_per_month_cte AS (
  SELECT DISTINCT
    DATE_TRUNC(DATE(purchase_ts), MONTH) AS month,
    customer_id
  FROM core.orders
  GROUP BY 1, 2
),

first_month_cte AS (
  SELECT
    month,
    customer_id,
    MIN(month) OVER (PARTITION BY customer_id) AS first_month
  FROM customers_per_month_cte
)

SELECT
  month,
  CASE
    WHEN month = first_month THEN 'new'
    ELSE 'returning'
  END AS customer_type,
  COUNT(DISTINCT customer_id) AS customer_count
FROM first_month_cte
GROUP BY 1, 2
ORDER BY 1, 2;



-- Purpose: Monthly New vs Returning Customer Mix
-- Show monthly new and returning customer counts, customer mix percentages,
-- MoM change, and cumulative customer acquisition.


WITH customer_month AS (
  SELECT DISTINCT
    DATE_TRUNC(DATE(purchase_ts), MONTH) AS month,
    customer_id
  FROM core.orders
  WHERE purchase_ts IS NOT NULL
),

labeled AS (
  SELECT
    month,
    customer_id,
    MIN(month) OVER (PARTITION BY customer_id) AS first_month
  FROM customer_month
),

monthly_rollup AS (
  SELECT
    month,
    COUNT(DISTINCT CASE WHEN month = first_month THEN customer_id END) AS new_customers,
    COUNT(DISTINCT CASE WHEN month > first_month THEN customer_id END) AS returning_customers,
    COUNT(DISTINCT customer_id) AS total_customers
  FROM labeled
  GROUP BY 1
)

SELECT
  month,
  new_customers,
  returning_customers,
  total_customers,
  ROUND(100.0 * new_customers / NULLIF(total_customers, 0), 2) AS pct_new,
  ROUND(100.0 * returning_customers / NULLIF(total_customers, 0), 2) AS pct_returning,
  total_customers - LAG(total_customers) OVER (ORDER BY month) AS mom_change_total_customers,
  SUM(new_customers) OVER (ORDER BY month) AS cumulative_customers_to_date
FROM monthly_rollup
ORDER BY month;



-- Purpose: Loyalty vs Non-Loyalty Time to Purchase
-- Compare how long it takes loyalty and non-loyalty customers to make a purchase after account creation.


SELECT
  customers.loyalty_program,
  ROUND(AVG(DATE_DIFF(orders.purchase_ts, customers.created_on, DAY)), 1) AS days_to_purchase,
  ROUND(AVG(DATE_DIFF(orders.purchase_ts, customers.created_on, MONTH)), 1) AS months_to_purchase
FROM core.customers
LEFT JOIN core.orders
  ON customers.id = orders.customer_id
GROUP BY 1;


-- Purpose: Delivery Time by Region and Platform
-- Measure both average delivery time and p90 delivery time to capture typical performance and tail-risk delays.


WITH time_to_deliver AS (
  SELECT DISTINCT
    ROUND(DATE_DIFF(os.delivery_ts, os.purchase_ts, DAY), 2) AS time_to_deliver_days,
    g.region AS region,
    o.purchase_platform AS purchase_platform
  FROM core.order_status os
  LEFT JOIN core.orders o
    ON os.order_id = o.id
  LEFT JOIN core.customers c
    ON c.id = o.customer_id
  LEFT JOIN core.geo_lookup g
    ON g.country_code = c.country_code
  WHERE os.delivery_ts >= os.purchase_ts
  GROUP BY 1, 2, 3
)

SELECT
  region,
  purchase_platform,
  ROUND(AVG(time_to_deliver_days), 2) AS avg_time_to_deliver_days,
  APPROX_QUANTILES(time_to_deliver_days, 100)[OFFSET(90)] AS p90_days
FROM time_to_deliver
GROUP BY 1, 2
ORDER BY 1, 2;


-- Purpose: Refund Rate by Delivery Speed Bucket
-- Test whether slower delivery is associated with higher refund rates.


WITH time_to_deliver AS (
  SELECT
    ROUND(DATE_DIFF(delivery_ts, purchase_ts, DAY), 2) AS days_to_deliver,
    CASE
      WHEN refund_ts IS NOT NULL THEN 1
      ELSE 0
    END AS refund_rate
  FROM core.order_status
)

SELECT
  CASE
    WHEN days_to_deliver BETWEEN 0 AND 2 THEN 'UNDER TWO DAYS FOR DELIVERY'
    WHEN days_to_deliver BETWEEN 3 AND 5 THEN 'UNDER FIVE DAYS FOR DELIVERY'
    WHEN days_to_deliver BETWEEN 6 AND 10 THEN 'UNDER 10 DAYS FOR DELIVERY'
    ELSE 'OVER 11 DAYS FOR DELIVERY'
  END AS delivery_bucket,
  COUNT(*) AS orders,
  SUM(refund_rate) AS refunds,
  ROUND(AVG(refund_rate) * 100, 2) AS avg_refund_rate
FROM time_to_deliver
GROUP BY 1;



-- Purpose: Revenue Concentration Among Top Customers
-- Measure how much total revenue comes from the top 10 customers.


WITH revenue_by_customer AS (
  SELECT
    customer_id,
    SUM(usd_price) AS customer_revenue
  FROM core.orders
  GROUP BY customer_id
),

ranked AS (
  SELECT
    customer_id,
    customer_revenue,
    ROW_NUMBER() OVER (ORDER BY customer_revenue DESC) AS rnk,
    SUM(customer_revenue) OVER () AS total_revenue
  FROM revenue_by_customer
)

SELECT
  ROUND(
    100.0 * SUM(CASE WHEN rnk <= 10 THEN customer_revenue END) / MAX(total_revenue),
    2
  ) AS top_10_customer_revenue_share_pct
FROM ranked;