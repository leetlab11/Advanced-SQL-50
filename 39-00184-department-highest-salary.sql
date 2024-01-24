-- using subquery

select d.name as Department, e.name as Employee, e.salary
from Department d join Employee e
on d.id = e.departmentId
where (e.departmentId, e.salary) in 
    (select departmentId, max(salary)
    from Employee
    group by departmentId)

-----------------------------------------------------------------------------------------------------------------------------------------------------------

-- using window function

with CTE as
(select departmentId, id, name, salary,
    dense_rank() over(partition by departmentId order by salary desc) as rnk
from Employee)

select d.name as Department, e.name as Employee, e.salary
from Department d join CTE e
on d.id = e.departmentId
where e.rnk = 1


-- amazon- 2
-- microsoft- 3
-- apple- 2
-- facebook- 2
-- google- 2
