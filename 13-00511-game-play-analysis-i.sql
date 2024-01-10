-- simple aggregate function

select player_id, min(event_date) as first_login
from Activity
group by 1

-- adobe- 2
-- amazon- 4
-- bloomberg- 4
-- gsn games- 1
