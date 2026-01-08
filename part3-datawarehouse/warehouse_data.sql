USE fleximart_dw;

-- dim_date (sample)
INSERT INTO dim_date VALUES
(20240101, '2024-01-01', 'Monday', 1, 1, 'January', 'Q1', 2024, false),
(20240106, '2024-01-06', 'Saturday', 6, 1, 'January', 'Q1', 2024, true),
(20240210, '2024-02-10', 'Saturday', 10, 2, 'February', 'Q1', 2024, true);

-- dim_product
INSERT INTO dim_product (product_id, product_name, category, subcategory, unit_price) VALUES
('P001', 'Laptop', 'Electronics', 'Computers', 50000),
('P002', 'Shoes', 'Fashion', 'Footwear', 3000),
('P003', 'Phone', 'Electronics', 'Mobiles', 25000);

-- dim_customer
INSERT INTO dim_customer (customer_id, customer_name, city, state, customer_segment) VALUES
('C001', 'Rahul Sharma', 'Delhi', 'Delhi', 'High Value'),
('C002', 'Anjali Mehta', 'Mumbai', 'Maharashtra', 'Medium Value');

-- fact_sales
INSERT INTO fact_sales (date_key, product_key, customer_key, quantity_sold, unit_price, total_amount) VALUES
(20240101, 1, 1, 2, 50000, 100000),
(20240106, 2, 2, 1, 3000, 3000),
(20240210, 3, 1, 1, 25000, 25000);
