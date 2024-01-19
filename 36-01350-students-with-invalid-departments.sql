-- subquery- use WHERE

select id, name
from Students
where department_id not in 
    (select id
    from Departments)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- join- use WHERE id is null

select s.id, s.name
from Students s
left join Departments d
on d.id = s.department_id
where d.id is null


-- amazon- 1
