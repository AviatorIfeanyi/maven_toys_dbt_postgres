
with product_sales as (
  select * from {{ ref('int_products_joined_sales') }}
)

select 
product_id, product_category,
sum(product_category_cost) as product_category_cost, 
sum(product_category_price) as product_category_price,
sum(product_category_price - product_category_cost) as profit
from product_sales
group by product_category, product_id
