-- Query 1 — Master KPI Summary
-- ================================================
-- KPI 1: MASTER REVENUE SUMMARY
-- Business Goal: Ek nazar mein poora business
-- ================================================
SELECT
    COUNT(DISTINCT OrderID)                          AS Total_Orders,
    COUNT(DISTINCT CustomerID)                       AS Total_Customers,
    ROUND(SUM(TotalAmount), 2)                       AS Total_Revenue,
    ROUND(AVG(TotalAmount), 2)                       AS Avg_Order_Value,
    ROUND(SUM(max_possible_revenue), 2)              AS Max_Possible_Revenue,
    ROUND(SUM(revenue_lost_to_discount), 2)          AS Total_Revenue_Leaked,
    ROUND(
        SUM(revenue_lost_to_discount) /
        SUM(max_possible_revenue) * 100, 2)          AS Leakage_Pct,
    ROUND(AVG(revenue_efficiency) * 100, 2)          AS Avg_Revenue_Efficiency_Pct,
    SUM(is_high_discount)                            AS High_Discount_Orders,
    SUM(is_lost_order)                               AS Cancelled_Returned_Orders
FROM Sales;