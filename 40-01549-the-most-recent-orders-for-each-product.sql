-- pending explanation and subquery approach01549-

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
