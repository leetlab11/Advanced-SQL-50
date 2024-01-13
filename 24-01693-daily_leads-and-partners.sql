-- basic aggregate function- count distinct, group by 2 variables

select date_id, make_name, 
    count(distinct lead_id) unique_leads, 
    count(distinct partner_id) unique_partners
from DailySales
group by date_id, make_name


-- no companies listed
