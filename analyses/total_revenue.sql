with
    payments as (
        select * from {{ ref('stg_payments') }}
    ),

    aggregated as (
        select
            sum(payment_amount) as total_revenue_usd
        from payments 
        where payment_status = 'success'
    )

select * from aggregated