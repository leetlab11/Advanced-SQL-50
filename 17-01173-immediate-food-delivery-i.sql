-- simple condition in aggregate function- count immediate, divide by total rows in the table

select round(sum(order_date = customer_pref_delivery_date) / count(*) * 100, 2) as immediate_percentage
from Delivery
---------------------------------------------------------------------------------------------------------------------------------------------
-- same as above but using case

select round(sum( case when order_date = customer_pref_delivery_date then 1 else 0 end) / count(*) * 100, 2) as immediate_percentage
from Delivery


-- doordash- 2
