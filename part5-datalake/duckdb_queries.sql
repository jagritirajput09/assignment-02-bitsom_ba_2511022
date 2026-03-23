-- Q1:
SELECT c.customer_id, COUNT(o.order_id)
FROM read_csv_auto('customers.csv') c
LEFT JOIN read_json_auto('orders.json') o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id;

-- Q2:
SELECT customer_id, SUM(total_amount) total
FROM read_json_auto('orders.json')
GROUP BY customer_id
ORDER BY total DESC
LIMIT 3;

-- Q3:
SELECT *
FROM read_parquet('products.parquet');

-- Q4:
SELECT c.name, o.order_date, p.product_name
FROM read_csv_auto('customers.csv') c
JOIN read_json_auto('orders.json') o
ON c.customer_id = o.customer_id
JOIN read_parquet('products.parquet') p
ON TRUE;