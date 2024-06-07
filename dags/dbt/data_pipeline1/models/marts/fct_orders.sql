select 
    orders.*,
    orders_summary.sum_extended_price as sum_extended_price,
    orders_summary.sum_discount as discounted_price,
from {{ ref('stg_tpch_orders') }} as orders
join {{ ref('orders_summary') }} as orders_summary 
on orders.order_key = orders_summary.order_key order by order_date 