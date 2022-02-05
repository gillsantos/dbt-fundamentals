-- This query returns orders w/ missing customer_id's
-- Therefore return records where this is true to make the test fail.
select
    customer_id,
	count(1) as total_orders
from {{ ref('stg_orders') }}
where customer_id not in (
    select distinct customer_id
    from {{ ref('stg_customers')}}
)
group by 1