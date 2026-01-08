# 25071570-fleximart-data-architecture

# FlexiMart Data Architecture Project

**Student Name:** Kavya Singal
**Student ID:** 25071570
**Email:** kavya.singal30@gmail.com
**Date:** 26-12-2025

## Project Overview

This project involved building an end-to-end data architecture for an e-commerce platform called FlexiMart.
It included designing an ETL pipeline to load transactional data into a relational database, implementing a
NoSQL product catalog using MongoDB, and creating a data warehouse with a star schema for analytical reporting.


## Repository Structure
├── part1-database-etl/
│   ├── etl_pipeline.py
│   ├── schema_documentation.md
│   ├── business_queries.sql
│   └── data_quality_report.txt
├── part2-nosql/
│   ├── nosql_analysis.md
│   ├── mongodb_operations.js
│   └── products_catalog.json
├── part3-datawarehouse/
│   ├── star_schema_design.md
│   ├── warehouse_schema.sql
│   ├── warehouse_data.sql
│   └── analytics_queries.sql
└── README.md

## Technologies Used

- Python 3.x, pandas, mysql-connector-python
- MySQL 8.0 / PostgreSQL 14
- MongoDB 6.0

## Setup Instructions

### Database Setup

```bash
# Create databases
mysql -u root -p -e "CREATE DATABASE fleximart;"
mysql -u root -p -e "CREATE DATABASE fleximart_dw;"

# Run Part 1 - ETL Pipeline
python part1-database-etl/etl_pipeline.py

# Run Part 1 - Business Queries
mysql -u root -p fleximart < part1-database-etl/business_queries.sql

# Run Part 3 - Data Warehouse
mysql -u root -p fleximart_dw < part3-datawarehouse/warehouse_schema.sql
mysql -u root -p fleximart_dw < part3-datawarehouse/warehouse_data.sql
mysql -u root -p fleximart_dw < part3-datawarehouse/analytics_queries.sql


### MongoDB Setup

mongosh < part2-nosql/mongodb_operations.js

## Key Learnings

This project helped me understand how different data architectures serve different business needs.
I learned how to design and implement an ETL pipeline for structured data, use MongoDB for flexible
product catalogs, and design a star schema for analytical reporting. I also gained practical
experience writing OLAP queries for business decision-making.

## Challenges Faced

1. One major challenge was handling inconsistent and messy data during the ETL process.
   This was resolved by applying data cleaning techniques such as removing duplicates,
   standardizing date formats, and validating foreign key relationships.

2. Another challenge was designing the data warehouse to meet analytical requirements while
   maintaining data correctness. This was addressed by carefully defining the grain of the
   fact table and using dimension tables with surrogate keys.

