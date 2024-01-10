-- select sellers from Orders table
-- then select Sellers from Sellers table who are not in temp

select seller_name
from Seller s
where seller_id not in 
    (select seller_id 
    from Orders
    where sale_date like '2020%')
order by seller_name

--------------------------------------------------------------------------------------------------------------------------------------------
-- using JOIN with conditions
  
select s.seller_name
from Seller s
left join Orders o
on o.seller_id = s.seller_id and sale_date like '2020%' 
where o.seller_id is null
order by seller_name

-- no companies listed
