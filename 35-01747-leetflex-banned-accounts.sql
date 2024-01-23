-- join 

select distinct l1.account_id
from LogInfo l1 
join LogInfo l2
on l1.account_id = l2.account_id
and l1.ip_address != l2.ip_address
and l1.login between l2.login and l2.logout

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- self join- more popular answer on LC
  
select distinct l1.account_id
from LogInfo l1, LogInfo l2
where l1.account_id = l2.account_id
and l1.ip_address != l2.ip_address
and l1.login between l2.login and l2.logout


-- amazon- 1

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- NOT WORKING FOR THIS CASE:

-- | account_id | ip_address | login               | logout              |
-- | ---------- | ---------- | ------------------- | ------------------- |
-- | 1          | 1          | 2021-02-01 09:00:00 | 2021-02-01 15:00:00 |
-- | 1          | 1          | 2021-02-01 10:00:00 | 2021-02-01 11:00:00 |
-- | 1          | 6          | 2021-02-01 12:00:00 | 2021-02-01 13:00:00 |

-- HERE 1ST AND THIRD OVERLAPS, BUT LEAD() DOESN'T CATCH THAT

with CTE as 
     (
        select account_id, ip_address, login, logout, 
        lead(login) over(partition by account_id order by login) as next_login,
        lead(ip_address) over(partition by account_id order by login) as next_ip
    from LogInfo
    )

select distinct account_id 
from CTE 
where next_login between login and logout
and next_ip != ip_address



