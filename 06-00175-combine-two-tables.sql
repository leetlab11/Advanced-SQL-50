-- simple LEFT JOIN

select p.firstName, p.lastName, a.city, a.state
from Person p
left join Address a
using(personId)


-- apple- 4
-- bloomberg- 2
-- amazon- 2
-- microsoft- 2
-- adobe- 3
-- google- 3
