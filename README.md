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

## Business Impact

This project helps retail businesses:

- Identify high-value customers for targeted marketing
- Track monthly revenue trends for forecasting
- Analyze regional performance for expansion strategy
- Detect inactive/high-risk customers for retention campaigns

The insights generated from this analysis can directly support data-driven decision making.

## Entity Relationship Diagram

![ER Diagram](assets/er_diagram.png)

