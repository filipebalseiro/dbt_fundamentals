with orders as  (
    select * from {{ ref('stg_orders' )}}
),

payments as (
    select * from {{ ref('stg_payments') }}
),

order_payments as (
    select
        order_id,
        sum(case when payment_status = 'success' then payment_amount end) as payment_amount

    from payments
    group by order_id
),

final as (

    select
        orders.order_id,
        orders.customer_id,
        -- adding a comment for ci
        orders.order_placed_at,
        coalesce(order_payments.payment_amount, 0) as payment_amount

    from orders
    left join order_payments using (order_id)
)

select * from final