select
  L_ORDERKEY as order_key,
  L_PARTKEY as part_key,
  L_LINENUMBER as line_number,
  L_QUANTITY as quantity,
  L_EXTENDEDPRICE as extended_price,
  L_DISCOUNT as discount_percentage,
  L_TAX as tax_rate,
   
    -- create a surrogate key as a combination of order_key and line_number
    {{ 
        dbt_utils.generate_surrogate_key(['order_key', 'line_number'])
    }} as order_lineitem_key,

    -- use a macro function to find the discounted amount
    {{ discount_calcultor('extended_price','discount_percentage') }} as discount_amount

from {{ source('tpch', 'lineitem') }}
