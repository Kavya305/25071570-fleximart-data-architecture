import pandas as pd
import mysql.connector
from datetime import datetime


conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="kavya123",
    database="fleximart"
)
cursor = conn.cursor()


customers = pd.read_csv("data/customers_raw.csv")
products = pd.read_csv("data/products_raw.csv")
sales = pd.read_csv("data/sales_raw.csv")

# Customers
customers.drop_duplicates(inplace=True)
customers = customers.drop_duplicates(subset=["email"])
customers.dropna(subset=["email"], inplace=True)
customers["phone"] = customers["phone"].astype(str)
customers["phone"] = customers["phone"].str.replace(r"\D", "", regex=True)
customers["phone"] = "+91-" + customers["phone"]
customers["registration_date"] = pd.to_datetime(
    customers["registration_date"],
    errors="coerce",
    dayfirst=True
)
customers.dropna(subset=["registration_date"], inplace=True)

# Products
products.drop_duplicates(inplace=True)
products.dropna(subset=["price"], inplace=True)
products["category"] = products["category"].astype(str)
products["category"] = products["category"].str.strip()
products["category"] = products["category"].str.title()
products["stock_quantity"] = products["stock_quantity"].fillna(0).astype(int)

# Sales
sales.drop_duplicates(inplace=True)
sales["transaction_date"] = pd.to_datetime(sales["transaction_date"], errors="coerce")
sales.dropna(subset=["customer_id", "product_id", "transaction_date"], inplace=True)
sales["quantity"] = pd.to_numeric(sales["quantity"], errors="coerce")
sales["unit_price"] = pd.to_numeric(sales["unit_price"], errors="coerce")
sales.dropna(subset=["quantity", "unit_price"], inplace=True)

# LOAD

# Insert customers
insert_customer_query = """
INSERT IGNORE INTO customers
(first_name, last_name, email, phone, city, registration_date)
VALUES (%s, %s, %s, %s, %s, %s)
"""
customers_loaded = 0

for _, row in customers.iterrows():
    try:
        cursor.execute(
            insert_customer_query,
            (
                row["first_name"],
                row["last_name"],
                row["email"],
                row["phone"],
                row["city"],
                row["registration_date"]
            )
        )
        customers_loaded += 1
    except Exception as e:
        print("Customer insert failed:", e)

conn.commit()


# Insert products
insert_product_query = """
INSERT IGNORE INTO products
(product_name, category, price, stock_quantity)
VALUES (%s, %s, %s, %s)
"""

products_loaded = 0

for _, row in products.iterrows():
    try:
        cursor.execute(
            insert_product_query,
            (
                row["product_name"],
                row["category"],
                row["price"],
                row["stock_quantity"]
            )
        )
        products_loaded += 1
    except Exception as e:
        print("Product insert failed:", e)

conn.commit()

# Insert orders
cursor.execute("SELECT customer_id FROM customers ORDER BY customer_id")
db_customer_ids = [row[0] for row in cursor.fetchall()]

insert_order_query = """
INSERT INTO orders (customer_id, order_date, total_amount, status)
VALUES (%s, %s, %s, %s)
"""

orders_loaded = 0
order_ids = []

customer_count = len(db_customer_ids)
customer_index = 0

for _, row in sales.iterrows():
    try:
        db_customer_id = db_customer_ids[customer_index % customer_count]
        customer_index += 1

        total_amount = float(row["quantity"]) * float(row["unit_price"])

        cursor.execute(
            insert_order_query,
            (
                db_customer_id,
                row["transaction_date"].date(),
                total_amount,
                "Completed"
            )
        )

        order_ids.append(cursor.lastrowid)
        orders_loaded += 1

    except Exception as e:
        print("Order insert failed:", e)

conn.commit()
print(f"Orders loaded successfully: {orders_loaded}")

# Insert order items
cursor.execute("SELECT product_id FROM products ORDER BY product_id")
db_product_ids = [row[0] for row in cursor.fetchall()]

insert_order_item_query = """
INSERT INTO order_items
(order_id, product_id, quantity, unit_price, subtotal)
VALUES (%s, %s, %s, %s, %s)
"""
order_items_loaded = 0

product_count = len(db_product_ids)
product_index = 0

for i, (_, row) in enumerate(sales.iterrows()):
    try:
        db_product_id = db_product_ids[product_index % product_count]
        product_index += 1

        quantity = int(row["quantity"])
        unit_price = float(row["unit_price"])
        subtotal = quantity * unit_price

        cursor.execute(
            insert_order_item_query,
            (
                order_ids[i],      # valid order_id
                db_product_id,     # valid product_id
                quantity,
                unit_price,
                subtotal
            )
        )

        order_items_loaded += 1

    except Exception as e:
        print("Order item insert failed:", e)

conn.commit()
print(f"Order items loaded successfully: {order_items_loaded}")
