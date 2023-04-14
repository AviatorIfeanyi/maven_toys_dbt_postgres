with inventory as (
  select * from {{ ref('stg_maven_toys__inventory')}}
)

	select 
    product_id, 
    sum(stock_on_hand) as stock
  from inventory
  group by product_id
