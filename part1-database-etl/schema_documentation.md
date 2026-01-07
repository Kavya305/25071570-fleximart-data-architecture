Entity–Relationship Description

ENTITY: customers
Purpose: Stores customer information for FlexiMart users.
Attributes:
customer_id (PK): Unique auto-increment identifier for each customer
first_name: Customer’s first name
last_name: Customer’s last name
email: Unique email address used for communication
phone: Contact number in standardized format
city: Customer’s city
registration_date: Date when customer registered
Relationships:
One customer can place many orders (1:M relationship with orders)

