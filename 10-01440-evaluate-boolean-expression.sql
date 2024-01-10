-- create 2 value tables- l for left operand, r for right operand
-- use join to join it to the main table
-- write case statements using l.value and r.value

select e.left_operand, e.operator, e.right_operand,
    (case when operator = '>' and l.value > r.value then 'true'
    when operator = '<' and l.value < r.value then 'true'
    when operator = '=' and l.value = r.value then 'true'
    else 'false' end) as value
from Expressions e
join Variables l
on l.name = e.left_operand
join Variables r
on r.name = right_operand

-- point72-1 
