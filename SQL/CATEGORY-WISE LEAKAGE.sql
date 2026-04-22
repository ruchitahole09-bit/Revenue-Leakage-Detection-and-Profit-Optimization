-- Query 3 — Category-wise Leakage
-- ================================================
-- LEAKAGE 1: CATEGORY-WISE REVENUE LEAKAGE
-- Business Goal: Kaun si category mein sabse zyada paisa ja raha hai?
-- ================================================
SELECT
    Category,
    COUNT(OrderID)                                   AS total_orders,
    ROUND(SUM(max_possible_revenue), 2)              AS max_revenue,
    ROUND(SUM(TotalAmount), 2)                       AS actual_revenue,
    ROUND(SUM(revenue_lost_to_discount), 2)          AS revenue_leaked,
    ROUND(AVG(Discount) * 100, 2)                    AS avg_discount_pct,
    ROUND(
        SUM(revenue_lost_to_discount) /
        SUM(max_possible_revenue) * 100, 2)          AS leakage_pct,
    RANK() OVER (
        ORDER BY SUM(revenue_lost_to_discount) DESC) AS leakage_rank
FROM Sales
GROUP BY Category
ORDER BY revenue_leaked DESC;