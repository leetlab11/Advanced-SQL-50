-- got user1=id = 1 friends in t0 and t1
-- joined t1 with Likes on 1's friends
-- where condition- page shouldn't be liked by 1

with t0 as 
    (select user1_id, user2_id
    from Friendship
    union
    select user2_id, user1_id
    from Friendship),
t1 as
    (select user1_id, user2_id
    from t0
    where user1_id = 1)
  
select distinct l.page_id as recommended_page
from t1 join Likes l
on t1.user2_id = l.user_id
where page_id not in
    (select page_id
    from Likes
    where user_id = 1)
  
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- same as above but 1 less CTE and added where condition
  
with t1 as 
    (select user1_id, user2_id
    from Friendship
    union
    select user2_id, user1_id
    from Friendship)

select distinct l.page_id as recommended_page
from t1 join Likes l
on t1.user2_id = l.user_id
where t1.user1_id = 1
and page_id not in
    (select page_id
    from Likes
    where user_id = 1)


-- facebook- 1
