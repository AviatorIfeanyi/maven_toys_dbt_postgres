
with store_location_sales as (
  select * from {{ ref('int_stores_joined_sales') }}
),
stores as (
  select * from {{ ref('stg_maven_toys__stores') }}
)


select store_id, store_name, store_city,
  sl.store_location, sl.store_sales, store_open_date, 
  DATE_PART('year', store_open_date) as store_open_year
from stores as s
left join store_location_sales as sl
using(store_location)