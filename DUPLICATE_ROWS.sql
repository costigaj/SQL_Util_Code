-- CTE Method
WITH ranked_records AS (
    SELECT 
        *,
        ROW_NUMBER() OVER (
            PARTITION BY customer_id, email 
            ORDER BY created_date DESC
        ) AS row_num
    FROM customers
)
SELECT *
FROM ranked_records
WHERE row_num = 1;
