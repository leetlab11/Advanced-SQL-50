-- use dense_rank(), partition by project, order by years desc

with CTE as
    (select p.project_id, p.employee_id, e.experience_years, 
        dense_rank() over(partition by p.project_id order by e.experience_years desc) as rnk
    from Project p
    left join Employee e
    on p.employee_id = e.employee_id)

select project_id, employee_id
from CTE
where rnk = 1

-- facebook- 1
