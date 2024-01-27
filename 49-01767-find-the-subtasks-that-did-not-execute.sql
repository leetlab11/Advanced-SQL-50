-- using recursive CTE
-- calculate subtask_count starting from given number, subtracting 1 till it reaches 1
-- so subtasks count shouldn't be less than 2, because 2-1 = 1, and 1-1 will become 0
-- use recursive cte to get all subtaks
-- in the final query, pull all rows from cte, except the rows in Executed table

with recursive cte as
    (select task_id, subtasks_count 
    from Tasks
    
    union all
    
    select task_id, subtasks_count-1
    from cte 
    where subtasks_count > 1)

select task_id, subtasks_count as subtask_id 
from cte
where (task_id, subtasks_count) not in (select * 
                                        from Executed)

-- google- 1
