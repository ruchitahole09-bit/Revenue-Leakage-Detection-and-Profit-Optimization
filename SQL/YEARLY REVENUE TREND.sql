-- Query 2 — Yearly Revenue Trend
-- ================================================
-- KPI 2: YEAR-WISE REVENUE TREND (2020-2024)
-- Business Goal: Kya business grow kar raha hai?
-- ================================================
SELECT
    year,
    COUNT(OrderID)                                   AS Total_Orders,
    ROUND(SUM(TotalAmount), 2)                       AS Total_Revenue,
    ROUND(SUM(revenue_lost_to_discount), 2)          AS Revenue_Leaked,
    ROUND(AVG(Discount) * 100, 2)                    AS Avg_Discount_Pct,
    ROUND(SUM(TotalAmount) - LAG(SUM(TotalAmount))
        OVER (ORDER BY year), 2)                     AS Revenue_Growth,
    ROUND(
        (SUM(TotalAmount) - LAG(SUM(TotalAmount))
        OVER (ORDER BY year)) /
        LAG(SUM(TotalAmount))
        OVER (ORDER BY year) * 100, 2)               AS Growth_Pct
FROM Sales
GROUP BY year
ORDER BY year;