-- Query 9 — Brand Performance
-- ================================================
-- PROFIT 4: TOP & BOTTOM BRAND ANALYSIS
-- Business Goal: Kaun se brands star hain, kaun underperform kar rahe hain?
-- ================================================
SELECT
    Brand,
    Category,
    COUNT(OrderID)                                   AS total_orders,
    ROUND(SUM(TotalAmount), 2)                       AS total_revenue,
    ROUND(AVG(UnitPrice), 2)                         AS avg_price,
    ROUND(AVG(Discount) * 100, 2)                    AS avg_discount_pct,
    ROUND(SUM(revenue_lost_to_discount), 2)          AS revenue_leaked,
    ROUND(AVG(revenue_efficiency) * 100, 2)          AS efficiency_pct,
    SUM(is_lost_order)                               AS lost_orders
FROM Sales
GROUP BY Brand, Category
ORDER BY total_revenue DESC
LIMIT 20;