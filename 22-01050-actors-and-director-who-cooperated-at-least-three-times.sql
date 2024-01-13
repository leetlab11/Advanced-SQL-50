-- aggregate- group by 2 columns, count

select actor_id, director_id
from ActorDirector
group by 1, 2
having count(*) >= 3


-- amazon- 3
