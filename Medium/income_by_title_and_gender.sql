/* Income By Title and Gender

Find the average total compensation based on employee titles and gender. Total compensation is calculated by adding both the salary and 
bonus of each employee. However, not every employee receives a bonus so disregard employees without bonuses in your calculation. Employee 
can receive more than one bonus. Output the employee title, gender (i.e., sex), along with the average total compensation.
 */

with total_bonus AS (
    SELECT worker_ref_id, SUM(bonus) AS bonus
    FROM sf_bonus
    GROUP BY worker_ref_id
)

SELECT e.employee_title, e.sex, AVG(e.salary + b.bonus) AS avg_compensation
FROM sf_employee e JOIN 
    total_bonus b ON 
    e.id = b.worker_ref_id
GROUP BY e.employee_title, e.sex