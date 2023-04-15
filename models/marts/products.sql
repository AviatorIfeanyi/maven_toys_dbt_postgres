
with products_aggregated as (
  select * from {{ ref('int_products_aggregated') }}
),
products as (
  select * from {{ ref('stg_maven_toys_products') }}
),
product_sales as (
  select * from {{ ref('int_products_joined_sales') }}
)

select product_id, ps.product_category as product_category,
  pa.category_count as category_count,
  product_category_cost,product_category_price, profit
from product_sales as ps
left join products
using(product_category)
left join products_aggregated as pa
using (product_category)
order by profit