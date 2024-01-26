-- use lead() to get next date
-- if there's no date, difference has to be calculated with 2021-1-1, so put this value in lead()

with CTE as 
    (select user_id, visit_date, 
    lead(visit_date, 1, '2021-1-1') over(partition by user_id order by visit_date) as next_date
    from UserVisits)

select user_id, max(datediff(next_date, visit_date)) as biggest_window
from CTE
group by user_id


-- no companies listed
