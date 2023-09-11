with customer_countries as (
    select customer_id,
           country
    from customers
),

customer_orders as (
    select order_id,
           customer_id
    from orders
)

select country,
       count(order_id) as number_of_orders
from customer_countries join customer_orders using (customer_id)
group by country
order by number_of_orders desc