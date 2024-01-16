-- 3 cases- use CASE WHEN

select id,
    (case when p_id is null then 'Root' 
    when id in (select p_id from Tree) then 'Inner'
    else 'Leaf' end) as type
from Tree


-- twitter- 1
