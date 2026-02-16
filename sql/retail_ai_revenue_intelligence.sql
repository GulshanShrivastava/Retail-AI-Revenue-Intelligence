USE retail_ai_system;
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(50),
    join_date DATE
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    region VARCHAR(50),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
INSERT INTO customers VALUES
(1, 'Amit Sharma', 'Delhi', '2023-01-10'),
(2, 'Sneha Verma', 'Mumbai', '2023-02-15'),
(3, 'Rahul Mehta', 'Bangalore', '2023-03-20'),
(4, 'Priya Singh', 'Delhi', '2023-04-12'),
(5, 'Karan Patel', 'Ahmedabad', '2023-05-18');
SELECT * FROM customers;
INSERT INTO products VALUES
(1, 'Laptop', 'Electronics', 60000),
(2, 'Mobile', 'Electronics', 20000),
(3, 'Headphones', 'Accessories', 2000),
(4, 'Office Chair', 'Furniture', 8000),
(5, 'Desk', 'Furniture', 12000);
SELECT * FROM products;
INSERT INTO orders VALUES
(1, 1, '2023-01-15', 'North'),
(2, 2, '2023-02-18', 'West'),
(3, 3, '2023-03-25', 'South'),
(4, 1, '2023-04-10', 'North'),
(5, 4, '2023-05-20', 'East');
INSERT INTO order_items VALUES
(1, 1, 1),   -- Order 1 bought 1 Laptop
(1, 3, 2),   -- Order 1 bought 2 Headphones
(2, 2, 1),   -- Order 2 bought 1 Mobile
(3, 4, 1),   -- Order 3 bought 1 Chair
(4, 1, 1),   -- Order 4 bought 1 Laptop
(5, 5, 1);   -- Order 5 bought 1 Desk
Select * from order_items;
SELECT 
    SUM(p.price * oi.quantity) AS total_revenue
FROM order_items oi
JOIN products p 
ON oi.product_id = p.product_id;
SELECT 
    p.product_name,
    SUM(p.price * oi.quantity) AS revenue
FROM order_items oi
JOIN products p 
ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY revenue DESC;
SELECT 
    o.region,
    SUM(p.price * oi.quantity) AS revenue
FROM orders o
JOIN order_items oi 
ON o.order_id = oi.order_id
JOIN products p 
ON oi.product_id = p.product_id
GROUP BY o.region
ORDER BY revenue DESC;
SELECT 
    c.name,
    SUM(p.price * oi.quantity) AS total_spent
FROM customers c
JOIN orders o 
ON c.customer_id = o.customer_id
JOIN order_items oi 
ON o.order_id = oi.order_id
JOIN products p 
ON oi.product_id = p.product_id
GROUP BY c.name
ORDER BY total_spent DESC;
CREATE VIEW customer_revenue AS
SELECT c.name,
       SUM(p.price * oi.quantity) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY c.name;
SELECT 
    DATE_FORMAT(o.order_date, '%Y-%m') AS month,
    SUM(p.price * oi.quantity) AS total_revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY month
ORDER BY month;
SELECT 
    c.name,
    SUM(p.price * oi.quantity) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY c.name
ORDER BY total_spent DESC
LIMIT 3;
SELECT 
    c.name,
    SUM(p.price * oi.quantity) AS total_spent,
    CASE
        WHEN SUM(p.price * oi.quantity) > 50000 THEN 'High Value'
        WHEN SUM(p.price * oi.quantity) BETWEEN 20000 AND 50000 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS customer_segment
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY c.name
ORDER BY total_spent DESC;
SELECT 
    c.name,
    MAX(o.order_date) AS last_order_date,
    DATEDIFF('2024-01-01', MAX(o.order_date)) AS days_since_last_order,
    CASE
        WHEN DATEDIFF('2024-01-01', MAX(o.order_date)) > 60 THEN 'High Risk'
        WHEN DATEDIFF('2024-01-01', MAX(o.order_date)) BETWEEN 30 AND 60 THEN 'Medium Risk'
        ELSE 'Active'
    END AS customer_risk
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.name;
SELECT 
    c.name,
    MAX(o.order_date) AS last_order_date,
    DATEDIFF(CURDATE(), MAX(o.order_date)) AS days_since_last_order,
    CASE
        WHEN DATEDIFF(CURDATE(), MAX(o.order_date)) > 180 THEN 'High Risk'
        WHEN DATEDIFF(CURDATE(), MAX(o.order_date)) BETWEEN 60 AND 180 THEN 'Medium Risk'
        ELSE 'Active'
    END AS customer_risk
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.name;
