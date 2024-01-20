-- CTE1- find highest rank and lowest rank in 2 separate columns using dense_rank()
-- CTE2- get the list of students in CTE1
-- CTE3- get the list of students who took exams but are not in CTE2
-- final query- output id and name of students in CTE3

with CTE1 as 
    (select exam_id, student_id, score, 
        dense_rank() over(partition by exam_id order by score desc) rank_highest,
        dense_rank() over(partition by exam_id order by score asc) rank_lowest
    from Exam),
    CTE2 as
    (select student_id 
    from CTE1
    where rank_highest = 1 or rank_lowest = 1),
    CTE3 as
    (select distinct student_id
    from Exam 
    where student_id not in (select * from CTE2))

select student_id, student_name 
from Student
where student_id in (select * from CTE3)
order by 1

--------------------------------------------------------------------------------------------------------------------------------------------------------
-- CTE- find highest rank and lowest rank in 2 separate columns using dense_rank()
-- pull student_id from Exam table- note that student_id is not primary key, so use distnct
-- pull name from Student table
-- use Exam as left table because we don't want students who didn't take any exams
-- use WHERE condition not in-> CTE
  
with CTE as 
    (select exam_id, student_id, score, 
        dense_rank() over(partition by exam_id order by score desc) rank_highest,
        dense_rank() over(partition by exam_id order by score asc) rank_lowest
    from Exam)

select distinct e.student_id, s.student_name
from Exam e
left join Student s
on e.student_id = s.student_id
where e.student_id not in
    (select student_id 
    from CTE
    where rank_highest = 1 or rank_lowest = 1)
order by 1


-- no companies listed
