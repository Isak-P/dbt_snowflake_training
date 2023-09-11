with customer_nations as (
    select c_custkey,
           c_nationkey
    from snowflake_sample_data.tpch_sf1.customer
),

customer_orders as (
    select o_custkey,
           o_orderkey
    from snowflake_sample_data.tpch_sf1.orders
),

nation_order_counts as (
    select c_nationkey as noc_nationkey,
           count(o_orderkey) as noc_ordercount
    from customer_nations
    join customer_orders on c_custkey = o_custkey
    group by noc_nationkey
)

select noc_nationkey as opn_nationkey,
       n_name as opn_name,
       noc_ordercount as opn_ordercount
from nation_order_counts
join snowflake_sample_data.tpch_sf1.nation on noc_nationkey=n_nationkey