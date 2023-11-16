{% macro cents_to_dollars() %}
    round(amount / 100.0, 2)
{% endmacro %}