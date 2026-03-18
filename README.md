# Elist Ecommerce Performance Report

# Elist Ecommerce Performance Report

> Analyzing 4 years of ecommerce transaction data to diagnose a post-pandemic revenue decline and surface actionable growth levers — using SQL, Power BI, and Excel.

## Company Background
Founded in 2018, Elist Electronics is an online retailer selling consumer electronics globally via its website and mobile app. The business relies heavily on digital acquisition channels (email, SEO, affiliate partnerships) and derives a significant portion of revenue from major brands such as Apple, Samsung, and ThinkPad. Following rapid growth during the pandemic period, Elist experienced a multi-year revenue decline. This report evaluates whether that decline reflects temporary normalization or structural performance challenges, and identifies actionable levers for stabilization and growth.


<details close>
<summary><strong>📋 Project Overview</strong></summary>

**Objective:** Analyze Elist Electronics’ performance (2019–2022) to identify key revenue drivers and refund risk.

**Data:** Orders, customers, products, and operational data.


**Output:** Executive summary, diagnostic deep dives, reproducible SQL querie and a Power BI dashboard.

</details>

<details open>
<summary>Table of Contents</summary>

- [Performance Framework](#performance-measurement-framework)

- [Executive Summary](#executive-summary)

- [Deep Dive Insights](#deep-dive-insights)
  - [Sales Trends](#sales-trends)
  - [Geographic & Seasonality Trends](#geographic--seasonality-trends)
  - [Product Trends](#product-trends)
  - [Loyalty Program](#loyalty-program)
  - [Refund Rates](#refund-rates)
  - [Regional Comparisons](#regional-comparisons)

- [Recommendations](#recommendations)
- [Dashboard](#dashboard)

</details>

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

## Executive Summary

Elist generated **$28.1M across 108K orders** from 2019–2022. Sales grew quickly through 2020, hitting a high point of $1.25M in a single month, but then steadily declined to $260K per month by late 2022. This drop suggests that overall customer demand weakened over time.


The 2022 downturn reflects both the number of orders and the average amount customers spent going down, rather than a single operational issue. Stabilizing growth will likely require improving customer retention, diversifying product mix, and strengthening pricing and value.

<img width="957" height="355" alt="image" src="https://github.com/user-attachments/assets/36bfcd6e-7d0e-46ff-8251-9015843a560b" />






## Deep-Dive Insights

*The following sections diagnose each performance dimension in detail and close with prioritized recommendations.+






### Sales Trends

- **Revenue surged in 2020**, increasing +163% year-over-year. This growth was driven by both a sharp rise in order volume (+101%) and customers spending more per order (AOV +31%).

- **In 2021, revenue growth began to slow**, even though the number of orders continued to rise slightly, customers were spending less per order (-15%) which slowed overall revenue gains..

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
- **Q1 is consistently softer**, with **February (6.78%)** representing the weakest month on average, reflecting a natural cooldown after the holiday surge.

<!-- Seasonality (supporting visual) -->
<p>
  <img src="https://github.com/user-attachments/assets/a489b786-3d5f-442c-904b-c0961c133f77" width="850" />
</p>

*Revenue consistently peaks in Q4 and softens in early Q1, reinforcing predictable holiday-driven seasonality.*


### Product Trends

Revenue performance is driven by a small number of high-impact SKUs, with distinct growth dynamics across premium and mass-market categories.

**Revenue Concentration:**

- From 2019–2022, revenue was highly concentrated in a small set of core products: the 27‑inch 4K gaming monitor, Apple AirPods, and the MacBook Air which make up about **85%** of all sales. This means the company’s overall performance is heavily influenced by how these core products perform.

**Volume vs Ticket Size:**

- These products generate revenue in different ways: AirPods lead in order volume (48K orders), driving revenue through purchase frequency, while the 27in monitor sells fewer orders (23K) but brings in more money per transaction (AOV $421). Together, they balance volume and value.

**Premium vs Accessory Products:**

- Premium laptops (MacBook Air and ThinkPad) generate strong revenue because customers spend much more per order (AOVs $1,588 and $1,100) rather than frequency, even though they sell in smaller quantities.

**Key Takeaways**

- Lower-priced accessories generate meaningful order volume but limited revenue impact due to very low AOVs (e.g., ~$20 cable packs). Their value is more about boosting attach rates and keeping customers engaged, not driving topline sales.
- Overall performance depends on a small group of high-impact SKUs. Some products win through volume, others through higher price points. This mix highlights the need for tailored product strategies, one approach for mass‑market items and another for premium, high‑value products.





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


- Loyalty customers consistently drove the majority of sales volume and revenue from 2019–2022, generating approximately **62K orders and $17.1M in revenue**, compared to **46K orders and $11.0M** from non-loyalty customers. Even though non‑loyalty shoppers spent slightly more per order on average, loyalty customers made up the difference through repeat purchases.


- The gap between the two groups was especially large in 2020. Loyalty revenue surged to **$7.2M**, during the pandemic demand spike — more than double the revenue from non‑loyalty customers. This shows how valuable repeat buyers were during the company’s strongest growth period.


- By 2022, both segments declined, but loyalty customers remained the primary source of order volume, indicating that improvements in loyalty retention and engagement would have an outsized impact on revenue stability.


<img width="955" height="327" alt="image" src="https://github.com/user-attachments/assets/ae04d1f8-2c3a-477f-a355-eda107781d0f" />







## Refund Rates

**Refunds are concentrated in high-volume products, while elevated refund rates are primarily observed in premium categories.**

- Refund patterns differ sharply by product type. High‑volume items generate the most total refunds simply because they sell more units, while premium products tend to have higher refund rates because customers are more sensitive to issues on expensive purchases.

- ThinkPad and MacBook Air both see refund rates around **11–12%**, signaling more friction or dissatisfaction in higher‑ticket categories. Even though the number of refunds is smaller than mass‑market items, the rate itself is elevated.

- Apple AirPods Headphones generate the largest refund volume with more than 2,600 refunds, but their refund rate is relatively low (~5.45%), meaning operational improvements at scale could still materially reduce total refunds despite lower per-order risk.

- Refund rates peaked in 2020 at roughly 9%, improved significantly in 2021, and appear as 0% in 2022 due to a data‑tracking limitation rather than an actual elimination of refunds.
In short: premium products carry the highest refund rates, while high-volume products drive the largest total refund count — both require targeted but distinct interventions.

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

- Product demand patterns are highly consistent across regions. Apple AirPods are the top‑selling product in every market, with North America leading in order volume, followed by EMEA, APAC, and LATAM. This shows that global performance is driven by a few high‑volume products rather than region‑specific preferences.

- Delivery performance is also broadly consistent across regions. In 2022, average delivery speed hovered around 7.5 days across all regions, suggesting that fulfillment operations are performing consistently worldwide.

Overall, these results suggest that regional differences are not a primary driver of performance variation, allowing product and customer-level strategies to be applied consistently across markets.

## Recommendations

**1. Protect and Optimize Core Revenue Drivers**
- Revenue is highly concentrated in a small number of flagship products, particularly the 27in 4K gaming monitor, Apple AirPods Headphones, and MacBook Air Laptop. Pricing, availability, and merchandising decisions for these SKUs should be prioritized, as performance shifts here have an outsized impact on overall revenue.
- Tailor growth strategies by product tier — optimize volume for mass‑market items and protect pricing for premium ones. 

**2. Strengthen Loyalty to Support Revenue Stability**
- Loyalty customers consistently drive the majority of order volume and total revenue, even as overall demand declined post-2020. Improvements in retention, engagement, and repeat purchase behavior within the loyalty program are likely to have a meaningful stabilizing effect on topline performance.
- While non-loyalty customers exhibit slightly higher AOVs, loyalty’s contribution through scale suggests that long-term growth is better supported through repeat behavior rather than one-time basket expansion.

**3. Reduce Refund Risk Where Rate and Scale Intersect**
- Focus refund prevention on products with both high refund rates and high sales volume. Premium laptops show elevated refund rates, suggesting a need to reduce friction in higher‑ticket categories
- AirPods generate the most refunds overall, so even small operational improvements could have a big impact.

**4. Apply Product and Customer Strategies Consistently Across Regions**
- Regional analysis shows broadly consistent product demand patterns and delivery performance across markets, suggesting geography is not a primary driver of performance variation.
- As a result, product- and customer-level strategies can be applied globally without heavy regional customization, allowing teams to focus optimization efforts where they matter most.

## Dashboard

*Note: Static preview shown below.

<img width="959" height="535" alt="image" src="https://github.com/user-attachments/assets/ec2cadec-564b-4de4-b47c-fae267768dcd" />

