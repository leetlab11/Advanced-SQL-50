-- the the cusotmer with maximum order count, order by, limit

select customer_number
from Orders
group by 1
order by count(order_number) desc
limit 1


-- adobe- 2
-- google- 3
-- apple- 2
-- uber- 2
-- twitter- 1
