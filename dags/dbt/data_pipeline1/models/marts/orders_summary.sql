select 
    order_key,
    sum(extended_price) as sum_extended_price,
    sum(discount_amount) as sum_discount
from {{ ref('stg_tpch_lineitem') }}
group by order_key 