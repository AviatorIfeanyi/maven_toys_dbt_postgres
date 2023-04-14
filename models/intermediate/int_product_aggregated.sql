with products as (
  select * from {{ref('stg_maven_toys_products')}}
)

select 
    product_category, 
    count(*) as category_count
  from products
  group by product_category