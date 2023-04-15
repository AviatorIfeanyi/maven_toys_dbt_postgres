with sales as (
  select * from {{ ref('stg_maven_toys__sales') }}
),

products as (
  select * from {{ ref('stg_maven_toys__products') }}
),

products_sales_joined as (
  select product_category,
    sum(p.product_cost * s.units) as product_category_cost,
    sum(p.product_price * s.units) as product_category_price,
    sum((p.product_price * s.units) - (p.product_cost * s.units)) as profit
  from sales as s
    left join products as p 
    on s.product_id = p.product_id
    group by product_category
)

select  *
from products_sales_joined
order by profit desc