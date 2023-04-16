with sales as (
  select * from {{ ref('stg_maven_toys__sales') }}
)

select sale_id, store_id, product_id, units, 
  date, sales_year
from sales
