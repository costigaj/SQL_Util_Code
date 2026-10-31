SELECT 
    order_id,
    customer_id,
    order_date,
    ship_date,
    quantity,
    unit_price,
    total_amount,
    CASE WHEN order_date > GETDATE() THEN 'Future order date' END AS date_error,
    CASE WHEN ship_date < order_date THEN 'Ship before order' END AS logic_error,
    CASE WHEN quantity <= 0 THEN 'Invalid quantity' END AS quantity_error,
    CASE WHEN unit_price <= 0 THEN 'Invalid price' END AS price_error,
    CASE WHEN ABS(quantity * unit_price - total_amount) > 0.01 THEN 'Calculation mismatch' END AS calc_error,
    CASE WHEN email NOT LIKE '%_@__%.__%' THEN 'Invalid email format' END AS email_error
FROM orders
WHERE 
    order_date > GETDATE()
    OR ship_date < order_date
    OR quantity <= 0
    OR unit_price <= 0
    OR ABS(quantity * unit_price - total_amount) > 0.01
    OR email NOT LIKE '%_@__%.__%';
