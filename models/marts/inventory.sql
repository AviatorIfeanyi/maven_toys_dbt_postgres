with inventory as (
  select * from {{ ref('stg_maven_toys__inventory')}}
)

select store_id, product_id, stock
from inventory