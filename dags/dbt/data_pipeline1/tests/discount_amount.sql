select 
* 
from {{ref('fct_orders')}} 
where  discounted_price > 0 