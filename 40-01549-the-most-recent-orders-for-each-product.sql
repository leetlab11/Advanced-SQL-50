-- using window function- dense_rank() to get most recent orders by date, partition by product_id

with CTE as
    (select p.product_name, o.product_id, o.order_id, o.order_date,
        dense_rank() over(partition by o.product_id order by o.order_date desc) as rnk
    from Orders o
    left join Products p
    on o.product_id = p.product_id)

select product_name, product_id, order_id, order_date
from CTE
where rnk = 1
order by 1, 2, 3

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- using subquery
    
select p.product_name, o.product_id, o.order_id, o.order_date
from Products p 
join Orders o
on p.product_id = o.product_id
where (o.product_id, o.order_date) in (select product_id, max(order_date)
                                        from Orders
                                        group by product_id)
order by 1, 2, 3
