-- Create Keyspace
CREATE KEYSPACE IF NOT EXISTS sales_data
WITH replication = {'class': 'SimpleStrategy', 'replication_factor': '1'};

-- Use Keyspace
USE sales_data;

-- Create Bronze Table
CREATE TABLE IF NOT EXISTS bronze_sales (
    region text,
    country text,
    item_type text,
    sales_channel text,
    order_priority text,
    order_date text,
    order_id bigint PRIMARY KEY,
    ship_date text,
    units_sold int,
    unit_price float,
    unit_cost float,
    total_revenue float,
    total_cost float,
    total_profit float
);

-- Create Silver Table
CREATE TABLE IF NOT EXISTS silver_sales (
    country text,
    item_type text,
    sales_channel text,
    total_revenue float,
    total_profit float,
    PRIMARY KEY (country, item_type)
);

-- Create Gold Table: Revenue by Region
CREATE TABLE IF NOT EXISTS gold_revenue_by_region (
    region text PRIMARY KEY,
    total_revenue float
);

-- Create Gold Table: Top Selling Items
CREATE TABLE IF NOT EXISTS gold_top_selling_items (
    item_type text PRIMARY KEY,
    total_units_sold int
);

-- Create Gold Table: High Priority Orders
CREATE TABLE IF NOT EXISTS gold_high_priority_orders (
    order_id bigint PRIMARY KEY,
    order_priority text,
    total_profit float
);

-- Query to Retrieve Data for Verification

-- Bronze Table
SELECT * FROM bronze_sales LIMIT 10;

-- Silver Table
SELECT * FROM silver_sales;

-- Gold Table: Revenue by Region
SELECT * FROM gold_revenue_by_region;

-- Gold Table: Top Selling Items
SELECT * FROM gold_top_selling_items;

-- Gold Table: High Priority Orders
SELECT * FROM gold_high_priority_orders;
