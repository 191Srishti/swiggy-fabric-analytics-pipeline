# Swiggy Analytics - Power BI DAX Measures Documentation

This document contains the Data Analysis Expressions (DAX) used to calculate Key Performance Indicators (KPIs), metrics, and visual aggregations for the Swiggy Data Analytics Dashboard[cite: 1].

---

## 1. Key Performance Indicators (KPI Cards)

### Total Sales
Calculates total gross revenue generated from all completed orders.
```dax
Total Sales = SUM(fact_orders[price])
Avg Order Value = DIVIDE([Total Sales], [Total Orders], 0)
Total Orders = COUNTROWS(fact_orders)
Avg Rating = AVERAGE(fact_orders[rating])
Rating Count = SUM(fact_orders[rating_count])
Veg Sales = 
CALCULATE(
    [Total Sales],
    dim_dish[category] = "VEG"
)
Non-Veg Sales = 
CALCULATE(
    [Total Sales],
    dim_dish[category] = "NON_VEG"
)
