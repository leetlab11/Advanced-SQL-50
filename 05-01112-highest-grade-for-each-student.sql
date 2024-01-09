-- use RANK() and pull results where rank = 1

select student_id,  course_id, grade
from
    (select student_id, course_id, grade, dense_rank() over(partition by student_id order by grade desc, course_id asc) as rnk
    from Enrollments) temp1
where rnk = 1
order by 1

--------------------------------------------------------------------------------------------------------------------------------------------------------------
-- nested 
-- first get id and highest grade, then get min course_id

select student_id, min(course_id) as course_id, grade
from Enrollments
where (student_id, grade) in
    (select student_id, max(grade) as grade
    from Enrollments
    group by student_id)
group by student_id
order by student_id

-- amazon- 2
-- coursera- 1
