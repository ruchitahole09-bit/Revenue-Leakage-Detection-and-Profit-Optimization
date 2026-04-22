-- Query 6 — Country-wise Performance
-- ================================================
-- PROFIT 1: COUNTRY-WISE REVENUE & LEAKAGE
-- Business Goal: Kaun sa country profitable hai?
-- ================================================
SELECT
    Country,
    COUNT(OrderID)                                   AS total_orders,
    ROUND(SUM(TotalAmount), 2)                       AS total_revenue,
    ROUND(SUM(revenue_lost_to_discount), 2)          AS revenue_leaked,
    ROUND(AVG(Discount) * 100, 2)                    AS avg_discount_pct,
    ROUND(AVG(revenue_efficiency) * 100, 2)          AS efficiency_pct,
    ROUND(SUM(ShippingCost), 2)                      AS total_shipping_cost,
    RANK() OVER (
        ORDER BY SUM(TotalAmount) DESC)              AS revenue_rank
FROM Sales
GROUP BY Country
ORDER BY total_revenue DESC
LIMIT 15;