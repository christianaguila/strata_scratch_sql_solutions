/* Finding User Purchases

Write a query that'll identify returning active users. A returning active user is a user that has made a second purchase within 7 days of any other of their purchases. Output a list of user_ids of these returning active users.
 */


WITH cte AS (
    SELECT user_id, created_at, 
    LEAD(created_at) OVER (PARTITION BY user_id ORDER BY created_at) next
    FROM amazon_transactions
)
SELECT DISTINCT(user_id)
FROM cte
WHERE DATEDIFF(DAY, created_at, next) <= 7
ORDER BY 1


-- OR (Alternative Solution )

SELECT DISTINCT(user_id)
FROM (
    SELECT user_id, created_at, 
    LEAD(created_at) OVER (PARTITION BY user_id ORDER BY created_at) next
    FROM amazon_transactions
) AS a
WHERE DATEDIFF(DAY, created_at, next) <= 7
ORDER BY 1

