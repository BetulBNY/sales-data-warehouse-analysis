# Sales Data Warehouse Analysis

## Overview
This project is an **Exploratory Data Analysis (EDA)** of a Sales Data Warehouse, focusing on the **Gold layer** of the warehouse. It aims to analyze customer, product, and sales data to uncover insights on sales patterns, product performance, and customer behavior.

---

## Project Structure

| File Name                        | Description                                                      |
|---------------------------------|------------------------------------------------------------------|
| `1-database-exploration.sql`     | Initial exploration of database tables and structure.            |
| `2-dimensions-exploration.sql`   | Analysis of dimension tables such as customers and products.     |
| `3-date-range-exploration.sql`   | Analysis of order dates, durations, and trends over time.       |
| `4-measures-exploration.sql`     | Exploration of numeric measures like sales amount and quantity. |
| `5-magnitude-analysis.sql`       | Analysis of magnitude of sales by category or product.          |
| `6-ranking-analysis.sql`         | Ranking products, categories, or customers based on performance.|

---

## Data

- **Database Layer:** Gold layer of the Sales Data Warehouse  
- **Fact Table:** `fact_sales` – transactional sales data  
- **Dimension Tables:** `dim_customers`, `dim_products`  

---

## Key Analyses Performed

1. **Database Structure Exploration:** Understanding tables, keys, and relationships.  
2. **Dimension Analysis:** Customer demographics, product categories, and subcategories.  
3. **Date Range Analysis:** First and last order dates, total duration, and trends over time.  
4. **Measures Analysis:** Total sales, quantity, and average prices.  
5. **Magnitude & Ranking Analysis:** Top-selling products, revenue by category, and ranking insights.  

---

## Usage

1. Clone the repository:
```bash
git clone https://github.com/BetulBNY/sales-data-warehouse-analysis.git