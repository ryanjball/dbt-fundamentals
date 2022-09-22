with payments as (
    select * from {{ ref('stg_payments') }}
)

select order_id
from payments
group by 1
having sum(amount) < 0