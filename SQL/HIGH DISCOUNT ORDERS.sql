-- Query 4 — High Discount Orders
-- ================================================
-- LEAKAGE 2: HIGH DISCOUNT ORDER ANALYSIS
-- Business Goal: 20% se zyada discount = Revenue Chor!
-- ================================================
SELECT
    Category,
    Brand,
    COUNT(OrderID)                                   AS high_disc_orders,
    ROUND(AVG(Discount) * 100, 2)                    AS avg_discount_pct,
    ROUND(MAX(Discount) * 100, 2)                    AS max_discount_pct,
    ROUND(SUM(revenue_lost_to_discount), 2)          AS revenue_leaked,
    ROUND(AVG(UnitPrice), 2)                         AS avg_unit_price,
    ROUND(SUM(TotalAmount), 2)                       AS actual_revenue
FROM Sales
WHERE is_high_discount = 1
GROUP BY Category, Brand
ORDER BY revenue_leaked DESC
LIMIT 15;