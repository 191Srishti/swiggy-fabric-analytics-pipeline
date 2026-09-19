# Swiggy End-to-End Data Analytics Pipeline (Microsoft Fabric)

## Overview
This repository contains the architecture, SQL DDL scripts, and data pipeline definitions for an end-to-end data analytics project built on **Microsoft Fabric**. The solution ingests operational food delivery datasets, cleans and structures them into a dimensional Data Warehouse (Star Schema), and serves analytical insights via Power BI.

---

## Workspace Architecture
The project follows a Medallion-inspired analytics architecture within Microsoft Fabric:

`Raw Data (Lakehouse: swiggy_lh)` ➔ `Data Pipeline (Pipeline_lh_to_wh)` ➔ `Data Warehouse (swiggy_wh)` ➔ `Semantic Model` ➔ `Power BI Report`

### Key Workspace Artifacts
- **Lakehouse (`swiggy_lh`)**: Ingestion layer storing raw operational datasets and Delta tables[cite: 1].
- **Data Pipeline (`Pipeline_lh_to_wh`)**: Automated orchestration pipeline executing transformations and staging data into the warehouse[cite: 1].
- **Data Warehouse (`swiggy_wh`)**: Dimensional model (Star Schema) utilizing Clustered Columnstore Indexes for high-performance T-SQL querying[cite: 1, 3].
- **Power BI Report (`Swiggy_report`) & Semantic Model**: Interactive analytics dashboard measuring revenue trends, delivery performance, and dish popularity[cite: 1].

---

## Database Schema (Star Schema)

The warehouse features 1 central Fact table and 4 Dimension tables:

- **`swiggy_project.fact_orders`**: Granular transaction records including `price`, `rating`, and key foreign keys[cite: 3].
- **`swiggy_project.dim_restaurant`**: Restaurant details and vendor metadata[cite: 2, 3].
- **`swiggy_project.dim_dish`**: Menu item categories and dish names[cite: 2, 3].
- **`swiggy_project.dim_location`**: Geographic hierarchy (`city`, `state`, `location`)[cite: 2, 3].
- **`swiggy_project.dim_date`**: Calendar dimension supporting time-intelligence analysis[cite: 2, 3].

> The full SQL DDL script is available in [`SQL/02_warehouse_star_schema.sql`](./SQL/02_warehouse_star_schema.sql)[cite: 3].

---

## Tech Stack & Tools Used
- **Cloud Analytics Platform**: Microsoft Fabric[cite: 1]
- **Storage & Compute**: Synapse Data Warehouse, Lakehouse (Delta Lake / SQL Analytics Endpoint)[cite: 1]
- **Language & Querying**: T-SQL, DAX
- **Data Modeling & Visualization**: Power BI[cite: 1]
- **Version Control**: Git & GitHub