WITH inventory AS (
  SELECT * FROM {{ source('maven_toys', 'inventory') }}
)

SELECT inventory_id, store_id, product_id, stock_on_hand as stock
FROM inventory