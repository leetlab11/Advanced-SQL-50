-- select all employees from Employees not in Salaries, UNION select all employees from Salaries not in Employees

select employee_id
from Employees
where employee_id not in 
    (select employee_id
    from Salaries)
union 
select employee_id
from Salaries
where employee_id not in 
    (select employee_id
    from Employees)
order by 1

----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- first get a table of all employees bu doing a UNION on the 2 tables
-- then select those emeployees which are in above table but not in respective tables- UNION

with all_employees as 
    (select employee_id 
    from Employees
    union
    select employee_id 
    from Salaries)

select employee_id
from all_employees 
where employee_id not in (select employee_id from Employees)
union
select employee_id
from all_employees 

-- adobe- 2
where employee_id not in (select employee_id from Salaries)
order by 1


