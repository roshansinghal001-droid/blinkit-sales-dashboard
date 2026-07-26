select * from Blinkit_Sale;



-- 1. KPI'S AND EDA ( Exploratory Data Analysis) --


-- A)  Total Sales --

select round(sum(Sales),2) as total_Sales from Blinkit_Sale ;

-- B)  AVG SALES  -- 

select Round(AVG(Sales),2) as avg_sales from Blinkit_Sale;

-- C)  AVG RATING --
select round(avg(Rating),2) as avg_rating from Blinkit_Sale;


-- D)  Total Number of Outlets --

select count(Outlet_Identifier) as TOTAL_OUTLETS from Blinkit_Sale;


-- E)  Total sales by fat content --

select * from Blinkit_Sale;

select Item_Fat_Content, round(sum(Sales),2) as Total_Sales
from Blinkit_Sale
group by Item_Fat_Content;

-- F)  TOTAL SALES BY ITEM TYPE --

select Item_Type , round(sum(Sales),2) as Total_Sales 
from Blinkit_Sale
group by Item_Type;


-- G)  TOTAL SALES BY OUTLET LOCATION --

select Outlet_Location_Type, round(sum(Sales),2) as Total_Sales 
from Blinkit_Sale
group by Outlet_Location_Type;



 -- H)  sales by Outlet_Establishment_Year --

 select Outlet_Establishment_Year, round(sum(Sales),2) as Total_Sales 
from Blinkit_Sale
group by Outlet_Establishment_Year
order by Outlet_Establishment_Year DESC;


-- I)  FAT CONTENT BY OUTLET LOCATION  TYPE FOR TOTAL SALES --

select * from Blinkit_Sale;

select Item_Fat_Content , Outlet_Location_Type  , round(sum(Sales),2) as Total_Sales 
from Blinkit_Sale
group by Item_Fat_Content , Outlet_Location_Type;



-- 2. Advanced Analytical Queries


--  A)  OUTLET RANK  BASED ON THEIR SALES AND AND LOCATION    ---

WITH outlet_sales AS (
    SELECT
        Outlet_Identifier,
        Outlet_Location_Type,
        SUM(Sales) AS Total_Sales
    FROM Blinkit_Sale
    GROUP BY Outlet_Identifier, Outlet_Location_Type
)
SELECT
    Outlet_Identifier,
    Outlet_Location_Type,
    Total_Sales,
    RANK() OVER (
        PARTITION BY Outlet_Location_Type
        ORDER BY Total_Sales DESC
    ) AS Sales_Rank
FROM outlet_sales
ORDER BY Outlet_Location_Type, Sales_Rank;



-- B)  CATEGORIZE  ITEM VISIBILTY AND CALCULATE AVG SALES --

WITH visibility_buckets AS (
    SELECT
        Sales,Item_Visibility,
        CASE
            WHEN Item_Visibility < 0.05 THEN 'Low'
            WHEN Item_Visibility BETWEEN 0.05 AND 0.10 THEN 'Medium'
            ELSE 'High'
        END AS Visibility_Bucket
    FROM Blinkit_Sale
)
SELECT
    Visibility_Bucket,
    ROUND(AVG(Sales), 2) AS Avg_Sales
FROM visibility_buckets
GROUP BY Visibility_Bucket;



-- C)  TOP 10 OUTLET MAKING MAX SALES --

select Outlet_Identifier , round(max(Sales),2) as total_sales
from Blinkit_Sale
group by Outlet_Identifier
order by total_sales desc
;



-- 3.  DATA CLEANING 


-- A) CLEANING FOR "Item_Fat_Content" --

select distinct Item_Fat_Content from Blinkit_Sale ;

 select 
 case 
 when Item_Fat_Content ='LF' THEN 'Low Fat' 
 when Item_Fat_Content = 'Reg' then ' Regular'else Item_Fat_Content end 
 as New_Item_Fat_Content , *
from Blinkit_Sale; 


-- B) CLEANING FOR "Outlet_Location_Type" --

select distinct Outlet_Location_Type from Blinkit_Sale ;

select 
case 
when Outlet_Location_Type = 'T1' then 'Tier 1' 
when Outlet_Location_Type = 'T2' then 'Tier 2'
when Outlet_Location_Type = 'T3' then 'Tier 3' 
else Outlet_Location_Type end 
as New_Outlet_Location_Type, *
from Blinkit_Sale;



-- 4. UPDATING THE TABLE  --

update Blinkit_Sale
set Item_Fat_Content = case 
 when Item_Fat_Content ='LF' THEN 'Low Fat' 
 when Item_Fat_Content = 'Reg' then 'Regular'else Item_Fat_Content end ;

update Blinkit_Sale
set Outlet_Location_Type =
case 
when Outlet_Location_Type = 'T1' then 'Tier 1' 
when Outlet_Location_Type = 'T2' then 'Tier 2'
when Outlet_Location_Type = 'T3' then 'Tier 3' 
else Outlet_Location_Type end ;


-- 5. VIEWING THE UPDATED TABLES 

select distinct Item_Fat_Content from Blinkit_Sale;
select distinct Outlet_Location_Type from Blinkit_Sale ;


-- 6. CLEANING NULL VALUES 


-- A) FINDING THE NULL VALUES --

select Item_Weight from Blinkit_Sale where Item_Weight is NULL;

-- B) DEALING WITH NULL VALUES -- 

SELECT *,
    COALESCE(Item_Weight, (SELECT AVG(Item_Weight) FROM blinkit)) AS Item_Weight_Filled
FROM Blinkit_Sale;

-- C) UPDATING THE NULL VALUES -- 

 UPDATE Blinkit_Sale
SET Item_Weight = (SELECT AVG(Item_Weight) FROM blinkit WHERE Item_Weight IS NOT NULL)
WHERE Item_Weight IS NULL;

-- D) VIEWING NON NULL TABLE 

select * from Blinkit_Sale;