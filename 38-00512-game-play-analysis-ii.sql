-- using subquery

select player_id, device_id
from Activity
where (player_id, event_date) in
    (select player_id, min(event_date)
    from Activity
    group by player_id)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- using window function
  
with CTE as
    (select player_id, device_id, 
        row_number() over(partition by player_id order by event_date) as rn
    from Activity)

select player_id, device_id
from CTE 
where rn = 1

-- gsn games- 1
