with customers as (
    select * from {{ ref('stg_customers') }}
),
orders as (
    select * from {{ ref('stg_orders') }}
),
payments as (
    select * from {{ ref('stg_payments') }}
),
final as (
        select
            customers.customer_id,
            orders.order_id,
            sum(payments.amount/100) as total_amount
        from orders
        left join customers using (customer_id)
        left join payments using (order_id)
        where payments.status = 'success'
        group by customer_id, order_id
)

select * from final