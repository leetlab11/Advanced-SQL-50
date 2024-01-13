-- use group by for aggregate

select email as Email
from Person
group by email
having count(email) > 1


-- amazon- 2
-- uber- 2
