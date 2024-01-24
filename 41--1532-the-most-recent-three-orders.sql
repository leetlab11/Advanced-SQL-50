-- we needed top 3, so subquery won't be possible without window function
-- used dense_rank()

with CTE as
    (select *, dense_rank() over(partition by customer_id order by order_date desc) as rnk
    from Orders)

select c.name as customer_name, CTE.customer_id, CTE.order_id, CTE.order_date
from CTE
join Customers c
on CTE.customer_id = c.customer_id
where rnk <= 3
order by name, customer_id, order_date desc

-- no companies listed
