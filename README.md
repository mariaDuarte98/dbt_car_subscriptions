# Car Subscriptions Data Transformation (DBT + DuckDB)

## 1. Overview and Objectives

This project focuses on **Transformation** part of ELT cycle, using **dbt Core** and a **DuckDB** file database (`car_subscriptions.duckdb`) to transform raw car subscription data into an analytical-ready **Star Schema**.

The final data model is structured across three layers (Staging, Intermediate, Marts) to support complex analytical queries in the following business domains:

* **Customer Acquisition domain use-cases:** 
    - Analyze the active customer type share (e.g., B2B and B2C) per car brand, on a monthly basis
    - Customer type distribution per terms

* **Operations domain use-cases:** 
    - Calculate the estimated volume of cars infleeted and defleeted per day
    - Determine the city that had the greatest absolute increase in car deliveries from one week to the following

---

## 2. Project Architecture and Data Model

The project ensures a clear separation of concerns across three layers:

- Staging Layer:
This layer focuses on cleaning, type casting, and preparing raw data from the source.

- Intermediate Layer:
This layer is responsible for combining the staging data and implementing core business logic.

- Marts Layer:
This is the final **Star Schema**, optimized for analytical consumption.

    
### Data Quality and Testing

All models are fully validated using **dbt's generic tests** and the external packages **`dbt-utils`** and **`dbt-expectations`**.

The relies exclusively on Generic and Expression Tests defined in `schema.yml`.

---

## 3. Setup and Execution Instructions

The project uses a file-based database (DuckDB) and Python dependencies.

### 3.1. Prerequisites

You must have **Python 3.11** and the **DuckDB CLI** installed on your system.

Note: The CLI is not required to run the dbt commands, but it is essential for direct data exploration and debugging of the car_subscriptions.duckdb file

### 3.2. Project Setup 

Ensure your **`profiles.yml`** file is configured to connect to the local **DuckDB** file (`car_subscriptions.duckdb`).

Follow these steps to set up the environment and download external dependencies.

```bash
# 1. Create and activate a Python virtual environment (recommended)
python3 -m venv env
source env/bin/activate

# 2. Install dbt-core and the DuckDB adapter
pip install -r requirements.txt

# 3. Install external dbt packages (dbt-utils, dbt-expectations) from packages.yml
dbt deps

```

### 3.3. Building and Testing the Pipeline

```bash
# 1. Run the full transformation pipeline (Staging -> Intermediate -> Marts)
dbt run

# 2. Executes tests
dbt test
```

### 3.4.  Viewing the Model in dbt Docs

```bash
# 1. Compile the project
dbt docs generate

# 2. Lauch the web server
dbt docs serve
```