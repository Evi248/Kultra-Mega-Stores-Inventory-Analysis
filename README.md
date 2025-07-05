# Kultra-Mega-Stores-Inventory-Analysis
This is the analysis of the data from Kultra Mega Stores Inventory to gain insights which will improve the company's decision making.

## Project Topic:  Kultra Mega Stores Inventory 

### Table of content
- [Project Overview](#project-overview)
- [Data Source](#data-source)
- [Tools Used](#tools-used)
- [Queries](#queries)


### Project Overview
This analysis is to gain insight into Kultra Mega Stores Inventory a company headquartered in Lagos and specialises in office supplies and
furniture. Its customer base includes individual consumers, small businesses (retail), and
large corporate clients (wholesale) across Lagos, Nigeria.

### Data Source
Kultra Mega Stores Inventory CSV file

### Tools Used
- SQL (Sql server) for analysis

### Queries
### Question 1
Q1 which product category had the highest sales?
``` sql
 SELECT TOP 1
   Product_category,
   SUM(sales) as total_sales
From 
   KMS_SQL
Group by
   product_category
Order by
   total_sales DESC;
```
#### Result
| Product_Category | Total_Sales |
| ---------------- | ----------- | 
| Technology | 5984248.409
#### Insight
Technoly emerged as the top selling product category driving significant revenue for the business. This suggest a strong demand for tech related products.

### Question 2
---Q2A What are the top 3 region in terms of sales?
``` sql
SELECT TOP 3
   Region,
   SUM(sales) as total_sales
From
   kMS_SQL
Group by
   Region
Order by
   total_sales DESC;
```
#### Result
| Region           | Total_Sales |
| ---------------- | ----------- | 
| West           | 3597549.329
| Ontario        |3063212.527 
|  Prarie        |2837304.650

---Q2B 3 botton regions in terms of sale
``` sql
SELECT TOP 3
   Region,
   SUM(sales) as total_sales
From
   kMS_SQL
Group by
   Region
Order by
   total_sales ASC;
```
#### Result
| Region           | Total_Sales |
| ---------------- | ----------- | 
| Nunavut          | 116376.486
| Northwest Territories |800847.341
| Yukon        |975867.383
#### Insight
The result showed the top 3 regions that made the highest sales and the 3 bottom regions that made the lowest sales. This will help the company to know were to focus raw materials and other resources to improve sales.

### Question 3











