-- first create cte1 with count
-- then cte2 with rank using that count
-- then fetch rows with rnk = 1, join for product name

with cte1 as
    (select customer_id, product_id, count(product_id) as count_product
    from Orders
    group by customer_id, product_id),
    cte2 as
    (select customer_id, product_id, 
        dense_rank() over(partition by customer_id  order by count_product desc) as rnk
    from cte1)

select c.customer_id, c.product_id, p.product_name
from cte2 c
join Products p
on p.product_id = c.product_id
where rnk = 1 

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  
-- same as above, but combined cte1 and cte2 into 1 table- used count() directly inside rank()
  
with cte2 as
    (select customer_id, product_id, 
        dense_rank() over(partition by customer_id  order by count(product_id)  desc) as rnk
    from Orders
    group by 1, 2)

select c.customer_id, c.product_id, p.product_name
from cte2 c
join Products p
on p.product_id = c.product_id
where rnk = 1 


-- no companies listed
