-- id_country- get country name for each person by joining on country code
-- id_duration- duration for each person on each call- each person can have multiple rows
-- final query- join these 2 to calculate avg for each country- group by country
-- use having clause to filter avg for country > global avg (calculated using id_duration cte)


with id_country as
    (select p.id, c.name as country
    from Person p
    join Country c
    on left(p.phone_number, 3) = c.country_code),

    id_duration as
    (select caller_id, duration
    from Calls
    union all
    select callee_id, duration
    from Calls)

select c.country
from id_country c
join id_duration d
on c.id = d.caller_id
group by c.country
having avg(duration) > (select avg(duration) 
                        from id_duration)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- same as above but concise
-- first cte as above, 
-- then join on Calls using OR

select c.name as country
from Country c
join Person p 
on c.country_code = left(p.phone_number, 3)
join calls cl
on cl.caller_id = p.id or cl.callee_id = p.id
group by c.name
having avg(duration) > (select avg(duration) 
                        from Calls)


-- no companies listed
