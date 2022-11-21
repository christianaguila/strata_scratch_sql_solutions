/* Users By Average Session Time

Calculate each user's average session time. A session is defined as the time difference between a page_load and page_exit. For simplicity, assume a user has only 1 session per day and if there are multiple of the same events on that day, consider only the latest page_load and earliest page_exit. Output the user_id and their average session time.

Table: facebook_web_log */



WITH page_load_tbl(user_id, date, load_ts) AS (
    SELECT user_id, CAST(timestamp AS date) date, MAX(timestamp) AS load_ts
    FROM facebook_web_log
    WHERE action = 'page_load'
    GROUP BY user_id, date 
),

page_exit_tbl(user_id, date, exit_ts) AS (
    SELECT user_id, CAST(timestamp AS DATE) AS date, MIN(timestamp) AS exit_ts
    FROM facebook_web_log
    WHERE action = 'page_exit'
    GROUP BY user_id, date
),

sess_time_tbl (user_id, date, sess_time) AS (
    SELECT lt.user_id, lt.date, (et.exit_ts - lt.load_ts)
    FROM page_load_tbl lt JOIN
        page_exit_tbl et ON 
        lt.user_id = et.user_id AND
        lt.date = et.date
)

SELECT user_id, AVG(sess_time) AS avg_sess_time
FROM sess_time_tbl 
GROUP BY user_id
