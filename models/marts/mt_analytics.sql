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
  select * from {{ ref('int_inventory_aggregated') }}
)

select sales.sale_id, sales.units, stores.store_name,
  stores.store_location, stores.store_open_year,
  inventory.stock, products.product_category,
  products.category_count, products.product_category_cost,
  products.product_category_price, products.profit
from sales
left join stores
on sales.store_id = stores.store_id
left join inventory
on stores.store_id = inventory.store_id
left join products
on inventory.product_id = products.product_id