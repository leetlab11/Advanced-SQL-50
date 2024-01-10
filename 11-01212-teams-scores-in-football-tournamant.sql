-- union all- one for host(when that team was host)- count host score, 2nd for guest(when that team was guest)- count guest score
-- calculate sum of points
-- group by team_id

select t.team_id, t.team_name, coalesce(sum(u.points), 0) as num_points
from Teams t
left join
    (select match_id, host_team as team_id, (case when host_goals > guest_goals then 3
                when host_goals = guest_goals then 1
                else 0 end) as points
    from Matches
    union all
    select match_id, guest_team as team_id,
                (case when host_goals < guest_goals then 3
                when host_goals = guest_goals then 1
                else 0 end) as points
    from Matches) u
on u.team_id = t.team_id
group by team_id
order by 3 desc, 1 asc

-------------------------------------------------------------------------------------------------------------------------
-- without using 'UNION ALL'- only used JOIN

select t.team_id, t.team_name, coalesce(
    sum(case when t.team_id = m.host_team and m.host_goals > m.guest_goals then 3
             when t.team_id = m.guest_team and m.guest_goals > m.host_goals then 3
             when host_goals = guest_goals then 1 end), 0) as num_points
from Teams t
left join Matches m
on m.host_team = t.team_id or m.guest_team = t.team_id
group by team_id
order by 3 desc, 1 asc


-- wayfair- 1
