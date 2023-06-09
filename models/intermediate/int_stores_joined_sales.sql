with stores as (
  select * from {{ ref('stg_maven_toys__stores')}}
),

sales as (
  select * from {{ ref('stg_maven_toys__sales')}}
),

store_location_sales as(
  select 
    store_location, 
    count(sales.*) as store_sales 
  from sales 
  left join stores 
    using(store_id)
  group by store_location
)

select * from store_location_sales