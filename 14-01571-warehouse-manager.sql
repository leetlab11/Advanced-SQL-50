-- multiple units, width, length, height, then calculate sum() of those

select w.name as warehouse_name, 
sum(units * Width * Length * Height) as volume
from Warehouse w
left join Products p
on w.product_id = p.product_id
group by 1

-------------------------------------------------------------------------------------------------------------
-- breaking down the above one
  
with CTE as (
    select product_id, (Width * Length * Height) as size
    from Products)

select name as warehouse_name, sum(units * size) as volume
from Warehouse w
left join CTE c
on c.product_id = w.product_id
group by name

-- amazon- 1
