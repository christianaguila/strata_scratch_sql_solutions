/* 
Highest Salary In Department


Find the employee with the highest salary per department.
Output the department name, employee's first name along with the corresponding salary.

 */


SELECT a.department, b.first_name, a.salary
FROM (
    SELECT department, MAX(salary) AS salary
    FROM employee
    GROUP BY department 
) AS a JOIN
    employee AS b ON
    a.department = b.department AND 
    a.salary = b.salary
ORDER BY 3 DESC
    


-- OR (Alternative Solution)

SELECT e.department, e.first_name, e.salary
FROM (
    SELECT department, first_name, salary,
        dense_rank() OVER (PARTITION BY department ORDER BY salary DESC) s_rank
    FROM employee 
) AS e
WHERE s_rank = 1
ORDER BY 3 DESC 


-- OR (Alternative Solution)


with cte AS (
    SELECT department, first_name, salary,
    dense_rank() OVER (PARTITION BY department ORDER BY salary DESC) AS s_rank
    FROM employee
) 
SELECT department, first_name employee_name, salary
FROM cte
WHERE s_rank = 1
ORDER BY salary DESC