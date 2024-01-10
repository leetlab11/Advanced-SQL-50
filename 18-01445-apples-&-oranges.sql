-- simple aggregate with condition

select sale_date, (sum(case when fruit = 'apples' then sold_num else 0 end) - 
                  sum(case when fruit = 'oranges' then sold_num else 0 end)) as diff
from Sales
group by 1
order by 1

---------------------------------------------------------------------------------------------------------------  
-- using join- 1 table for apples, 1 for oranges, join on sales date

select sa.sale_date, (ifnull(sum(sa.sold_num),0)-ifnull(sum(so.sold_num), 0)) as diff
from Sales sa
join Sales so
on sa.sale_date = so.sale_date and sa.fruit = 'apples' and so.fruit = 'oranges'
group by 1
order by 1


-- facebook- 1
