Markdown
# Swiggy Analytics - Power BI DAX Measures Documentation

## 1. Key Performance Indicators (KPI Cards)

### Total Sales
Calculates total gross revenue generated from all completed orders.
```dax
Total Sales = SUM(fact_orders[price])
Avg Order Value (AOV)
Measures average revenue per completed transaction.

### Average Order
Avg Order Value = DIVIDE([Total Sales], [Total Orders], 0)
Total Orders
Calculates the total volume of orders placed across all restaurants.

### Total Order
Total Orders = COUNTROWS(fact_orders)
Avg Rating
Calculates average customer rating score across orders.

### Average Rating
Avg Rating = AVERAGE(fact_orders[rating])
Rating Count
Calculates total customer review and rating submissions.

### Rating Count
Rating Count = SUM(fact_orders[rating_count])

### Categorical & Segmentation Measures
### Veg Sales

Calculates total sales generated exclusively by vegetarian menu items.

Veg Sales = 
CALCULATE(
    [Total Sales],
    dim_dish[category] = "VEG"
)
Non-Veg Sales

Calculates total sales generated exclusively by non-vegetarian menu items.

Code snippet
Non-Veg Sales = 
CALCULATE(
    [Total Sales],
    dim_dish[category] = "NON_VEG"
)

---

