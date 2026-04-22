-- Query 10 — Seller Performance 
-- ================================================
-- PROFIT 5: SELLER PERFORMANCE SCORECARD
-- Business Goal: Kaun sa seller sabse zyada discount de raha hai?
-- ================================================
SELECT
    SellerID,
    COUNT(OrderID)                                   AS total_orders,
    ROUND(SUM(TotalAmount), 2)                       AS total_revenue,
    ROUND(AVG(Discount) * 100, 2)                    AS avg_discount_pct,
    ROUND(SUM(revenue_lost_to_discount), 2)          AS revenue_leaked,
    SUM(is_high_discount)                            AS high_disc_orders,
    SUM(is_lost_order)                               AS lost_orders,
    ROUND(
        SUM(is_high_discount) /
        COUNT(OrderID) * 100, 2)                     AS high_disc_rate_pct
FROM Sales
GROUP BY SellerID
ORDER BY revenue_leaked DESC
LIMIT 15;