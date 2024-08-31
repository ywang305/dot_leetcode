-- Write your PostgreSQL query statement below
select student_id, min(course_id) as course_id, grade
from enrollments
where (student_id, grade) in (
    select student_id, MAX(grade) as grade
    from enrollments
    group by 1
)
group by student_id, grade
order by student_id asc
