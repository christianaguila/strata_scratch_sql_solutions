/* Workers With The Highest Salaries

Find the titles of workers that earn the highest salary. Output the highest-paid title or multiple titles that share the highest salary.
 */

 
SELECT t.worker_title
FROM worker w JOIN 
    title t ON
    w.worker_id = t.worker_ref_id
WHERE salary = (SELECT MAX(salary) FROM worker)