# Blinkit Sales Dashboard

Data cleaning and exploratory analysis in SQL Server, visualized through an interactive Power BI dashboard covering Blinkit sales, outlet performance, and product trends.

## Overview
This project analyzes Blinkit sales data to surface insights on revenue, outlet performance, and product trends. Raw data was cleaned and analyzed in SQL Server, then visualized in an interactive Power BI dashboard.

## Tools
SQL Server (T-SQL) · Power BI

## Files
- `BLINKIT.sql` — Data cleaning and analysis queries
- `BLINKIT.pbix` — Power BI dashboard
- `screenshots/` — Dashboard preview

## Process
**Data Cleaning:** Standardized inconsistent category labels, resolved null values, validated data integrity.

**Analysis:** Calculated core KPIs (total sales, average sales, average rating, outlet count), broke down sales by item type, fat content, outlet location, and establishment year, and used window functions to rank outlet performance by region.

**Dashboard:** Built an interactive Power BI report summarizing key metrics and trends for quick business insight.


## Key Insights
- *(e.g. Tier 1 outlets generate the highest average sales)*
- *(e.g. Low Fat items account for the majority of total revenue)*

## Usage
1. Clone the repository
2. Open `BLINKIT.sql` in SQL Server Management Studio to review the analysis
3. Open `BLINKIT.pbix` in Power BI Desktop to explore the dashboard
