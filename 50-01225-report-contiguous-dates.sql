-- cte1- unioned both tables and arranged in ascending order of dates
-- cte2- calculated rn and rnk and diff between them
-- final query- picked min date as start date, max date as end date, grouped by status and diff
-- rank()- gave them ranking based on their status ascending order date
-- row_number()- ordered by date asc
-- diff between them will be consistent if they are contiguous, hence group by diff
-- when the status changes, again diff between them will be contiguous hence group by status to get different records for same status

with cte1 as
    ((select fail_date as event_date, 'failed' as status
    from Failed)
    union all
    (select success_date as event_date, 'succeeded' as status
    from Succeeded)),
    cte2 as
    (select *,
        row_number() over(order by event_date) as rn,
        dense_rank() over (partition by status order by event_date) as rnk,
        row_number() over(order by event_date) - dense_rank() over (partition by status order by event_date) as diff   
    from cte1
    where event_date between '2019-01-01' and '2019-12-31'
    order by 1)

select status as period_state, min(event_date) as start_date, max(event_date) as end_date
from cte2
group by status, diff
order by 2

-- facebook- 1

------------------------------------------------------------------------------------------------------------------------------------------------------------

-- o/p of cte2
  
| event_date | status    | rn | rnk | diff |
| ---------- | --------- | -- | --- | ---- |
| 2019-01-01 | succeeded | 1  | 1   | 0    |
| 2019-01-02 | succeeded | 2  | 2   | 0    |
| 2019-01-03 | succeeded | 3  | 3   | 0    |
| 2019-01-04 | failed    | 4  | 1   | 3    |
| 2019-01-05 | failed    | 5  | 2   | 3    |
| 2019-01-06 | succeeded | 6  | 4   | 2    |
