import pandas as pd
import mysql.connector
from datetime import datetime


# conn = mysql.connector.connect(
#     host="localhost",
#     user="root",
#     password="your_password",
#     database="fleximart"
# )
# cursor = conn.cursor()


customers = pd.read_csv("data/customers_raw.csv")
products = pd.read_csv("data/products_raw.csv")
sales = pd.read_csv("data/sales_raw.csv")

# Customers
customers.drop_duplicates(inplace=True)
customers.dropna(subset=["email"], inplace=True)

# customers["phone"] = customers["phone"].str.replace(r"\D", "", regex=True)
# customers["phone"] = "+91-" + customers["phone"]

# # Products
# products.drop_duplicates(inplace=True)
# products.dropna(subset=["price"], inplace=True)
# products["stock_quantity"].fillna(0, inplace=True)
# products["category"] = products["category"].str.title()

# # Sales
# sales.drop_duplicates(inplace=True)
# sales["order_date"] = pd.to_datetime(sales["order_date"], errors="coerce")
# sales.dropna(subset=["customer_id", "product_id", "order_date"], inplace=True)

# # ------------------ LOAD ------------------
# # (We will insert step-by-step in next message)
