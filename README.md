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
  

- View the Entity Relationship Diagram [here](Excel/elist_erd.png)

- Review the data issue log and cleaning notes [here](Excel/data_issue_log.xlsx)

- Explore the SQL queries used in the analysis [here](SQL/)

# Executive Summary

Elist generated **$28.1M across 108K orders** from 2019–2022. Sales grew quickly through 2020, hitting a high point of $1.25M in a single month, but then steadily declined to $260K per month by late 2022. This drop suggests that overall customer demand weakened over time.


The 2022 downturn reflects both the number of orders and the average amount customers spent going down, rather than a single operational issue. Stabilizing growth will likely require improving customer retention, diversifying product mix, and strengthening pricing and value.

<img width="957" height="355" alt="image" src="https://github.com/user-attachments/assets/36bfcd6e-7d0e-46ff-8251-9015843a560b" />






# Deep-Dive Insights







### Sales Trends

- **Revenue surged in 2020**, increasing +163% year-over-year. This growth was driven by both a sharp rise in order volume (+101%) and customers spending more per order (AOV +31%).

- **In 2021, revenue growth began to slow**, Even though the number of orders continued to rise slightly, customers were spending less per order (-15%) suggests customers were spending less per transaction which slowed overall revenue gains..

- **The decline accelerated in 2022**, with revenue falling 46% year-over-year. This downturn was driven by both fewer orders and continued pressure on average order value.

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
- Revenue is heavily concentrated in **North America**, which generated approximately **$14.5M** more than half of total sales. This gives the region an outsized impact on overall company    performance.
- **EMEA** contributed roughly **$8.2M (29%)**, while **APAC (13%)** and **LATAM (6%)** represent smaller but more diversified revenue streams.
- **APAC**  stands out despite its smaller size: customers there have the highest average order value ($279), reflecting a premium purchasing pattern despite lower overall order volume.
- Together, these patterns show a business anchored by North America, supported by steady performance in EMEA, and with meaningful upside potential in APAC’s higher‑value customer base.

<!-- Geographic concentration (hero visual) -->
<p>
  <img src="https://github.com/user-attachments/assets/7a83ade4-d4e7-4ffa-ae83-8884ed1be3e7" width="850" />
</p>

*North America drives the majority of revenue, while APAC shows higher-value purchases per order.*


**Seasonality**
- Sales display clear seasonality, with demand peaking in **Q4**, particularly in **December (10.15% of annual sales)**, reflecting holiday-driven purchasing behavior.
- **Q1 is consistently softer**, with **February (6.78%)** representing the weakest month on average, suggesting an early-year normalization following the holiday period.

<!-- Seasonality (supporting visual) -->
<p>
  <img src="https://github.com/user-attachments/assets/a489b786-3d5f-442c-904b-c0961c133f77" width="850" />
</p>

*Revenue consistently peaks in Q4 and softens in early Q1, reinforcing predictable holiday-driven seasonality.*


### Product Trends

**Revenue Concentration:**

- From 2019–2022, revenue was highly concentrated in a small set of core products: the 27in 4K gaming monitor ($9.9M, 35%), Apple AirPods Headphones ($7.7M, 28%), and MacBook Air Laptop ($6.3M, 22%) together generated roughly 85% of total sales, meaning overall performance is largely driven by trends within a limited set of flagship SKUs.

**Volume vs Ticket Size:**

- These products generate revenue in different ways: AirPods lead in order volume (48K orders), driving revenue through purchase frequency, while the 27in monitor delivers fewer orders (23K) but stronger monetization per transaction (AOV $421), balancing both volume and value.

**Premium vs Accessory Products:**

- Premium laptops (MacBook Air and ThinkPad) contribute revenue primarily through higher ticket size (AOVs ~$1,588 and ~$1,100) rather than frequency, reflecting lower order counts but higher per-order spend.

**Key Takeaways**

- Lower-priced accessories generate meaningful order volume but limited revenue impact due to very low AOVs (e.g., ~$20 cable packs), positioning them as attach-rate or retention drivers rather than core revenue contributors.
- Overall performance depends on a small group of high-impact SKUs, with revenue driven by different mechanisms—frequency for mass-market items and ticket size for premium products—highlighting the need for differentiated product strategies.






<p>
  <img src="https://github.com/user-attachments/assets/93671832-801b-434e-8a9b-a7ca041be470" width="900" />
</p>

*Revenue is highly concentrated, with the top three SKUs accounting for nearly 85% of total sales.*


<p>
  <img src="https://github.com/user-attachments/assets/92774757-e5b4-4915-bc7c-e1ee1575ff5e" width="900" />
</p>

*Mass-market products drive revenue through frequency, while premium laptops rely on higher ticket size, highlighting distinct product-level growth dynamics.*




## Loyalty Program

**Loyalty is driving a growing share of revenue over time, while average order values remain relatively similar across segments.**

