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

Elist generated **$28.1M across 108K orders** from 2019–2022, with revenue accelerating sharply in 2020 before reversing course. Monthly revenue **peaked at $1.25M in 2020**, then declined steadily to **$0.26M by late 2022**, indicating structural demand softening. 


The 2022 downturn reflects both volume contraction and pricing pressure, rather than a single operational issue. Stabilizing growth will likely require improving customer retention, diversifying product mix, and protecting AOV.

<img width="957" height="355" alt="image" src="https://github.com/user-attachments/assets/36bfcd6e-7d0e-46ff-8251-9015843a560b" />






# Deep-Dive Insights







## Sales Trends

* 2020 was Elist’s breakout year, with revenue up +163% YoY, driven by both higher demand (orders +101%) and larger baskets (AOV +31%) versus 2019.
  
* In 2021, order volume continued to grow (+6%), but a -15% decline in AOV pulled revenue down ~10%, indicating customers were purchasing but spending less per order.

* The downturn accelerated in 2022 as results weakened across the board—revenue fell ~46% YoY (about -$4.17M vs. 2021), driven by both lower order volume (-40%) and lower AOV (-10%).

 
<p align="center">
  <img src="https://github.com/user-attachments/assets/fc9eacbb-e022-4b5b-aa57-d57676b233c2" width="900" />
</p>

<p align="center">
  <img width="959" height="541" alt="image" src="https://github.com/user-attachments/assets/cf351816-2e97-457a-ab74-072a3e63105f" />
</p>







## Seasonality and Geographic Trends:

* Revenue is geographically concentrated in North America, which generated $14.55M (~52%) of total sales, followed by EMEA ($8.22M, ~29%) and APAC ($3.65M, ~13%), while LATAM contributed the smallest share ($1.67M, ~6%). Because North America represents over half of total revenue, performance changes in NA have an outsized impact on overall results.

* APAC stands out with the highest AOV (~$279), indicating fewer but higher-value purchases and a more premium demand profile relative to other regions. “Unknown” geography is immaterial (<0.1% of sales) and does not materially affect the regional story.



<p align="center">
  <img width="493" height="161" alt="image" src="https://github.com/user-attachments/assets/a416caf7-5982-44a9-bf6e-15b9b8142c64" />
  </p>

<img width="957" height="476" alt="image" src="https://github.com/user-attachments/assets/67443557-b778-4d66-91c8-d8269a56963f" />
  


* Sales also showed consistent seasonality, with Q4 strength and December as the peak month across 2019–2022 ($2.86M, 10% of total sales). By contrast, February was consistently the weakest month ($1.91M, ~6.8% of sales), suggesting a repeatable seasonal low.


<p align="center">
  <img src="https://github.com/user-attachments/assets/09f58bb0-7908-4ad3-91f8-e7efe1b3b93b"
       style="width:360px; height:220px; object-fit:cover;" />
  <img src="https://github.com/user-attachments/assets/5bf7b66b-79be-4f20-bf8b-20a2d7f08067"
       style="width:360px; height:220px; object-fit:cover;" />
</p>

## Product Trends
* Across 2019–2022, Elist’s sales were highly concentrated in a few SKUs: the 27in 4K gaming monitor generated $9.85M (35%), Apple Airpods Headphones produced $7.74M (28%), and Macbook Air Laptop added $6.30M (22%) together driving ~85% of total revenue. Order volume skews differently: Airpods led with 48,402 orders, while the 27in monitor delivered fewer orders (23,408) but much higher monetization (AOV ~$421). 

* Premium laptops show very high AOVs (Macbook Air $1,588, ThinkPad $1,100) but much lower order counts (~3,964 and 2,916 respectively), meaning revenue comes from ticket size more than frequency. Lower-priced accessories (e.g., Samsung charging cable pack) generate meaningful order volume but limited revenue due to low AOV ($20), so they’re better treated as attach-rate/retention plays than core revenue drivers.

  <img width="718" height="301" alt="image" src="https://github.com/user-attachments/assets/ad843d7b-8abf-41b4-8062-201b1ad0ae92" />

<img width="960" height="322" alt="image" src="https://github.com/user-attachments/assets/bbe0bb8f-67e5-4b56-95a9-6170b67278f2" />

<img width="1267" height="716" alt="image" src="https://github.com/user-attachments/assets/72e23ccb-624a-4780-951c-8e23de704bed" />



## Loyalty Program
* Across 2019–2022, loyalty customers consistently produced the majority of volume and revenue, with totals showing ~62,430 loyalty orders vs. ~45,693 non-loyalty orders and ~$17.14M loyalty sales vs. ~$10.97M non-loyalty sales. Non-loyalty customers tended to have higher AOV overall (~$275) compared to loyalty (~$240), meaning loyalty drives scale (repeat volume) while non-loyalty drives slightly larger baskets per order.
  
* The gap was most pronounced in 2020, when loyalty sales jumped to ~$7.19M while non-loyalty reached ~$2.97M, aligning with the breakout year’s demand surge. By 2022, both segments declined, but loyalty still remained the larger driver of total orders, so any retention/engagement improvements inside loyalty have an outsized impact on topline stability.


<img width="1162" height="474" alt="image" src="https://github.com/user-attachments/assets/d70bdd9f-a754-4e7a-b9fb-8e92d34923a1" />




## Refund Rates
* Refund performance varies a lot by product, so we track refund rate (%) and refund count (#) together to separate “quality risk” from “volume risk.” The highest refund rates come from higher-ticket laptops—ThinkPad Laptop ~11.7% (342 refunds) and MacBook Air Laptop ~11.4% (453 refunds)—which signals elevated return friction in premium categories. 

* By contrast, Apple AirPods Headphones generate the largest refund volume (2,636 refunds) but at a lower refund rate (~5.45%), meaning small process improvements here can still move total refunds materially because the product sells at scale. At the overall level, refunds spiked in 2020 (~9.21%), improved in 2021 (~3.61%), and show 0.0% in 2022 in the order_status-based metric—this should be treated as a data coverage / tracking check rather than a true “no refunds” conclusion.


  <img width="1285" height="412" alt="image" src="https://github.com/user-attachments/assets/1669e0bc-5e50-47d8-8ec8-483009285a2e" />

  <img width="1292" height="329" alt="image" src="https://github.com/user-attachments/assets/bec60fd0-a6ee-4a35-af67-45cf9c66883c" />



## Regional Comparisons
* Regional results show consistent product demand patterns and broadly similar operational performance across markets. Apple AirPods Headphones are the #1 product in every region, with order volume led by NA (24,731), followed by EMEA (15,090), APAC (5,662), and LATAM (2,636)—so performance in this single product has a global impact.

* On delivery performance (using the segment of 2022 website purchases + all mobile app purchases), average time-to-deliver is tightly clustered around ~7.5 days, with EMEA highest at ~7.53 days (APAC ~7.51, NA ~7.52, LATAM ~7.52), suggesting regional differences in average delivery speed are minimal in that slice. 

# Recommendations
