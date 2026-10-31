WITH Quartiles AS (
  SELECT 
    PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY your_column) OVER() AS q1,
    PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY your_column) OVER() AS q3
  FROM your_table
)
SELECT 
  MAX(q3) - MAX(q1) AS iqr
FROM Quartiles;
