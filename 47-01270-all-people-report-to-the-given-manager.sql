-- innermost layer will give- 2, 77 because they directly report to 1
-- second layer will give- 4 because he reports to 2
-- outermost layer will give 7 because he reports to 4
-- so first table- 7
-- 2nd table- 4
-- 3rd table- 2, 77

select employee_id
from Employees
where manager_id in
    (select employee_id
    from Employees
    where manager_id in
        (select employee_id
        from Employees
        where manager_id = 1 and employee_id != 1))
union
select employee_id
    from Employees
    where manager_id in
        (select employee_id
        from Employees
        where manager_id = 1 and employee_id != 1)
union
select employee_id
from Employees
where manager_id = 1 and employee_id != 1

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- using join
-- tier1 is immediate reportees of 1- 2, 77
-- tier 2 has 1 layer between them and 1- tier1.employee_id = Employee.manager_id- 4
-- tier3 has 2 layers between them and 1- tier2.emplpoyee_id = Employee.manager_id- 7

with tier1 as 
    (select e.employee_id
    from Employees e
    where manager_id = 1 and e.employee_id != 1),
    tier2 as
    (select e.employee_id
    from Employees e
    join tier1 t1
    on t1.employee_id = e.manager_id),
    tier3 as
    (select e.employee_id
    from Employees e
    join tier2 t2
    on t2.employee_id = e.manager_id)

select employee_id 
from tier1
union
select employee_id
from tier2
union
select employee_id
from tier3

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- using 2 joins 
  
select e1.employee_id
from Employees e1
join Employees e2
on e1.manager_id = e2.employee_id
join Employees e3
on e2.manager_id = e3.employee_id
where e3.manager_id = 1 and e1.employee_id != 1


-- adobe- 2
-- google- 1

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- NOT A SOLUTION- ONLY EXPLANATION- JOINS

select e1.employee_id as e1emp, e1.manager_id as e1man, e2.employee_id as e2emp, e2.manager_id as e2man, e3.employee_id as e3emp, e3.manager_id as e3man
from Employees e1
join Employees e2
on e1.manager_id = e2.employee_id
join Employees e3
on e2.manager_id = e3.employee_id

-- logic- o/p e1emp
-- e1man = e2emp, e2man = e3emp, e3man = 1, e1emp != 1
-- we are outputting employee != 1 and ultimate manager = 1

| e1emp | e1man | e2emp | e2man | e3emp | e3man |
| ----- | ----- | ----- | ----- | ----- | ----- |
| 4     | 2     | 2     | 1     | 1     | 1     |
| 1     | 1     | 1     | 1     | 1     | 1     |
| 2     | 1     | 1     | 1     | 1     | 1     |
| 77    | 1     | 1     | 1     | 1     | 1     |
| 9     | 8     | 8     | 3     | 3     | 3     |
| 3     | 3     | 3     | 3     | 3     | 3     |
| 8     | 3     | 3     | 3     | 3     | 3     |
| 7     | 4     | 4     | 2     | 2     | 1     |

