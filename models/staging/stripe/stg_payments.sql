select
    id as payment_id,
    orderid as order_id,
    paymentmethod as payment_method,
    status,
    amount

from filipe_balseiro_raw.stripe.payment