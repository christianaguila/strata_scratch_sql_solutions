-- Largest Olympics

-- Find the Olympics with the highest number of athletes. The Olympics game is a combination of the year and 
-- the season, and is found in the 'games' column. Output the Olympics along with the corresponding number of 
-- athletes.


with cte AS (
    SELECT games, COUNT(DISTINCT id) athletes_cnt
    FROM olympics_athletes_events
    GROUP BY games
    )
SELECT games, athletes_cnt
FROM cte
WHERE athletes_cnt = (SELECT MAX(athletes_cnt) FROM cte)


