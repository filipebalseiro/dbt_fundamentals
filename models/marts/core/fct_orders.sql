with payments as (

    select * from {{ ref('stg_payments')}}

),

orders as (

    select * from {{ ref('stg_orders') }}

),

final as (
    select
        order_id,
        customer_id,
        amount
    from orders
    
    left join payments using (order_id)

)

select * from final