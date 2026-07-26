# blinkit-sales-dashboard
Blinkit Sales Analysis — SQL & Power BI Dashboard
📌 Overview

This project analyzes sales data for Blinkit (a quick-commerce grocery platform), using SQL Server for data cleaning and exploratory analysis, and Power BI to build an interactive dashboard for visualizing key business metrics.

The goal is to uncover insights around total sales, outlet performance, product categories, and customer ratings — helping identify which outlets, locations, and item types drive the most revenue.

🛠️ Tools Used
SQL Server Management Studio (SSMS) — data cleaning, transformation, and analysis
Power BI — interactive dashboard and data visualization
T-SQL — CTEs, window functions, aggregate queries, and data updates
📂 Project Files
File	Description
BLINKIT.sql	Full SQL script: data cleaning, EDA, and advanced analytical queries
BLINKIT.pbix	Power BI dashboard file
screenshots/	Dashboard preview images
🧹 Data Cleaning
Standardized inconsistent category labels in Item_Fat_Content (e.g. LF → Low Fat, Reg → Regular)
Standardized outlet location codes in Outlet_Location_Type (e.g. T1 → Tier 1, T2 → Tier 2, T3 → Tier 3)
Identified and handled NULL values in Item_Weight by imputing the column average
Verified cleaned data with distinct-value checks before and after updates
📊 Exploratory Data Analysis (EDA)

Key metrics calculated directly in SQL:

Total Sales
Average Sales per Transaction
Average Customer Rating
Total Number of Outlets
Sales broken down by:
Fat Content
Item Type
Outlet Location Type
Outlet Establishment Year
🔍 Advanced Analytical Queries
Outlet ranking by sales within each location tier using RANK() OVER (PARTITION BY ...)
Item visibility bucketing (Low / Medium / High) with average sales per bucket using a CTE
Top 10 outlets by maximum sales value
📈 Power BI Dashboard

The dashboard visualizes the cleaned dataset and SQL findings, including:

Overall KPI summary (Total Sales, Avg Sales, Avg Rating, Outlet Count)
Sales distribution by item type, fat content, and outlet location
Outlet performance comparison across tiers
Trends by outlet establishment year

🙋‍♂️ About

This project was built as a hands-on exercise combining SQL-based data cleaning/analysis with Power BI visualization, simulating a real-world retail analytics workflow.
