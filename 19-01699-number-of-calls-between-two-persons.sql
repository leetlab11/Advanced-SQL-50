-- union all- this gets all calls, then we put condition p1 < p2

select from_id as person1, to_id as person2, count(*) as call_count, sum(duration) as total_duration 
from
    (select from_id, to_id, duration
    from Calls
    union all
    select to_id, from_id, duration
    from Calls) t
where from_id < to_id
group by 1, 2

-----------------------------------------------------------------------------------------------------------------------------
-- without using union all
-- make p1 < p2, then do calculations
  
select 
(case when from_id < to_id then from_id else to_id end) as person1,
(case when from_id < to_id then to_id else from_id end) as person2,
count(*) as call_count,
sum(duration) as total_duration
from Calls
group by 1, 2


-- facebook- 2
-- amazon- 1
