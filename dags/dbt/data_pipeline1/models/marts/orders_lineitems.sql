-- join the stg_tpch_orders table with the stg_tpch_lineitems table
select 
        orders.order_key as order_key,
        orders.customer_key as customer_key,
        orders.order_date as order_date,
        lineitems.part_key as part_key,
        lineitems.line_number as line_number, 
        lineitems.order_lineitem_key as order_lineitem_key
    from {{ ref('stg_tpch_orders') }} as orders
    join {{ ref('stg_tpch_lineitem') }} as lineitems on orders.order_key = lineitems.order_key 