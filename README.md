# # Retail Revenue Analytics (SQL)

An advanced Retail Revenue Intelligence project built using MySQL. 
This project analyzes customer behavior, revenue trends, regional sales performance, 
and customer risk classification to generate actionable business insights.

## 📊 Project Highlights
- Customer Segmentation (High / Medium / Low Value)
- Revenue Analysis by Month
- Regional Sales Analysis
- Customer Risk Classification

## 🛠️ Tools Used
- MySQL
- SQL Joins & Aggregations
- Business Intelligence Concepts

## 🗄️ Database Structure
The project uses a relational retail database with the following tables:

- customers (customer_id, name, city, join_date)
- products (product_id, product_name, category, price)
- orders (order_id, customer_id, order_date, region)
- order_items (order_id, product_id, quantity)

The tables are connected using primary and foreign key relationships.

## 💻 SQL Query Example
```sql
SELECT o.region,
       SUM(p.price * oi.quantity) AS total_revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY o.region
ORDER BY total_revenue DESC;
```

## 📈 Key Insights

- North region generated highest revenue
- High-value customers contributed 60%+ sales

## 🎯 Business Impact

- Identified high-value customer segments for targeted marketing
- Analyzed regional sales performance across multiple locations
- Tracked revenue trends to support forecasting decisions
- Highlighted customer inactivity risks for retention planning
...

## 🔗 Entity Relationship Diagram

![ER Diagram](er_diagram.png)

## Project Outcomes

✔ Customer Segmentation

✔ Revenue Trend Analysis

✔ Regional Performance Insights

✔ Customer Risk Classification

✔ Business Intelligence Reporting

## 🚀 Results

- Identified high-value customers contributing 60%+ revenue
- North region generated highest sales
- Customer segmentation enabled targeted marketing insights
- Built reusable SQL analytics framework
