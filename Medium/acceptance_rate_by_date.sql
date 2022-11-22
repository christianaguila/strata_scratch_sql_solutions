/* Acceptance Rate By Date


What is the overall friend acceptance rate by date? Your output should have the rate of acceptances by the date the request was sent. Order by the earliest date to latest.


Assume that each friend request starts by a user sending (i.e., user_id_sender) a friend request to another user (i.e., user_id_receiver) that's logged in the table with action = 'sent'. If the request is accepted, the table logs action = 'accepted'. If the request is not accepted, no record of action = 'accepted' is logged.
 */


SELECT s.date, 
    CAST(COUNT(a.user_id_receiver) / COUNT(s.user_id_sender) AS FLOAT) percentage_acceptance
FROM (
    SELECT * 
    FROM fb_friend_requests
    WHERE action = 'sent'
) s LEFT JOIN (
    SELECT * 
    FROM fb_friend_requests
    WHERE action = 'accepted'
) a ON
    s.user_id_sender = a.user_id_sender AND
    s.user_id_receiver = a.user_id_receiver
GROUP BY 1
ORDER BY 1

-- OR (Alternative Solution)

WITH sent AS (
    SELECT *
    FROM fb_friend_requests
    WHERE action = 'sent'
),
accepted AS (
    SELECT *
    FROM fb_friend_requests
    WHERE action = 'accepted'
)

SELECT s.date, 
    CAST((COUNT(a.user_id_receiver)/COUNT(s.user_id_sender)) AS float) percentage_acceptance
FROM sent s LEFT JOIN 
    accepted a ON 
    s.user_id_sender = a.user_id_sender AND 
    s.user_id_receiver = a.user_id_receiver
GROUP BY 1
ORDER BY 1
    
