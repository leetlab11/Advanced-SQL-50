-- lag and lead will give the rows above and below
-- if free = 1 and either of lag_free or lead_free is 1, it means we have 2 consecutive free seats.
-- just pick those rows

with CTE as(
    select seat_id, free, 
        lag(free, 1) over(order by seat_id) as lag_free, 
        lead(free, 1) over(order by seat_id) as lead_free
    from Cinema)

select seat_id 
from CTE
where (free = 1 and lag_free = 1) or (free = 1 and lead_free = 1)
order by 1

------------------------------------------------------------------------------------------------------------------------------------------------------------
-- if seat = free AND seat + 1 or seat - 1 have free = 1, then pull that seat  
  
select seat_id
from Cinema
where free = 1 and
     (seat_id - 1 in (select seat_id
                      from Cinema
                      where free = 1)
    or
    seat_id + 1 in (select seat_id
                      from Cinema
                      where free = 1))


-- amazon- 4
