
with stores_joined_sales as (
  select * from {{ ref('int_stores_joined_sales') }}
),
stores as (
  select * from {{ ref('stg_maven_toys__stores') }}
)


select store_id, store_name, store_city,
  sjs.store_location, sjs.store_sales, 
  store_open_date, store_open_year
from stores as s
join stores_joined_sales as sjs
using(store_location)
