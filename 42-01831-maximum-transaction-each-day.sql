-- using subquery

select transaction_id
from Transactions
where (day, amount) in (select date(day), max(amount)
                      from Transactions
                      group by 1)
order by 1

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- using window function

with CTE as
    (select transaction_id, dense_rank() over(partition by date(day) order by amount desc) as rnk
    from Transactions)

select transaction_id
from CTE
where rnk = 1
order by 1


-- no companies listed
