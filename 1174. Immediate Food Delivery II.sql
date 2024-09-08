WITH FirstOrders AS (
    -- Get the first order (earliest order_date) for each customer
    SELECT delivery_id, customer_id, order_date, customer_pref_delivery_date
    FROM Delivery
    WHERE (customer_id, order_date) IN (
        SELECT customer_id, MIN(order_date)
        FROM Delivery
        GROUP BY customer_id
    )
)
SELECT 
    ROUND(SUM(CASE WHEN order_date = customer_pref_delivery_date THEN 1 ELSE 0 END) 
    / COUNT(*) * 100, 2) AS immediate_percentage
FROM FirstOrders;
