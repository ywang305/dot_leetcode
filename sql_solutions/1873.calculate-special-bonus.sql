-- Write your PostgreSQL query statement below
select
    employee_id,
    case (employee_id%2 = 1 and name not like 'M%')
    when true then salary
    else 0
    end as bonus
from employees
order by employee_id
