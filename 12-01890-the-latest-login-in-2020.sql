-- simple aggregate(), like 

select user_id, max(time_stamp) as last_stamp
from Logins
where time_stamp like '2020%'
group by 1

----------------------------------------------------------------------------------------------------------------
-- using year() for getting 2020 instead of like

select user_id, max(time_stamp) as last_stamp
from Logins
where year(time_stamp) = '2020'
group by 1

----------------------------------------------------------------------------------------------------------------
-- using first_value()

select distinct user_id, first_value(time_stamp) over(partition by user_id order by time_stamp desc) as last_stamp
from Logins
where year(time_stamp) = '2020'

-- no companies listed
