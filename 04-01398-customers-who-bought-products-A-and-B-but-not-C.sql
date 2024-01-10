-- summing up all products, choosing those customers that only has A and B as > 0 and C = 0

select o.customer_id, c.customer_name
from
    (select order_id, customer_id, 
    sum(product_name='A') as A,
    sum(product_name='B') as B,
    sum(product_name='C') as C 
    from Orders 
    group by customer_id) o
left join Customers c
on c.customer_id = o.customer_id
where A > 0 and B > 0 and C = 0
order by 1

-------------------------------------------------------------------------------------------------------------------------------------------------
-- group_concat() approach- unique approach- my first thought
-- group all products per customer, choose customers with only A and B but not c
  
select  customer_id, customer_name
from
    (
        select o.order_id, o.customer_id, c.customer_name, group_concat(o.product_name order by product_name) as group_products
    from Orders o left join Customers c
    on o.customer_id = c.customer_id
    group by c.customer_id
    ) temp1
where group_products like '%A%B%' and group_products not like '%A%B%C%'
  
-------------------------------------------------------------------------------------------------------------------------------------------------
-- longer version of the 1st one
  
select o.customer_id, c.customer_name
from
    (select order_id, customer_id, 
    sum(case when product_name='A' then 1 else 0 end) as A,
    sum(case when product_name='B' then 1 else 0 end) as B,
    sum(case when product_name='C' then 1 else 0 end) as C 
    from Orders 
    group by customer_id) o
left join Customers c
on c.customer_id = o.customer_id
where A > 0 and B > 0 and C = 0
order by 1

-------------------------------------------------------------------------------------------------------------------------------------------------
-- much simpler version of the 1st one
  
select o.customer_id, c.customer_name
from Orders o
left join Customers c
on c.customer_id = o.customer_id
group by o.customer_id
having sum(product_name='A') > 0 and sum(product_name='B') > 0 and sum(product_name='C') = 0
order by 1


-- amazon- 2
-- facebook- 1
