use PROJECT
select * from KMS_Sql
---Q1 which product category had the highest sales?
SELECT TOP 1
   Product_category,
   SUM(sales) as total_sales
From 
   KMS_SQL
Group by
   product_category
Order by
   total_sales DESC;

---Q2A What are the top 3 region in terms of sales?
SELECT TOP 3
   Region,
   SUM(sales) as total_sales
From
   kMS_SQL
Group by
   Region
Order by
   total_sales DESC;

---Q2B
SELECT TOP 3
   Region,
   SUM(sales) as total_sales
From
   kMS_SQL
Group by
   Region
Order by
   total_sales ASC;

---Q3 What were the total sales of appliances in ontario?
SELECT region,
   SUM(sales) as total_appliance_sales_ontario
FROM
   KMS_SQL
WHERE
   product_sub_category = 'appliances'
   AND province = 'ontario'
GROUP by region;

---Q4 Adice the management of kms what to do to increase the revenue from bottom 10 customers
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

---Q7 Which small business customer had the highest sales?
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

---Q8 Which corporate customer placed the most number of order in 2009-2012?
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

---Q9 Which consumer customer was the most profitable one?
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

---Q10 Which customer returned items, and whatsegment do they belong?
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

---Q11 Company appropriately spent shipping cost based on 
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




