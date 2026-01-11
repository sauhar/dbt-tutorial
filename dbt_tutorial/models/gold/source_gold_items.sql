with dedup_query as
(
select
*,
row_number() over (partition by id order by updatedDate desc) as depuplication_id
from
{{ source('source','items') }}
)
select id, name, category, updatedDate
from
dedup_query
where
depuplication_id = 1