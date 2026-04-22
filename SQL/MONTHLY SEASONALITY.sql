-- Query 8 — Monthly Seasonality
-- ================================================
-- PROFIT 3: MONTHLY SEASONALITY ANALYSIS
-- Business Goal: Konse mahine mein sabse zyada bikri hoti hai?
-- ================================================
SELECT
    month_name,
    month,
    COUNT(OrderID)                                   AS total_orders,
    ROUND(SUM(TotalAmount), 2)                       AS total_revenue,
    ROUND(AVG(TotalAmount), 2)                       AS avg_order_value,
    ROUND(SUM(revenue_lost_to_discount), 2)          AS revenue_leaked,
    ROUND(AVG(Discount) * 100, 2)                    AS avg_discount_pct
FROM Sales
GROUP BY month_name, month
ORDER BY month;