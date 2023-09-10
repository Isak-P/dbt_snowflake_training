with customer_countries as (
    select customer_id,
           country
    from customers
),

customer_orders as (
    select order_id,
           customer_id,
           status_id
    from orders
),

orders_per_country as (
    select country,
           count(order_id) as number_of_orders
    from customer_orders join customer_countries using (customer_id)
    group by country
    order by number_of_orders desc
)

select *
from orders_per_country