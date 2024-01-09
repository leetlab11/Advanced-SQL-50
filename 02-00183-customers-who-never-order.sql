-- pick id from Orders, and do not select those ids

select name as Customers
from Customers
where id not in
    (select distinct customerId
    from Orders)

-- amazon- 3
-- apple- 7
-- bloomberg- 5
-- adobe- 2
