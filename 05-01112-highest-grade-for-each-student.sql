-- use RANK() and pull results where rank = 1

select student_id,  course_id, grade
from
    (select student_id, course_id, grade, dense_rank() over(partition by student_id order by grade desc, course_id asc) as rnk
    from Enrollments) temp1
where rnk = 1
order by 1


-- amazon- 2
-- coursera- 1

--------------------------------------------------------------------------------------------------------------------------------------------------------------
