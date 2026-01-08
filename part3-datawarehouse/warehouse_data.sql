USE fleximart_dw;

INSERT INTO dim_date VALUES
(20240101,'2024-01-01','Monday',1,1,'January','Q1',2024,FALSE),
(20240102,'2024-01-02','Tuesday',2,1,'January','Q1',2024,FALSE),
(20240103,'2024-01-03','Wednesday',3,1,'January','Q1',2024,FALSE),
(20240104,'2024-01-04','Thursday',4,1,'January','Q1',2024,FALSE),
(20240105,'2024-01-05','Friday',5,1,'January','Q1',2024,FALSE),
(20240106,'2024-01-06','Saturday',6,1,'January','Q1',2024,TRUE),
(20240107,'2024-01-07','Sunday',7,1,'January','Q1',2024,TRUE),
(20240108,'2024-01-08','Monday',8,1,'January','Q1',2024,FALSE),
(20240109,'2024-01-09','Tuesday',9,1,'January','Q1',2024,FALSE),
(20240110,'2024-01-10','Wednesday',10,1,'January','Q1',2024,FALSE),
(20240111,'2024-01-11','Thursday',11,1,'January','Q1',2024,FALSE),
(20240112,'2024-01-12','Friday',12,1,'January','Q1',2024,FALSE),
(20240113,'2024-01-13','Saturday',13,1,'January','Q1',2024,TRUE),
(20240114,'2024-01-14','Sunday',14,1,'January','Q1',2024,TRUE),
(20240115,'2024-01-15','Monday',15,1,'January','Q1',2024,FALSE),
(20240201,'2024-02-01','Thursday',1,2,'February','Q1',2024,FALSE),
(20240202,'2024-02-02','Friday',2,2,'February','Q1',2024,FALSE),
(20240203,'2024-02-03','Saturday',3,2,'February','Q1',2024,TRUE),
(20240204,'2024-02-04','Sunday',4,2,'February','Q1',2024,TRUE),
(20240205,'2024-02-05','Monday',5,2,'February','Q1',2024,FALSE),
(20240206,'2024-02-06','Tuesday',6,2,'February','Q1',2024,FALSE),
(20240207,'2024-02-07','Wednesday',7,2,'February','Q1',2024,FALSE),
(20240208,'2024-02-08','Thursday',8,2,'February','Q1',2024,FALSE),
(20240209,'2024-02-09','Friday',9,2,'February','Q1',2024,FALSE),
(20240210,'2024-02-10','Saturday',10,2,'February','Q1',2024,TRUE),
(20240211,'2024-02-11','Sunday',11,2,'February','Q1',2024,TRUE),
(20240212,'2024-02-12','Monday',12,2,'February','Q1',2024,FALSE),
(20240213,'2024-02-13','Tuesday',13,2,'February','Q1',2024,FALSE),
(20240214,'2024-02-14','Wednesday',14,2,'February','Q1',2024,FALSE),
(20240215,'2024-02-15','Thursday',15,2,'February','Q1',2024,FALSE);


INSERT INTO dim_product (product_id,product_name,category,subcategory,unit_price) VALUES
('P001','Laptop','Electronics','Computers',55000),
('P002','Smartphone','Electronics','Mobiles',30000),
('P003','Tablet','Electronics','Gadgets',20000),
('P004','Headphones','Electronics','Accessories',2500),
('P005','Smartwatch','Electronics','Wearables',12000),

('P006','T-Shirt','Fashion','Clothing',800),
('P007','Jeans','Fashion','Clothing',2000),
('P008','Jacket','Fashion','Outerwear',3500),
('P009','Shoes','Fashion','Footwear',4000),
('P010','Cap','Fashion','Accessories',500),

('P011','Sofa','Home','Furniture',45000),
('P012','Dining Table','Home','Furniture',60000),
('P013','Lamp','Home','Decor',1500),
('P014','Curtains','Home','Decor',2200),
('P015','Mattress','Home','Bedding',25000);


INSERT INTO dim_customer (customer_id,customer_name,city,state,customer_segment) VALUES
('C001','Rahul Sharma','Delhi','Delhi','High'),
('C002','Anjali Mehta','Mumbai','Maharashtra','Medium'),
('C003','Amit Verma','Delhi','Delhi','Low'),
('C004','Neha Singh','Bengaluru','Karnataka','Medium'),
('C005','Karan Patel','Mumbai','Maharashtra','High'),
('C006','Pooja Iyer','Chennai','Tamil Nadu','Medium'),
('C007','Rohit Das','Bengaluru','Karnataka','Low'),
('C008','Sneha Nair','Chennai','Tamil Nadu','High'),
('C009','Vikram Rao','Delhi','Delhi','Medium'),
('C010','Divya Shah','Mumbai','Maharashtra','Low'),
('C011','Manish Kumar','Bengaluru','Karnataka','Medium'),
('C012','Anita Joseph','Chennai','Tamil Nadu','High');


INSERT INTO fact_sales
(date_key,product_key,customer_key,quantity_sold,unit_price,discount_amount,total_amount)
VALUES
(20240106,1,1,2,55000,0,110000),
(20240107,2,2,3,30000,0,90000),
(20240113,3,3,1,20000,0,20000),
(20240114,4,4,4,2500,0,10000),
(20240120,5,5,2,12000,0,24000),
(20240121,6,6,5,800,0,4000),
(20240127,7,7,3,2000,0,6000),
(20240128,8,8,2,3500,0,7000),
(20240203,9,9,4,4000,0,16000),
(20240204,10,10,6,500,0,3000),

(20240210,11,11,1,45000,0,45000),
(20240211,12,12,2,60000,0,120000),
(20240217,13,1,3,1500,0,4500),
(20240218,14,2,2,2200,0,4400),
(20240224,15,3,1,25000,0,25000),

(20240106,1,4,1,55000,0,55000),
(20240107,2,5,2,30000,0,60000),
(20240113,3,6,2,20000,0,40000),
(20240114,4,7,3,2500,0,7500),
(20240120,5,8,1,12000,0,12000),
(20240121,6,9,4,800,0,3200),
(20240127,7,10,2,2000,0,4000),
(20240128,8,11,1,3500,0,3500),
(20240203,9,12,3,4000,0,12000),
(20240204,10,1,5,500,0,2500),

(20240210,11,2,1,45000,0,45000),
(20240211,12,3,2,60000,0,120000),
(20240217,13,4,2,1500,0,3000),
(20240218,14,5,1,2200,0,2200),
(20240224,15,6,2,25000,0,50000);
