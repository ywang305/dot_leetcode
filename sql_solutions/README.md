- [176.second-highest-salary](176.second-highest-salary.sql) NULLIF, limit,å offset
- [1112.highest-grade-for-each-student.sql](1112.highest-grade-for-each-student.sql) 子查询
- [1873.calculate-special-bonus](1873.calculate-special-bonus.sql) case when
- [1398.customers-who-bought-products-a-and-b-but-not-c](1398.customers-who-bought-products-a-and-b-but-not-c.sql) with, group by \
  可以通过构建计算表解决，直接计算每个用户所购买的各个 product 的数量，并形成新的 column;
  优美的 CTE，可读性很高；
  计算表的关键在于：SUM(IF(o.product_name = 'A', 1, 0)) AS count_A
