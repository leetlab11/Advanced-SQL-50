-- simple aggregation- we need total sum of the diff between out and in time

select event_day as day, emp_id, sum(out_time-in_time) as total_time
from Employees
group by 1, 2


-- adobe- 2
-- amazon- 1
