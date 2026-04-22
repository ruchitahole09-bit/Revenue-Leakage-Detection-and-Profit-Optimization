-- Query 5 — Cancelled & Returned Orders
-- ================================================
-- LEAKAGE 3: CANCELLED & RETURNED ORDER ANALYSIS
-- Business Goal: Kitna revenue cancel hone se gaya?
-- ================================================
SELECT
    OrderStatus,
    Category,
    COUNT(OrderID)                                   AS total_orders,
    ROUND(SUM(TotalAmount), 2)                       AS lost_revenue,
    ROUND(AVG(TotalAmount), 2)                       AS avg_order_value,
    ROUND(
        COUNT(OrderID) /
        SUM(COUNT(OrderID)) OVER () * 100, 2)        AS pct_of_lost_orders
FROM Sales
WHERE is_lost_order = 1
GROUP BY OrderStatus, Category
ORDER BY lost_revenue DESC;