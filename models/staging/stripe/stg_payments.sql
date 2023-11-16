select
    id as payment_id,
    orderid as order_id,
    paymentmethod as payment_method,
    created as payment_created_at,
    status as payment_status,
    -- amount is stored in cents, convert it to dollars
    {{ cents_to_dollars('amount') }} as payment_amount

from {{ source('stripe', 'payment') }}