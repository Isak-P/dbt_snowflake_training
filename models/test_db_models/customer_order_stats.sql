with customer_orders as (
    select customer_id,
           min(created_at) as first_order_date,
           max(created_at) as last_order_date,
           count(order_id) as order_count
    from orders
    group by customer_id
)

select customer_id,
       first_name,
       last_name,
       first_order_date,
       last_order_date,
       order_count
from customer_orders join customers using (customer_id)
order by customer_id