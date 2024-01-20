-- beginner solution- using unions
-- create a table without nulls

select product_id, 'store1' as store, store1 as price
from Products
where store1 is not null
union
select product_id, 'store2' as store, store2 as price
from Products
where store2 is not null
union
select product_id, 'store3' as store, store3 as price
from Products
where store3 is not null

---------------------------------------------------------------------------------------------------------------------------------------------------------
-- create a table with nulls, then filter out rows without nulls

select product_id, store, price
from
    (select product_id, 'store1' as store, store1 as price
    from Products
    union 
    select product_id, 'store2' as store, store2 as price
    from Products
    union
    select product_id, 'store3' as store, store3 as price
    from Products) t
where price is not null


-- bloomberg- 2
-- apple- 2
-- amazon- 1
