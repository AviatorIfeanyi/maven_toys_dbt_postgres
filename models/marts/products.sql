
with products as (
  select * from {{ ref('stg_maven_toys__products') }}
),
product_sales as (
  select * from {{ ref('int_products_joined_sales') }}
)

select product_id, category_count, 
ps.product_category as product_category,
product_category_cost, product_category_price, profit
from product_sales as ps
join products
using(product_category)
order by profit desc