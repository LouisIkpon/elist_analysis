# Elist Ecommerce Performance Report

## Client Background
Founded in 2018, Elist Electronics is an online retailer that sells popular consumer electronics worldwide via its website and mobile app. The company relies on digital marketing channels (email, SEO, and affiliate partnerships) to drive sales, with especially strong performance from Apple, Samsung, and ThinkPad products.

This report analyzes Elist’s transactional, customer, and operational data from 2019–2022 to evaluate growth, product performance, loyalty program effectiveness, and refund behavior. Using previously underutilized data on sales, marketing, operations, products, and the loyalty program, the analysis generates actionable insights to strengthen Elist’s commercial performance. 


## Northstar Metrics


  * **Sales Trends:** Evaluation of historical sales performance, focusing on revenue, number of orders, average order value (AOV), and refund rates by year and region.  

  * **Product Performance:** Analysis of major product lines to understand their contribution to sales, profitability, and returns, with an emphasis on Apple, Samsung, and ThinkPad products.

  * **Loyalty Program:** Assessment of how the loyalty program influences customer retention, spending behavior, and overall sales, with recommendations to increase engagement.

  * **Regional Comparisons:**  Comparison of revenue, orders, and AOV across regions to identify high-performing markets and areas with growth or optimization opportunities.



An interactive PowerBI dashboard can be downloaded here.



Targeted SQL queries regarding various business questions can be found here.



# Data Structure & ERD (Entity Relationship Diagram)


Elist's database structure as seen below consists of four tables: orders, customers, geo_lookup, and order_status, with a total row count of 108,127 records.


<img width="575" height="1114" alt="image" src="https://github.com/user-attachments/assets/c813813e-7a99-4b66-9717-d0c188c3deec" />



Prior to beginning the analysis, a variety of checks were conducted for quality control and familiarization with the datasets, the data cleaning change log can be found here.

The SQL queries used for data quality checks, cleaning, organizing, and preparing the data for the dashboard can be found here.


# Executive Summary

Across 2019–2022, Elist delivered $28.1M in revenue from 108K orders (avg ~$7.0M and ~27K orders/year, AOV ~$254). Revenue peaked in 2020 and dropped to $4.96M in 2022 (~51% below peak), explained by fewer orders and lower AOV. This decline may reflect post-pandemic demand normalization Tthe following sections will explore additional contributing factors and highlight key opportunity areas for improvement.






# Deep-Dive Insights







## Sales Trends

* 2020 was Elist’s breakout year, with revenue up +163% YoY, driven by both higher demand (orders +101%) and larger baskets (AOV +31%) versus 2019.
  
* In 2021, order volume continued to grow (+6%), but a -15% decline in AOV pulled revenue down ~10%, indicating customers were purchasing but spending less per order.

* The downturn accelerated in 2022 as results weakened across the board—revenue fell ~46% YoY (about -$4.17M vs. 2021), driven by both lower order volume (-40%) and lower AOV (-10%).

* Sales also showed consistent seasonality, with Q4 strength and December as the peak month across 2019–2022 (~$2.86M, ~10% of total sales). By contrast, February was consistently the weakest month (~$1.91M, ~6.8% of sales), suggesting a repeatable seasonal low.

 <img width="598" height="305" alt="image" src="https://github.com/user-attachments/assets/5bf7b66b-79be-4f20-bf8b-20a2d7f08067" />

## Seasonality and Geographic Trends:

* Revenue is geographically concentrated in North America, which generated $14.55M (~52%) of total sales, followed by EMEA ($8.22M, ~29%) and APAC ($3.65M, ~13%), while LATAM contributed the smallest share ($1.67M, ~6%). Because North America represents over half of total revenue, performance changes in NA have an outsized impact on overall results.

* APAC stands out with the highest AOV (~$279), indicating fewer but higher-value purchases and a more premium demand profile relative to other regions. “Unknown” geography is immaterial (<0.1% of sales) and does not materially affect the regional story.

  <img width="493" height="161" alt="image" src="https://github.com/user-attachments/assets/a416caf7-5982-44a9-bf6e-15b9b8142c64" />



## Product Trends
Body Text

## Loyalty Program
Body Text

## Refund Rates
Body Text

## Regional Comparisons
Body Text

# Recommendations
