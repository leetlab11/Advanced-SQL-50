-- nested query
-- select all salesPerson with company RED
-- select all salesPerson from SalesPerson not in the above table

select sp.name
from SalesPerson sp
where sales_id not in
    (select o.sales_id
    from Orders o
    where o.com_id in
        (select c.com_id 
        from Company c
        where c.name = 'RED'))

------------------------------------------------------------------------------------------------------------------------------------------------
-- JOIN Company c and Ordered o
-- pick all sales_id with company = 'RED'
-- pick all salesPerson from SalesPerson not in temp table above
  
select sp.name
from SalesPerson sp
where sales_id not in
    (select o.sales_id
    from Orders o
    inner join Company c
    on c.com_id = o.com_id
    where c.name = 'RED')


-- no companies listed
