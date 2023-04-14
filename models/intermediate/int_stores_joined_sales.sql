with stores as (
  select * from {{ ref('stg_maven_toys_stores')}}
),
sales as (
  select * from {{ ref('stg_maven_toys_sales')}}
)


with store_location_sales as(
  select 
    store_location, 
    count(s.*) as store_sales 
  from sales as s 
  left join stores 
    using(store_id)
  group by store_location
)

select * from store_location_sales