- Loyalty customers consistently drove the majority of sales volume and revenue from 2019–2022, generating approximately **62K orders and $17.1M in revenue**, compared to **46K orders and $11.0M** from non-loyalty customers. While non-loyalty shoppers spent slightly more per order on average (AOV ~$275 vs. ~$240), loyalty customers contributed more overall through repeat purchasing.


- The divergence was most pronounced in 2020, when loyalty revenue surged to **$7.2M**, more than double non-loyalty revenue (~$3.0M), aligning with the pandemic-driven demand spike. By 2022, both segments declined, but loyalty customers remained the primary source of order volume, indicating that improvements in loyalty retention and engagement would have an outsized impact on revenue stability.


<img width="955" height="327" alt="image" src="https://github.com/user-attachments/assets/ae04d1f8-2c3a-477f-a355-eda107781d0f" />







## Refund Rates

**Refunds are concentrated in high-volume products, while elevated refund rates are primarily observed in premium categories.**

- Refund risk varies significantly by product, so both refund rate (%) and refund count (#) are evaluated together to separate quality-driven risk from scale-driven risk. The highest refund rates are observed in premium laptops — ThinkPad (~11.7%, 342 refunds) and MacBook Air (~11.4%, 453 refunds) — indicating elevated return friction in higher-ticket categories.

- Apple AirPods Headphones generate the largest refund volume (~2,636 refunds) but at a lower refund rate (~5.45%), meaning operational improvements at scale could still materially reduce total refunds despite lower per-order risk.

- At the portfolio level, refund rates peaked in 2020 (~9.2%), improved in 2021 (~3.6%), and appear as 0.0% in 2022 under the order_status-based metric. The 2022 result should be treated as a data coverage or tracking validation check rather than a true absence of refunds.

<!-- Refund volume & mix -->
<p>
  <img src="https://github.com/user-attachments/assets/632f9c76-f238-4ca9-b0d4-daec7b240a42" width="900" />
</p>

<p>
  <img src="https://github.com/user-attachments/assets/429252b3-de70-4a61-b5d1-1d2bc7443e3b" width="900" />
</p>


*Refund risk differs by product tier: premium items drive higher rates, while high-volume products drive total impact.*


## Regional Comparisons

**Regional analysis was used as a consistency check to understand whether product demand and operational performance varied meaningfully across markets.**

- Product demand patterns are highly consistent across regions. Apple AirPods Headphones are the top-selling product in every market, with order volume led by North America (24,731), followed by EMEA (15,090), APAC (5,662), and LATAM (2,636). This indicates that performance in a single high-volume product has a global impact rather than being driven by region-specific preferences.

- Delivery performance is also broadly consistent across regions. Using 2022 website purchases and all mobile app purchases, average time-to-deliver is tightly clustered around ~7.5 days across all markets (EMEA ~7.53, NA ~7.52, LATAM ~7.52, APAC ~7.51), suggesting minimal regional differences in fulfillment speed within this segment.

Overall, these results suggest that regional differences are not a primary driver of performance variation, allowing product- and customer-level strategies to be applied consistently across markets.

## Recommendations

**1. Protect and Optimize Core Revenue Drivers**
- Revenue is highly concentrated in a small number of flagship products, particularly the 27in 4K gaming monitor, Apple AirPods Headphones, and MacBook Air Laptop. Pricing, availability, and merchandising decisions for these SKUs should be prioritized, as performance shifts here have an outsized impact on overall revenue.
- Growth strategies should remain differentiated by product tier: mass-market items benefit most from volume and conversion optimization, while premium products benefit from protecting price integrity and reducing purchase friction.

**2. Strengthen Loyalty to Support Revenue Stability**
- Loyalty customers consistently drive the majority of order volume and total revenue, even as overall demand declined post-2020. Improvements in retention, engagement, and repeat purchase behavior within the loyalty program are likely to have a meaningful stabilizing effect on topline performance.
- While non-loyalty customers exhibit slightly higher AOVs, loyalty’s contribution through scale suggests that long-term growth is better supported through repeat behavior rather than one-time basket expansion.

**3. Reduce Refund Risk Where Rate and Scale Intersect**
- Refund prevention efforts should focus on high-impact areas where refund rate and sales share intersect. Premium laptops exhibit the highest refund rates, indicating an opportunity to reduce quality or expectation mismatches in higher-ticket categories.
- High-volume products such as AirPods generate the largest absolute number of refunds despite lower rates, meaning small operational or process improvements at scale could materially reduce total refund volume.

**4. Apply Product and Customer Strategies Consistently Across Regions**
- Regional analysis shows broadly consistent product demand patterns and delivery performance across markets, suggesting geography is not a primary driver of performance variation.
- As a result, product- and customer-level strategies can be applied globally without heavy regional customization, allowing teams to focus optimization efforts where they matter most.
