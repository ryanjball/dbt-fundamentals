with orders as (
    select * from {{ ref('stg_orders') }}
),

payments as (
    select * from {{ ref('stg_payments') }}
),

fct_orders as (
select o.customer_id,o.order_id,sum(case when p.status = 'success' then amount else 0 end) as amount
from orders o left join payments p using(order_id)
group by 1,2
)

select * from fct_orders



