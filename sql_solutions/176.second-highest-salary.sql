-- Write your PostgreSQL query statement below

select NULLIF
(
  (SELECT distinct Salary from Employee order by Salary desc limit 1 offset  1), NULL
) as SecondHighestSalary
