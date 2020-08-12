--create or replace transient table analytics.dbt_jraman.stg_payments
select 
id as payment_id, 
orderid as order_id,
paymentmethod as payment_method,
status,
(amount) as amount,
created as created_at,
_batched_at
from raw.stripe.payment
