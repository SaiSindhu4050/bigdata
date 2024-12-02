# Big Data Tools and Techniques - Cassandra Medallion Architecture

## Overview

This project demonstrates the implementation of a Medallion Architecture using
Python and Cassandra. It involves processing a sample sales dataset and
organizing it into three tiers:

1. **Bronze**: Raw data ingestion.
2. **Silver**: Transformed and aggregated data.
3. **Gold**: Optimized data for specific analytical use cases.

## Steps

### 1. Setup

- Install [Docker](https://www.docker.com/) and run a Cassandra container:

```bash
  docker run --name my-cassandra -d -p 9042:9042 cassandra:latest
```

- Install necessary Python libraries:

  ```bash
  pip install cassandra-driver pandas
  ```

### 2. Project Files

- **Python Script**: Automates data ingestion and processing.
- **SQL Queries**: For querying tables and validating outputs.
- **Screenshots**: Displays data from Gold tables.

### 3. Architecture

- **Bronze Table (`bronze_sales`)**: Raw data from the CSV file.
- **Silver Table (`silver_sales`)**: Aggregated sales data grouped by country
  and item type.
- **Gold Tables**:
  - `gold_revenue_by_region`: Total revenue by region.
  - `gold_top_selling_items`: Top-selling items by units sold.
  - `gold_high_priority_orders`: High-priority orders with corresponding
    profits.

### 4. Dataset

The dataset contains information on sales transactions, including:

- Region, Country, Item Type, Sales Channel, Order Priority, Order Date, Ship
  Date.
- Metrics like Units Sold, Unit Price, Unit Cost, Total Revenue, Total Cost, and
  Total Profit.

### 5. How to Run

#### a. Python Automation

1. Load the dataset:

   - Save the CSV file as `sales_100.csv` in the project directory.

2. Run the notebbok:

   ```bash
   jupyter notebook notebook.ipynb
   ```

#### b. Query Cassandra Tables

1. Access the Cassandra container:

   ```bash
   docker exec -it my-cassandra cqlsh
   ```

2. Run SQL queries from the `queries.cql` file or use the following directly:

   ```sql
   USE sales_data;

   -- Bronze Table
   SELECT * FROM bronze_sales LIMIT 10;

   -- Silver Table
   SELECT * FROM silver_sales;

   -- Gold Tables
   SELECT * FROM gold_revenue_by_region;
   SELECT * FROM gold_top_selling_items;
   SELECT * FROM gold_high_priority_orders;
   ```

### 6. Output

- Screenshots of Gold tables:
  - `gold_revenue_by_region`
  - `gold_top_selling_items`
  - `gold_high_priority_orders`
- Screenshots of Silver Table:
  - `silver_sales`
- Screenshots of Bronze Table:
  - `bronze_sales`
