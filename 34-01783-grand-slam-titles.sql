-- beginner level solution
-- all player ids in a single column, count those, join with Players for name

with CTE as 
    (select Wimbledon as id
    from Championships
    union all
    select Fr_open as id
    from Championships
    union all
    select US_open as id
    from Championships
    union all
    select Au_open as id
    from Championships)

select c.id as player_id, p.player_name, count(c.id) as grand_slams_count
from CTE c 
join Players p
on c.id = p.player_id
group by 1

------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- using cross join
-- using aggregate function because we want to group by each player
-- using cross join, we are getting all players and all championships
-- so we use having to filter only those players who have won at least 1

select p.player_id, p.player_name,
    sum(case when p.player_id = c.Wimbledon then 1 else 0 end +
        case when p.player_id = c.Fr_open then 1 else 0 end +
        case when p.player_id = c.US_open then 1 else 0 end +
        case when p.player_id = c.Au_open then 1 else 0 end) as grand_slams_count
from Players p 
cross join Championships c
group by p.player_id
having grand_slams_count > 0


-- amazon- 1
