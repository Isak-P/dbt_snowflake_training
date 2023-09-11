with nation_regions as (
    select n_nationkey,
           n_regionkey
    from snowflake_sample_data.tpch_sf1.nation
),

orders_per_nation_region as (
    select n_regionkey as opnr_regionkey,
           sum(opn_ordercount) as opnr_ordercount
    from {{ ref('orders_per_nation') }}
    join nation_regions on opn_nationkey=n_nationkey
    group by opnr_regionkey
)

select opnr_regionkey as opr_regionkey,
       r_name as opr_name,
       opnr_ordercount as opr_ordercount
from orders_per_nation_region
join snowflake_sample_data.tpch_sf1.region on opnr_regionkey=r_regionkey