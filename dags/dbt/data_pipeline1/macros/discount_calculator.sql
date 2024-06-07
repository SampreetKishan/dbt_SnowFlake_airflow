{% macro discount_calcultor(price, discount_percent , scale=2) %}
    (-1 * {{price}} * {{discount_percent}} )::numeric(16, {{ scale }})
{% endmacro %}
