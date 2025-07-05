# Kultra-Mega-Stores-Inventory-Analysis
This is the analysis of the data from Kultra Mega Stores Inventory to gain insights which will improve the company's revenuez decision making.

## Project Topic:  Kultra Mega Stores Inventory 

## About Me
I am Umeh Evi Eseoghene a Pharmacist with experience in E-commerce and Tele-pharmacy. I am currently undergoing a training with DSA to learn and improve my skills on data tools such as Excel, Power Bi and SQL. You can connect via:
- LinkedIn: https://www.linkedin.com/in/evi-eseoghene-6a5b35126
- Email: umehevi@gmail.com

### Table of content
- [Project Overview](#project-overview)
- [Data Source](#data-source)
- [Tools Used](#tools-used)
- [Queries](#queries)
- [Recommendation](#recommendation)


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

### Question 5
``` sql
---Q5 The company incurred the most shipping cost using which shipping method
SELECT
   [Ship_mode],
   SUM([Shipping_cost]) as total_shipping_cost
FROM
   KMS_SQL
GROUP BY
   [Ship_mode]
ORDER BY
   total_shipping_cost DESC;
```
#### Result
| Shp_mode          | Total_shiping_cost |
| ---------------- | ----------- | 
| Delivery Truck   | 51971.940
| Regular Air      | 48008.190
| Express Air      | 7850.910
#### Insight
The company incured the most shipping cost using the Delivery Truck. The company can focus more on other route of delivery to reduce cost.

### Questin 6
``` sql
---Q6 Who are the most valuable customers and what product or service do they typically purchase?
SELECT 
   [customer_name],
   [product_category],
   COUNT(*) as purchase_count,
   SUM(sales) as total_spent
FROM
   KMS_SQL
WHERE
   [customer_name] IN (
      SELECT TOP 2 [customer_name]
	  FROM KMS_SQL
	  GROUP BY [customer_name]
	  ORDER BY SUM(sales) DESC
	)
GROUP BY
   [customer_name], [product_category]
ORDER BY
   [customer_name], Total_spent DESC;
```
#### Result
| Customer_name     | Product_category | Purchase_count  | Total_spent        
| ----------------  | -----------      |  -----------    |----------- |
| Deborah Brumfield | Technology       |  8              | 76795.796  |
| Deborah Brumfield | Furniture        |  4              | 12809.620  |
| Deborah Brumfiel  | Office Supplies  |  8              | 7827.720   |
| Emily Phan        | Technology       |  4              | 110481.968  |
| Emily Phan        |  Furniture       |  1              | 4011.650   |
| Emily Phan        | Office Supplies  |  5              | 2630.820   |
#### Insight
The result highlight the top selling products purchased by the most valuable customers.

### Question 7
---Q7 Which small business customer had the highest sales?
``` sql
SELECT TOP 1
   customer_name,
   SUM(sales) as total_sales
FROM
   KMS_SQL
WHERE
   customer_segment = 'small business'
GROUP BY
   customer_name
ORDER BY
   total_sales DESC;
```
#### Result
| Customer_name    | Total_Sales |
| ---------------- | ----------- | 
|  Dennis Kane     | 75967.591
#### Insight
This showed the small business that generated the highest revenue.  

### Question 8
---Q8 Which corporate customer placed the most number of order in 2009-2012?
``` sql
SELECT TOP 1
   customer_name,
   COUNT(DISTINCT order_id) AS total_orders
FROM
   KMS_SQL
WHERE
   customer_segment = 'corporate'
   AND order_date BETWEEN '2009-01-01' AND '2012-12-31'
GROUP BY
   customer_name
ORDER BY
   total_orders DESC;
```
#### Result
| Customer_name    | Total_orders |
| ---------------- | ----------- | 
|  Adam Hart       | 18
#### Insight
The company should put in place reward systems for such customers to maintain loyaty and increase customers demand which will lead to more revenue

### Question 9
---Q9 Which consumer customer was the most profitable one?
``` sql
SELECT TOP 1
   customer_name,
   SUM(profit) as total_profit
FROM
   KMS_SQL
WHERE
   customer_segment = 'consumer'
GROUP BY 
   customer_name
ORDER BY
   total_profit DESC;
```
#### Result
| Customer_name    | Total_profit |
| ---------------- | -----------  | 
| Emily Phan       | 34005.440
#### Insight
This will give insight into the product that the customer usually purchase to make the purchase the most prifitable

### Question 10
---Q10 Which customer returned items, and what segment do they belong?
``` sql
SELECT * from dbo.KMS_Sql
SELECT * from dbo.Order_Status

SELECT
   K.customer_name,
   k.customer_segment,
   k.order_id,
   o.status
FROM
   KMS_Sql k
JOIN
   order_status o ON K.order_id = o.order_id
WHERE
   o.status = 'Returned'
```
#### Result and Insight
From the result, over 500 customers across various segment returned items. This should give insight into why there were many returns and what the company can do to reduce return rate.

### Question 11
---Q11 Company appropriately spent shipping cost based on 
``` sql
SELECT
   order_priority,
   ship_mode,
   COUNT(*) AS order_count,
   AVG(shipping_cost) AS Avg_shipping_cost
FROM
   KMS_Sql
GROUP BY
   order_priority, ship_mode
ORDER BY
   order_priority, ship_mode DESC;
```
#### Result and Insight
Based on the analysis, the company spent shipping cost based on a combination of order priority and shipping mode which aligns with customer expectations and delivery commitments.

### Recommendation
Following the analysis of sales and customer behaviour data, the company can increase revenue by:
- Highlighting best selling products in-store and advertisement. Also seasonal promotions around peak buying seasons.
- Create furniture and office supplies packages with little disvount to encourage customers to buy more inorder to increase average order value
- Customers with low purchasing power and frequency should be given personalized offers like installmental payment
- Ensure fast, reliable and affordable delivery.
- Improve Customer care service and use customers feedback expecially during return to refine designs and improve durability of products.
   












