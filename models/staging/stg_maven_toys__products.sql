WITH products AS (
  SELECT * FROM {{ source('maven_toys', 'products') }}
)

SELECT 
  product_id, product_name, product_category, 
  product_price, product_cost
FROM products
