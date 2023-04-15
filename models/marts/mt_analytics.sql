with sales as (
  select * from {{ ref('stg_maven_toys__sales') }}
),

products as (
  select * from {{ ref('products') }}
),

stores as (
  select * from {{ ref('stores') }}
),

inventory as (
  select * from {{ ref('stg_maven_toys__inventory') }}
)

select sales.sale_id, sales.product_id, 
  sales.units, sales.sales_year, stores.store_id,
  stores.store_name, 
  stores.store_location, stores.store_open_year, 
  stores.store_sales,
  products.product_category,
  products.category_count, products.product_category_cost,
  products.product_category_price, products.profit,
  inventory.stock
from sales
join stores
  on sales.store_id = stores.store_id
join products
  on sales.product_id = products.product_id
left join inventory
	on stores.store_id = inventory.store_id
	and products.product_id = inventory.product_id


