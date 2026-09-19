# 🚴 Swiggy End-to-End Data Analytics Pipeline (Microsoft Fabric)

An end-to-end cloud data engineering and business intelligence solution built using **Microsoft Fabric**. This repository showcases the transformation of raw food delivery operational data into an optimized **Star Schema Data Warehouse** to power interactive analytics and executive dashboards.

---

## 🏗️ Project Architecture

```text
  [ Raw Data Ingestion ]
           │
           ▼
┌──────────────────────┐
│     Lakehouse        │  (swiggy_lh)
└──────────┬───────────┘
           │
           ▼  Data Pipeline (Pipeline_lh_to_wh)
┌──────────────────────┐
│    Data Warehouse    │  (swiggy_wh)
│     (Star Schema)    │
└──────────┬───────────┘
           │
           ▼  DirectLake / Import
┌──────────────────────┐
│    Semantic Model    │  (swiggy power bi semantic model)
└──────────┬───────────┘
           │
           ▼
┌──────────────────────┐
│   Power BI Report    │  (Swiggy_report)
└──────────────────────┘
```

---

## ⚙️ Tech Stack & Workspace Components

| Layer | Component Name | Description |
| :--- | :--- | :--- |
| **Ingestion Layer** | `swiggy_lh` (Lakehouse) | Stores raw JSON/CSV operational data extracted from Swiggy delivery logs. |
| **Orchestration** | `Pipeline_lh_to_wh` | Automated data pipeline managing ETL/ELT transformations and loading data into warehouse tables. |
| **Storage & Serving** | `swiggy_wh` (Warehouse) | Synapse Data Warehouse hosting dimensional Star Schema tables with clustered columnstore indexes. |
| **Semantic Layer** | `swiggy power bi semantic model` | Business logic, explicit DAX measures, and relationship management. |
| **Visualization** | `Swiggy_report` | Interactive Power BI multi-page dashboard highlighting sales KPIs, restaurant performance, and delivery metrics. |

---

## 📊 Data Warehouse Design (Star Schema)

The analytical data warehouse is structured using a classic **Star Schema** to optimize query performance and simplify DAX metrics:

### **Fact Table**
- `swiggy_project.fact_orders`: Captures individual transaction details, prices, user ratings, and key dimensional keys (`date_id`, `location_id`, `restaurant_id`, `food_id`).

### **Dimension Tables**
- `swiggy_project.dim_restaurant`: Restaurant metadata, names, and identifiers.
- `swiggy_project.dim_location`: Geographic attributes including City, State, and Location details.
- `swiggy_project.dim_dish`: Menu food items and item category hierarchy.
- `swiggy_project.dim_date`: Calendar lookup table enabling time-intelligence analysis (`order_date_new`).

> **Note:** Full SQL Data Definition Language (DDL) scripts are saved in [`SQL/02_warehouse_star_schema.sql`](./SQL/02_warehouse_star_schema.sql).

---

## 🧮 Key DAX Measures

Below are core business logic measures configured within the semantic model:

### 1. Total Revenue
```dax
Total Revenue = SUM(fact_orders[price])
```

### 2. Total Orders
```dax
Total Orders = COUNT(fact_orders[order_id])
```

### 3. Average Order Value (AOV)
```dax
Average Order Value = DIVIDE([Total Revenue], [Total Orders], 0)
```

### 4. Average Customer Rating
```dax
Avg Rating = AVERAGE(fact_orders[rating])
```

---

## 📁 Repository Structure

```text
.
├── SQL/
│   └── 02_warehouse_star_schema.sql    # Warehouse DDL for Fact and Dimension tables
├── pipelines/
│   └── Pipeline_lh_to_wh.json           # Pipeline definitions and execution flow
├── powerbi/
│   ├── dax_measures.md                 # Full documentation of calculated DAX measures
│   └── Swiggy_report.pbix              # Power BI report file (or .pbip project folder)
├── images/
│   ├── architecture_diagram.png        # Pipeline flow visual
│   └── dashboard_preview.png           # Power BI dashboard screenshots
├── .gitignore
└── README.md                           # Project documentation
```

---

## 🚀 How to Replicate

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/191Srishti/swiggy-fabric-analytics-pipeline.git
   ```

2. **Database Setup:**
   - Execute the SQL script in [`SQL/02_warehouse_star_schema.sql`](./SQL/02_warehouse_star_schema.sql) in your Microsoft Fabric Warehouse or Azure SQL DB query editor.

3. **Power BI / Semantic Model:**
   - Connect Power BI Desktop to your Fabric Warehouse SQL endpoint using Microsoft Entra ID.
   - Import the data or connect via DirectLake mode, apply DAX measures, and publish to your Fabric workspace.

---

## 👤 Author
- **GitHub:** [@191Srishti](https://github.com/191Srishti)