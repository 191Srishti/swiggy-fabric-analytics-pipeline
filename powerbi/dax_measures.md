# Swiggy Analytics - Power BI DAX Measures Documentation

This document contains the complete set of Data Analysis Expressions (DAX) used to calculate Key Performance Indicators (KPIs), metrics, and visual aggregations for the Swiggy Data Analytics Dashboard.

---

## 1. Key Performance Indicators (KPI Cards)

### Total Sales
Calculates total gross revenue generated across all orders.
```dax
Total Sales = SUM(fact_orders[price])

### Avg Order Value (AOV)
Measures the average revenue generated per completed order across all transactions.
```dax
Avg Order Value = DIVIDE([Total Sales], [Total Orders], 0)

