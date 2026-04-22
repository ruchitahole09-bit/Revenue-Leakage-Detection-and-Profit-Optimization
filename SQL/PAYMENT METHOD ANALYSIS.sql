-- Query 7 — Payment Method Analysis
-- ================================================
-- PROFIT 2: PAYMENT METHOD vs REVENUE
-- Business Goal: Kaun sa payment method best customers lata hai?
-- ================================================
SELECT
    PaymentMethod,
    COUNT(OrderID)                                   AS total_orders,
    ROUND(SUM(TotalAmount), 2)                       AS total_revenue,
    ROUND(AVG(TotalAmount), 2)                       AS avg_order_value,
    ROUND(AVG(Discount) * 100, 2)                    AS avg_discount_pct,
    SUM(is_lost_order)                               AS cancelled_orders,
    ROUND(
        SUM(is_lost_order) /
        COUNT(OrderID) * 100, 2)                     AS cancellation_rate_pct
FROM Sales
GROUP BY PaymentMethod
ORDER BY total_revenue DESC;