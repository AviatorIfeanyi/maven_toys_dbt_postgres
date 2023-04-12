WITH stores AS (
  SELECT * FROM {{ source('maven_toys', 'stores') }}
)

SELECT 
  store_id, store_name, store_city
  store_location, store_open_date, 
  date_part('year', store_open_date) as store_open_year
FROM stores
