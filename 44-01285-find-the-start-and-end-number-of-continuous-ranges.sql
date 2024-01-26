-- row number- created just to look at what it looks like
-- continuous ranges have same differences from row number
-- so pick min as start, max as end and group by diff

select min(log_id) as start_id, max(log_id) as end_id
from
    (select log_id, 
        row_number() over(order by log_id) as rn, 
        log_id - row_number() over(order by log_id) as diff
    from Logs) temp
group by diff


-- microsoft- 1
