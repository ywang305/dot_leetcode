-- Write your PostgreSQL query statement below
WITH
t1 AS (
    SELECT c.customer_id,
            c.customer_name,
            SUM(CASE WHEN o.product_name='A' then 1 else 0 end) AS count_a,
            SUM(CASE WHEN o.product_name='B' then 1 else 0 end) AS count_b,
            SUM(CASE WHEN o.product_name='C' then 1 else 0 end) AS count_c
    FROM Customers c
    JOIN Orders o
    ON c.customer_id=o.customer_id
    GROUP BY 1, 2
)

select customer_id, customer_name
from t1
where count_a>0 and count_b>0 and count_c=0
order by customer_id
