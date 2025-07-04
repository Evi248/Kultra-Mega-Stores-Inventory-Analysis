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

### Result
| Product_Category | Total_Sales |
| ---------------- | ----------- | 
| Technology | 5984248.409
### Insight
Technoly emerged as the top selling product category driving significant revenue for the business. This suggest a strong demand for tech related products.








