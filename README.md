# Kultra-Mega-Stores-Inventory-Analysis
This is the analysis of the data from Kultra Mega Stores Inventory to gain insights which will improve the company's revenuez decision making.

## Project Topic:  Kultra Mega Stores Inventory 

## About Me
i am Umeh Evi Eseoghene a Pharmacist with experience in E-commerce and Tele-pharmacy. I am currently undergoing a training with DSA to learn and improve my skills on data tools such as Excel Power Bi and SQL. You can connect via:
- LinkedIn: https://www.linkedin.com/in/evi-eseoghene-6a5b35126
- Email: umehevi@gmail.com

### Table of content
- [Project Overview](#project-overview)
- [Data Source](#data-source)
- [Tools Used](#tools-used)
- [Queries](#queries)


### Project Overview
This analysis is to gain insight into Kultra Mega Stores Inventory a company that specialises in office supplies and
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
``` sql
---Q3 What were the total sales of appliances in ontario?
SELECT region,
   SUM(sales) as total_appliance_sales_ontario
FROM
   KMS_SQL
WHERE
   product_sub_category = 'appliances'
   AND province = 'ontario'
GROUP by region;
```
#### Result
| Region      | Total_Appliance_sales_ontario |
| ---------------- | ----------- | 
| Ontario    | 202346.840
#### Insight
The total sales of appliance in Ontario showed that the region is doing well.

### Question 4
``` sql
---Q4 Advice the management of kms what to do to increase the revenue from bottom 10 customers
---Identify the bottom 10 customer's revenue
SELECT TOP 10
   product_category,customer_name,
   SUM(sales) as total_sales
FROM
   KMS_SQL
GROUP BY
   product_category,customer_name
ORDER BY
   total_sales ASC;
```
#### Result
| Product_category     | Customer_name | Total_sales         
| ---------------- | -----------    |  ----------- |
|   Furniture      | Anne McFarland | 11.700   |
| Office Supplies  |Tiffany House   |  17.060  |
| Furniture        | Toby Carlisle  |  17.300  |
| Office Supplies  | Victor Price   |  22.130  |
| Furniture        | Emily Burns    |  22.740  |
| Technology       | Bradley Talbott  | 24.960  |
| Furniture        | Henry MacAllister | 25.520  |
| Technolog        | Amy Cox        |  25.960  |
| Office Supplies  | Deirdre Greer  |  26.530  |
| Office Supplies  | Chris McAfee   |  28.550 |
#### Insight
The result showed the 10 bottom customers revenue and the product that is generating low revenue.
To increae revenue frome thes customers, the following can be done:
- The management should analyse their purchase history, customer profile if they are small businesses or new customers
- Introduction of Exclusive bonuses and discount on purchase
- Loyalty programs to encourage repeat purchases
- Targeted marketing and promotions
- Improvement of customer relationship management
- Cross-sell and upsell to recommend complementary products or suggest higher value alternative 

#### Question 5














