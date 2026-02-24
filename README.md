# Elist Ecommerce Performance Report

## Project Overview
**Goal:** Evaluate Elist Electronics’ historical performance and identify drivers of revenue growth and decline across sales trends, product mix, customer behavior, and geography.

**Dataset:** Orders, customers, products, and operational data (2019–2022).                                                                                                                                                                    

**Deliverables:** Executive summary, diagnostic deep dives, Power BI dashboard, and reproducible SQL queries.

## Table of Contents

- [Project Overview](#project-overview)
- [Client Background](#client-background)
- [Performance Measurement Framework](#performance-measurement-framework)
- [Executive Summary](#executive-summary)
- [Deep-Dive Insights](#deep-dive-insights)
  - [Sales Trends](#sales-trends)
  - [Seasonality & Geographic Trends](#seasonality--geographic-trends)
  - [Product Performance](#product-performance)
  - [Loyalty & Retention](#loyalty--retention)
- [Recommendations](#recommendations)
- [Data Structure & ERD (Entity Relationship Diagram)](#data-structure--erd-entity-relationship-diagram)
- [SQL & Data Preparation](#sql--data-preparation)[Recommendations](#recommendations)

## Client Background
Founded in 2018, Elist Electronics is an online retailer selling consumer electronics globally via its website and mobile app. The business relies heavily on digital acquisition channels (email, SEO, affiliate partnerships) and derives a significant portion of revenue from major brands such as Apple, Samsung, and ThinkPad.

Following rapid growth during the pandemic period, Elist experienced a multi-year revenue decline. This report evaluates whether that decline reflects temporary normalization or structural performance challenges, and identifies actionable levers for stabilization and growth.


## Performance Measurement Framework

To diagnose Elist’s revenue performance, the analysis is structured around four performance pillars designed to isolate structural drivers of growth and decline:

- **Sales Trends**  
  Revenue trajectory driven by changes in order volume, pricing (AOV), and refund behavior.

- **Product Performance**  
  Contribution of major product lines, revenue concentration, and exposure to brand or category dependency risk.

- **Loyalty & Retention**  
  Impact of repeat purchasing and the loyalty program on customer spending behavior and revenue stability.

- **Regional Performance**  
  Market-level comparison of revenue, orders, and AOV to identify geographic strength and optimization opportunities.



# Executive Summary

Elist generated **$28.1M across 108K orders** from 2019–2022, with revenue accelerating sharply in 2020 before reversing course. Monthly revenue peaked at **$1.25M in 2020**, then declined steadily to $0.26M by late 2022, indicating structural demand softening. 


The 2022 downturn reflects both volume contraction and pricing pressure, rather than a single operational issue. Stabilizing growth will likely require improving customer retention, diversifying product mix, and protecting AOV.

<img width="957" height="355" alt="image" src="https://github.com/user-attachments/assets/36bfcd6e-7d0e-46ff-8251-9015843a560b" />






# Deep-Dive Insights







### Sales Trends

- **Revenue surged in 2020**, increasing +163% year-over-year. This growth was driven by both a sharp rise in order volume (+101%) and customers spending more per order (AOV +31%).

- **In 2021, revenue growth began to slow**, even though orders continued to increase slightly (+6%). A decline in average order value (~15%) suggests customers were spending less per transaction.

- **The decline accelerated in 2022**, with revenue falling 46% year-over-year (≈$4.2M vs. 2021). Both fewer orders (40%) and continued reductions in spend per order (10%) contributed to the downturn.

- Together, these trends suggest that the post-pandemic revenue decline was driven by both reduced demand and lower customer spending per order, rather than a single operational issue.

<p>
  <img src="https://github.com/user-attachments/assets/f3d51f26-81e0-4fa5-801e-99fda571256a" width="850" />
</p>

<!-- Bottom row (two images side by side) -->
<p>
  <img src="https://github.com/user-attachments/assets/09153391-283b-4e19-8af4-b29d1b238603" width="420" />
  <img src="https://github.com/user-attachments/assets/c475c7be-429a-494f-b9bc-8ffcccc25d06" width="420" />
</p>




### Geographic and Seasonality Trends


**Geographic Concentration**
- Revenue is heavily concentrated in **North America**, which generated approximately **$14.5M (~52%)** of total sales, giving NA an outsized influence on overall performance.
- **EMEA** contributed roughly **$8.2M (~29%)**, while **APAC (~13%)** and **LATAM (~6%)** represent smaller but more diversified revenue streams.
- **APAC** stands out with the highest average order value (~$279), reflecting a premium purchasing pattern despite lower overall order volume.

<!-- Geographic concentration (hero visual) -->
<p>
  <img src="https://github.com/user-attachments/assets/7a83ade4-d4e7-4ffa-ae83-8884ed1be3e7" width="850" />
</p>

*North America drives the majority of revenue, while APAC shows higher-value purchases per order.*


**Seasonality**
- Sales display clear seasonality, with demand peaking in **Q4**, particularly in **December (~10.15% of annual sales)**, reflecting holiday-driven purchasing behavior.
- **Q1 is consistently softer**, with **February (~6.78%)** representing the weakest month on average, suggesting an early-year normalization following the holiday period.

<!-- Seasonality (supporting visual) -->
<p>
  <img src="https://github.com/user-attachments/assets/a489b786-3d5f-442c-904b-c0961c133f77" width="850" />
</p>

*Revenue consistently peaks in Q4 and softens in early Q1, reinforcing predictable holiday-driven seasonality.*


## Product Trends

From 2019–2022, revenue was highly concentrated in a small set of core products: the 27in 4K gaming monitor (~$9.9M, ~35%), Apple AirPods Headphones (~$7.7M, ~28%), and MacBook Air Laptop (~$6.3M, ~22%) together generated roughly 85% of total sales, meaning overall performance is largely driven by trends within a limited SKU set.

These products generate revenue in different ways: AirPods lead in order volume (~48K orders), driving revenue through purchase frequency, while the 27in monitor delivers fewer orders (~23K) but stronger monetization per transaction (AOV ~$421), balancing both volume and value.

Premium laptops (MacBook Air and ThinkPad) contribute revenue primarily through higher ticket size (AOVs ~$1,588 and ~$1,100) rather than frequency, reflecting lower order counts but higher per-order spend.

Lower-priced accessories generate meaningful order volume but limited revenue impact due to very low AOVs (e.g., ~$20 cable packs), positioning them as attach-rate or retention drivers rather than core revenue contributors.

Together, these patterns suggest that Elist’s product portfolio relies on a small group of high-impact SKUs, with revenue driven by different mechanisms—frequency for mass-market items and ticket size for premium products—highlighting the need for differentiated growth strategies across product tiers.


<p>
  <img src="https://github.com/user-attachments/assets/93671832-801b-434e-8a9b-a7ca041be470" width="900" />
</p>

*The majority of revenue is driven by a small number of flagship products, with the top three SKUs accounting for nearly 85% of total sales.*


<p>
  <img src="https://github.com/user-attachments/assets/92774757-e5b4-4915-bc7c-e1ee1575ff5e" width="900" />
</p>

*Mass-market products drive revenue through frequency, while premium laptops rely on higher ticket size, highlighting distinct product-level growth dynamics.*




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


# appendix

<p align="center">
  <img src="https://github.com/user-attachments/assets/fc9eacbb-e022-4b5b-aa57-d57676b233c2" width="900" />
</p




<p align="center">
  <img width="493" height="161" alt="image" src="https://github.com/user-attachments/assets/a416caf7-5982-44a9-bf6e-15b9b8142c64" />
  </p>

<img width="957" height="476" alt="image" src="https://github.com/user-attachments/assets/67443557-b778-4d66-91c8-d8269a56963f" />


<p align="center">
  <img src="https://github.com/user-attachments/assets/09f58bb0-7908-4ad3-91f8-e7efe1b3b93b"
       style="width:360px; height:220px; object-fit:cover;" />
  <img src="https://github.com/user-attachments/assets/5bf7b66b-79be-4f20-bf8b-20a2d7f08067"
       style="width:360px; height:220px; object-fit:cover;" />
</p>

  <img width="718" height="301" alt="image" src="https://github.com/user-attachments/assets/ad843d7b-8abf-41b4-8062-201b1ad0ae92" />

  <img width="718" height="301" alt="image" src="https://github.com/user-attachments/assets/ad843d7b-8abf-41b4-8062-201b1ad0ae92" />
  

An interactive PowerBI dashboard can be downloaded here.



Targeted SQL queries regarding various business questions can be found here.



# Data Structure & ERD (Entity Relationship Diagram)


Elist's database structure as seen below consists of four tables: orders, customers, geo_lookup, and order_status, with a total row count of 108,127 records.


<p align="center">
  <img src="PATH_OR_URL_TO_IMAGE" alt="Monthly sales table" width="700">
</p>




Prior to beginning the analysis, a variety of checks were conducted for quality control and familiarization with the datasets, the data cleaning change log can be found here.

The SQL queries used for data quality checks, cleaning, organizing, and preparing the data for the dashboard can be found here.
