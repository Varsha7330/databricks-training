
# SQL to PySpark – Phase 3 Final ETL & Pipeline

## Overview

This project is part of the SQL to PySpark training program. The objective is to understand the ETL (Extract, Transform, Load) workflow using PySpark and Spark Playground sample datasets.

## Objectives

- Read data from CSV, JSON, and Parquet files
- Inspect dataset schema
- Handle missing values
- Filter invalid records
- Perform data transformations
- Build simple ETL pipelines
- Convert SQL queries into equivalent PySpark DataFrame operations

## Technologies Used

- Python
- PySpark
- Apache Spark
- Spark Playground

## Sample Datasets

The project uses the following sample datasets available in Spark Playground:

- customers.csv
- sales.csv
- products.json
- titanic.parquet

## Hands-on Tasks

- Read CSV files
- Display data using `show()`
- Inspect schema using `printSchema()`
- Identify missing values
- Remove missing values using `dropna()`
- Fill missing values using `fillna()`
- Filter valid records
- Read JSON and Parquet files

## Business Pipeline Exercises

1. Calculate daily sales
2. Calculate city-wise revenue
3. Find repeat customers
4. Find the highest spending customer in each city
5. Build a final reporting table with:
   - Customer ID
   - Customer Name
   - City
   - Total Spend
   - Order Count

## ETL Workflow

```
Extract
│
├── Read CSV Files
├── Read JSON Files
└── Read Parquet Files
        │
        ▼
Transform
│
├── Clean Missing Values
├── Filter Invalid Records
├── Join DataFrames
├── Aggregate Data
└── Calculate Business Metrics
        │
        ▼
Load
│
├── Display Results
└── Generate Reporting Tables
```

## SQL to PySpark Mapping

| SQL | PySpark |
|------|----------|
| SELECT | select() |
| WHERE | filter() |
| GROUP BY | groupBy() |
| SUM() | sum() |
| AVG() | avg() |
| COUNT() | count() |
| ORDER BY | orderBy() |
| JOIN | join() |
| HAVING | filter() after aggregation |

## Learning Outcomes

After completing this project, I learned to:

- Create and configure a Spark Session
- Read different file formats
- Perform data cleaning
- Handle missing values
- Apply filters
- Join multiple DataFrames
- Perform aggregations
- Build simple ETL pipelines
- Convert SQL queries into PySpark code

