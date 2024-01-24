-- if we do not use order by in over(), we do not get running total, just normal aggregate for all rows within that partition

select employee_id, count(*) over(partition by team_id) as team_size
from Employee
order by 1

-- amazon- 1
