# Retail AI Revenue Intelligence

An advanced Retail Revenue Intelligence project built using MySQL. 
This project analyzes customer behavior, revenue trends, regional sales performance, 
and customer risk classification to generate actionable business insights.

## Project Highlights
- Customer Segmentation (High / Medium / Low Value)
- Revenue Analysis by Month
- Regional Sales Analysis
- Customer Risk Classification

## Tools Used
- MySQL
- SQL Joins & Aggregations
- Business Intelligence Concepts

  ## Database Structure

The project uses a relational retail database with the following tables:

- customers (customer_id, name, city, join_date)
- products (product_id, product_name, category, price)
- orders (order_id, customer_id, order_date, region)
- order_items (order_id, product_id, quantity)

The tables are connected using primary and foreign key relationships.

## SQL Query Example

```sql
SELECT o.region,
       SUM(p.price * oi.quantity) AS total_revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY o.region
ORDER BY total_revenue DESC;

```markdown
## Key Insights

## Future AI Enhancements

- AI-based customer churn prediction
- Sales demand forecasting using machine learning
- Copilot chatbot for natural language sales Q&A
- Smart product recommendation engine
- AI-driven retention campaign suggestions

- North region generated the highest revenue
- High-value customers contributed 60%+ total sales
- Electronics category showed best monthly growth
- Customer inactivity risk increased in low-performing regions

## Business Impact

This project helps retail businesses:

- Identify high-value customers for targeted marketing
- Track monthly revenue trends for forecasting
- Analyze regional performance for expansion strategy
- Detect inactive/high-risk customers for retention campaigns

The insights generated from this analysis can directly support data-driven decision making.

## Entity Relationship Diagram

![ER Diagram](assets/er_diagram.png)

