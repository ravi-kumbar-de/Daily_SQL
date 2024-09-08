WITH RankedOrders AS (
    -- Rank orders for each customer based on order_date to get the first order
    SELECT 
        *,
        ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date) AS order_rank
    FROM Delivery
)
SELECT 
    ROUND(SUM(CASE WHEN order_date = customer_pref_delivery_date AND order_rank = 1 THEN 1 ELSE 0 END)
    / COUNT(*) * 100, 2) AS immediate_percentage
FROM RankedOrders
WHERE order_rank = 1;
