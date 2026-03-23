CREATE TABLE customers (
    customer_id VARCHAR(10) PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL
);

CREATE TABLE products (
    product_id VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    price INT NOT NULL
);

CREATE TABLE sales_reps (
    rep_id VARCHAR(10) PRIMARY KEY,
    rep_name VARCHAR(100) NOT NULL
);

CREATE TABLE orders (
    order_id VARCHAR(10) PRIMARY KEY,
    customer_id VARCHAR(10),
    rep_id VARCHAR(10),
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (rep_id) REFERENCES sales_reps(rep_id)
);

CREATE TABLE order_items (
    order_id VARCHAR(10),
    product_id VARCHAR(10),
    quantity INT,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Inserting the sampel values
INSERT INTO customers VALUES
('C1','Amit','Mumbai'),
('C2','Riya','Delhi'),
('C3','John','Mumbai'),
('C4','Neha','Bangalore'),
('C5','Raj','Pune');

INSERT INTO products VALUES
('P1','Laptop',50000),
('P2','Phone',20000),
('P3','Shoes',3000),
('P4','Watch',5000),
('P5','Bag',2000);

INSERT INTO sales_reps VALUES
('R1','Suresh'),
('R2','Meena'),
('R3','Rahul');

INSERT INTO orders VALUES
('O1','C1','R1','2026-01-01'),
('O2','C2','R2','2026-01-02'),
('O3','C3','R1','2025-01-03'),
('O4','C1','R3','2024-01-04'),
('O5','C4','R2','2023-01-05');

INSERT INTO order_items VALUES
('O1','P1',1),
('O1','P2',2),
('O2','P3',1),
('O3','P2',3),
('O4','P4',2);