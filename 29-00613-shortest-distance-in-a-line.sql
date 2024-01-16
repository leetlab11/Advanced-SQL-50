-- cross joining all the points from 2 tables, except the ones where they are same
-- find the min of absolute distance

select min(abs(a - b)) as shortest
from
  (select p1.x as a, p2.x as b
  from Point p1 cross join Point p2
  where p1.x != p2.x) temp

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- concise version of the above
  
select min(abs(p1.x - p2.x)) as shortest
from Point p1 cross join Point p2
where p1.x != p2.x

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- pull min distance with a where condition

select min(p1.x - p2.x) as shortest
from Point p1, Point p2
where p1.x > p2.x

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- sort the table, and do lag. Now diff between current and lag- because difference between the sorted will always be lesser than difference between the larger ones
-- pull the min distance
  
with CTE as 
  (select x - lag(x) over(order by x) as distance
  from Point)

select min(distance) as shortest from CTE

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- picking the lowest distance, 1st row will always be null hence use offset

select x - lag(x) over(order by x) as shortest
from Point
order by 1 asc
limit 1 offset 1


-- no companies listed
