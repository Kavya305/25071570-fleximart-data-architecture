## Section 1: Schema Overview

### FACT TABLE: fact_sales

Grain:
One row represents one product per order line item.

Business Process:
Sales transactions.

Measures (Numeric Facts):
- quantity_sold: Number of units sold
- unit_price: Price per unit at the time of sale
- discount_amount: Discount applied on the sale
- total_amount: Final amount (quantity × unit_price − discount)

Foreign Keys:
- date_key → dim_date
- product_key → dim_product
- customer_key → dim_customer


### DIMENSION TABLE: dim_date

Purpose:
Date dimension used for time-based analysis.

Type:
Conformed dimension.

Attributes:
- date_key (PK): Surrogate key (integer, format YYYYMMDD)
- full_date: Actual calendar date
- day_of_week: Monday, Tuesday, etc.
- month: Numeric month value (1–12)
- month_name: January, February, etc.
- quarter: Q1, Q2, Q3, Q4
- year: Calendar year (e.g., 2023, 2024)
- is_weekend: Boolean value indicating weekend


### DIMENSION TABLE: dim_product

Purpose:
Stores descriptive information about products.

Type:
Conformed dimension.

Attributes:
- product_key (PK): Surrogate key
- product_id: Business product identifier
- product_name: Name of the product
- category: Product category
- subcategory: Product subcategory
- unit_price: Standard product price


### DIMENSION TABLE: dim_customer

Purpose:
Stores descriptive information about customers.

Type:
Conformed dimension.

Attributes:
- customer_key (PK): Surrogate key
- customer_id: Business customer identifier
- customer_name: Full name of the customer
- city: Customer city
- state: Customer state
- customer_segment: Customer classification (e.g., High, Medium, Low value)


## Section 2: Design Decisions

1.The granularity of the fact table is chosen at the transaction line-item level,
where each row represents a single product sold in an order. This level of
granularity allows flexible analysis such as daily sales, product-wise revenue,
and customer purchase behavior, while still supporting aggregation at higher
levels.

2.Surrogate keys are used instead of natural keys to improve performance and
consistency. Natural keys from source systems may change over time or vary across
systems, whereas surrogate keys remain stable and enable faster joins in analytical
queries.

3.This star schema design supports drill-down and roll-up operations by separating
measures from descriptive attributes. Analysts can roll up sales from daily to
monthly or yearly levels using the date dimension, or drill down from category-level
sales to individual products using the product dimension. This structure simplifies
OLAP queries and improves query performance.

## Section 3: Sample Data Flow

Source Transaction:
Order #101, Customer "John Doe", Product "Laptop", Qty: 2, Price: 50000

Becomes in Data Warehouse:

fact_sales:
{
  date_key: 20240115,
  product_key: 5,
  customer_key: 12,
  quantity_sold: 2,
  unit_price: 50000,
  total_amount: 100000
}

dim_date:
{
  date_key: 20240115,
  full_date: '2024-01-15',
  month: 1,
  quarter: 'Q1'
}

dim_product:
{
  product_key: 5,
  product_name: 'Laptop',
  category: 'Electronics'
}

dim_customer:
{
  customer_key: 12,
  customer_name: 'John Doe',
  city: 'Mumbai'
}
