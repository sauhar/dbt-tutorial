-- block level config
{{config(materialized = 'view')}}

select *
from {{source('source','fact_sales')}}