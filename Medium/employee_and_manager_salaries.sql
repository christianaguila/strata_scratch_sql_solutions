/* Employee and Manager Salaries

Find employees who are earning more than their managers. Output the employee's first name along with the corresponding salary.

 */


with manager AS(
    SELECT id, salary 
    FROM employee
    WHERE id in (
        SELECT DISTINCT manager_id
        FROM employee
    )
)
SELECT first_name, e.salary
FROM employee e JOIN
    manager m ON 
    e.manager_id = m.id 
WHERE e.salary > m.salary