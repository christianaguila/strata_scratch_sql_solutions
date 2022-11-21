/* Find the rate of processed tickets for each type

Find the rate of processed tickets for each type.

 */


 
SELECT type, 
    ROUND((COUNT(CASE WHEN processed = 'TRUE' THEN 1 END)*1.0/COUNT(processed)*1.0), 3) AS  processed_rate
FROM facebook_complaints
GROUP BY type
