# Swiggy Analytics - Power BI DAX Measures Documentation

This document contains the complete set of Data Analysis Expressions (DAX) used to calculate Key Performance Indicators (KPIs), metrics, and visual aggregations for the Swiggy Data Analytics Dashboard.

---

## 1. Key Performance Indicators (KPI Cards)

### Total Sales

Calculates the total gross revenue generated across all orders.

```dax
Total Sales = SUM(fact_orders[price])
```

### Avg Order Value (AOV)

Measures the average revenue generated per completed order.

```dax
Avg Order Value = DIVIDE([Total Sales], [Total Orders], 0)
```

### Total Orders

Calculates the total volume of orders placed across all restaurants.

```dax
Total Orders = COUNTROWS(fact_orders)
```

### Avg Rating

Calculates the average customer rating score across all orders.

```dax
Avg Rating = AVERAGE(fact_orders[rating])
```

### Rating Count

Calculates the total customer review and rating submissions.

```dax
Rating Count = SUM(fact_orders[rating_count])
```

---

## 2. Food Category & Menu Measures

### Veg Sales

Calculates total sales generated exclusively by vegetarian menu items.

```dax
Veg Sales =
CALCULATE(
    [Total Sales],
    dim_dish[category] = "VEG"
)
```

### Non-Veg Sales

Calculates total sales generated exclusively by non-vegetarian menu items.

```dax
Non-Veg Sales =
CALCULATE(
    [Total Sales],
    dim_dish[category] = "NON_VEG"
)
```

### Veg Order Count

Counts the total number of orders placed for vegetarian dishes.

```dax
Veg Order Count =
CALCULATE(
    [Total Orders],
    dim_dish[category] = "VEG"
)
```

### Non-Veg Order Count

Counts the total number of orders placed for non-vegetarian dishes.

```dax
Non-Veg Order Count =
CALCULATE(
    [Total Orders],
    dim_dish[category] = "NON_VEG"
)
```

---

## 3. Time Intelligence & Trend Analysis

### Monthly Sales

Calculates month-to-date sales using the calendar/date dimension.

```dax
Monthly Sales =
CALCULATE(
    [Total Sales],
    DATESMTD(dim_date[order_date_new])
)
```

### Daily Sales

Calculates sales grouped by day of the week while preserving the selected day-name context.

```dax
Daily Sales =
CALCULATE(
    [Total Sales],
    ALLEXCEPT(dim_date, dim_date[day_name])
)
```

---

## 4. Ranking & Top N Analysis

### Restaurant Rank

Ranks restaurants dynamically based on total sales revenue.

```dax
Restaurant Rank =
RANKX(
    ALL(dim_restaurant[restaurant_name]),
    [Total Sales],
    ,
    DESC,
    DENSE
)
```

### Top 5 Restaurant Sales

Calculates total sales for the five restaurants with the highest sales revenue.

```dax
Top 5 Restaurant Sales =
CALCULATE(
    [Total Sales],
    KEEPFILTERS(
        TOPN(
            5,
            ALL(dim_restaurant[restaurant_name]),
            [Total Sales],
            DESC
        )
    )
)
```

---

## 5. Measure Summary

| Measure                  | Purpose                                   |
| ------------------------ | ----------------------------------------- |
| `Total Sales`            | Calculates total revenue                  |
| `Avg Order Value`        | Calculates average revenue per order      |
| `Total Orders`           | Counts total orders                       |
| `Avg Rating`             | Calculates average customer rating        |
| `Rating Count`           | Counts total rating submissions           |
| `Veg Sales`              | Calculates vegetarian-item sales          |
| `Non-Veg Sales`          | Calculates non-vegetarian-item sales      |
| `Veg Order Count`        | Counts vegetarian orders                  |
| `Non-Veg Order Count`    | Counts non-vegetarian orders              |
| `Monthly Sales`          | Calculates month-to-date sales            |
| `Daily Sales`            | Calculates sales by day of week           |
| `Restaurant Rank`        | Ranks restaurants by sales                |
| `Top 5 Restaurant Sales` | Calculates sales for top five restaurants |

---

## 6. Data Model References

The measures in this document use the following tables and columns:

### Fact Table

**`fact_orders`**

* `price`
* `rating`
* `rating_count`

### Dish Dimension

**`dim_dish`**

* `category`

### Date Dimension

**`dim_date`**

* `order_date_new`
* `day_name`

### Restaurant Dimension

**`dim_restaurant`**

* `restaurant_name`

---

## 7. Notes

* Ensure that relationships between `fact_orders` and the dimension tables are correctly configured in the Power BI data model.
* `dim_date[order_date_new]` should be a proper Date/DateTime column for time-intelligence calculations.
* The `DATESMTD()` function requires an appropriate date table and date relationship.
* `RANKX()` dynamically recalculates restaurant rankings according to the current filter context.
* `TOPN()` is used to identify the five restaurants with the highest total sales.
* Measure names should remain consistent with the names referenced by other DAX measures.

---

## 8. Dashboard KPI Measures

The primary KPI cards can use:

1. **Total Sales**
2. **Total Orders**
3. **Avg Order Value**
4. **Avg Rating**
5. **Rating Count**

These measures provide the foundation for the Swiggy Analytics Power BI Dashboard and can be combined with slicers, charts, tables, and geographical visualizations for interactive analysis.



## 1. Key Performance Indicators (KPI Cards)
### Avg Order Value (AOV)
Measures the average revenue generated per completed order across all transactions.
```dax
Avg Order Value = DIVIDE([Total Sales], [Total Orders], 0)

