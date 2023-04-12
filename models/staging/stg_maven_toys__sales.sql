WITH sales AS (
  SELECT * FROM {{ source('maven_toys', 'sales') }}
)

SELECT 
  sale_id, store_id, product_id, units, 
  date, date_part('year', date) as sales_year
FROM sales
