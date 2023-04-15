WITH stores AS (
  SELECT * FROM {{ source('maven_toys', 'stores') }}
)

SELECT 
  store_id, store_name, store_city,
  store_location, store_open_date, 
  DATE_PART('year', store_open_date) AS store_open_year
FROM stores
