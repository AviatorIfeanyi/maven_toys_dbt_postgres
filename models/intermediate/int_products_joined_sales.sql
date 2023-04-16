with sales as (
  select * from {{ ref('stg_maven_toys__sales') }}
),

products as (
  select * from {{ ref('stg_maven_toys__products') }}
),

products_sales_joined as (
  select p.product_id, product_category,
    p.product_cost * s.units as product_category_cost,
    p.product_price * s.units as product_category_price
  from sales as s
    join products as p 
    on s.product_id = p.product_id
)

select  *
from products_sales_joined