# Elist Ecommerce Performance Report

## Project Overview
**Goal:** Evaluate Elist’s historical performance and identify drivers of growth/decline across **Sales, Product Mix, Loyalty, and Region**.  
**Dataset:** Orders + Customers + Order Status + Geo Lookup (2019–2022).  
**Deliverables:** Executive summary, KPI deep dives, and reproducible SQL queries + visuals.

## Table of Contents

- [Project Overview](#project-overview)
- [Client Background](#client-background)
- [North Star Metrics](#north-star-metrics)
- [Data Structure & ERD](#data-structure--erd-entity-relationship-diagram)
- [Executive Summary](#executive-summary)
- [Deep-Dive Insights](#deep-dive-insights)
  - [Sales Trends](#sales-trends)
  - [Seasonality and Geographic Trends](#seasonality-and-geographic-trends)
  - [Product Trends](#product-trends)
- [Recommendations](#recommendations)

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


<p align="center">
  <img src="PATH_OR_URL_TO_IMAGE" alt="Monthly sales table" width="700">
</p>




Prior to beginning the analysis, a variety of checks were conducted for quality control and familiarization with the datasets, the data cleaning change log can be found here.

The SQL queries used for data quality checks, cleaning, organizing, and preparing the data for the dashboard can be found here.


# Executive Summary

Across 2019–2022, Elist delivered $28.1M in revenue from 108K orders (avg ~$7.0M and ~27K orders/year, AOV ~$254). Revenue peaked in 2020 and dropped to $4.96M in 2022 (~51% below peak), explained by fewer orders and lower AOV. This decline may reflect post-pandemic demand normalization Tthe following sections will explore additional contributing factors and highlight key opportunity areas for improvement.

<img width="1115" height="627" alt="image" src="https://github.com/user-attachments/assets/a2934044-f302-41e7-9604-f5c6bb043a9d" />





# Deep-Dive Insights







## Sales Trends

* 2020 was Elist’s breakout year, with revenue up +163% YoY, driven by both higher demand (orders +101%) and larger baskets (AOV +31%) versus 2019.
  
* In 2021, order volume continued to grow (+6%), but a -15% decline in AOV pulled revenue down ~10%, indicating customers were purchasing but spending less per order.

* The downturn accelerated in 2022 as results weakened across the board—revenue fell ~46% YoY (about -$4.17M vs. 2021), driven by both lower order volume (-40%) and lower AOV (-10%).

 
<p align="center">
  <img src="https://github.com/user-attachments/assets/fc9eacbb-e022-4b5b-aa57-d57676b233c2" width="900"><br><br>
  <img src="https://github.com/user-attachments/assets/a18038ba-be3c-4e1a-9cba-88ca81509ece" width="300">
  <img src="https://github.com/user-attachments/assets/753acd9f-af88-452c-af8e-b7c79b79306c" width="300">
  <img src="https://github.com/user-attachments/assets/fc41d429-fdea-4178-b178-176ac0cb566c" width="300">
</p>









## Seasonality and Geographic Trends:

* Revenue is geographically concentrated in North America, which generated $14.55M (~52%) of total sales, followed by EMEA ($8.22M, ~29%) and APAC ($3.65M, ~13%), while LATAM contributed the smallest share ($1.67M, ~6%). Because North America represents over half of total revenue, performance changes in NA have an outsized impact on overall results.

* APAC stands out with the highest AOV (~$279), indicating fewer but higher-value purchases and a more premium demand profile relative to other regions. “Unknown” geography is immaterial (<0.1% of sales) and does not materially affect the regional story.

* Sales also showed consistent seasonality, with Q4 strength and December as the peak month across 2019–2022 ($2.86M, 10% of total sales). By contrast, February was consistently the weakest month ($1.91M, ~6.8% of sales), suggesting a repeatable seasonal low.


<p align="center">
  <img width="493" height="161" alt="image" src="https://github.com/user-attachments/assets/a416caf7-5982-44a9-bf6e-15b9b8142c64" />
  </p>

<p align="center">
   <img width="598" height="305" alt="image" src="https://github.com/user-attachments/assets/5bf7b66b-79be-4f20-bf8b-20a2d7f08067" />
   </p>


## Product Trends
* Across 2019–2022, Elist’s sales were highly concentrated in a few SKUs: the 27in 4K gaming monitor generated $9.85M (35%), Apple Airpods Headphones produced $7.74M (28%), and Macbook Air Laptop added $6.30M (22%) together driving ~85% of total revenue. Order volume skews differently: Airpods led with 48,402 orders, while the 27in monitor delivered fewer orders (23,408) but much higher monetization (AOV ~$421). 

* Premium laptops show very high AOVs (Macbook Air $1,588, ThinkPad $1,100) but much lower order counts (~3,964 and 2,916 respectively), meaning revenue comes from ticket size more than frequency. Lower-priced accessories (e.g., Samsung charging cable pack) generate meaningful order volume but limited revenue due to low AOV ($20), so they’re better treated as attach-rate/retention plays than core revenue drivers.

  <img width="718" height="301" alt="image" src="https://github.com/user-attachments/assets/ad843d7b-8abf-41b4-8062-201b1ad0ae92" />


## Loyalty Program
* Across 2019–2022, loyalty customers consistently produced the majority of volume and revenue, with totals showing ~62,430 loyalty orders vs. ~45,693 non-loyalty orders and ~$17.14M loyalty sales vs. ~$10.97M non-loyalty sales. Non-loyalty customers tended to have higher AOV overall (~$275) compared to loyalty (~$240), meaning loyalty drives scale (repeat volume) while non-loyalty drives slightly larger baskets per order.
  
* The gap was most pronounced in 2020, when loyalty sales jumped to ~$7.19M while non-loyalty reached ~$2.97M, aligning with the breakout year’s demand surge. By 2022, both segments declined, but loyalty still remained the larger driver of total orders, so any retention/engagement improvements inside loyalty have an outsized impact on topline stability.

## Refund Rates
* Refund performance varies a lot by product, so we track refund rate (%) and refund count (#) together to separate “quality risk” from “volume risk.” The highest refund rates come from higher-ticket laptops—ThinkPad Laptop ~11.7% (342 refunds) and MacBook Air Laptop ~11.4% (453 refunds)—which signals elevated return friction in premium categories. 

* By contrast, Apple AirPods Headphones generate the largest refund volume (2,636 refunds) but at a lower refund rate (~5.45%), meaning small process improvements here can still move total refunds materially because the product sells at scale. At the overall level, refunds spiked in 2020 (~9.21%), improved in 2021 (~3.61%), and show 0.0% in 2022 in the order_status-based metric—this should be treated as a data coverage / tracking check rather than a true “no refunds” conclusion.

## Regional Comparisons
* Regional results show consistent product demand patterns and broadly similar operational performance across markets. Apple AirPods Headphones are the #1 product in every region, with order volume led by NA (24,731), followed by EMEA (15,090), APAC (5,662), and LATAM (2,636)—so performance in this single product has a global impact.

* On delivery performance (using the segment of 2022 website purchases + all mobile app purchases), average time-to-deliver is tightly clustered around ~7.5 days, with EMEA highest at ~7.53 days (APAC ~7.51, NA ~7.52, LATAM ~7.52), suggesting regional differences in average delivery speed are minimal in that slice. 

# Recommendations
