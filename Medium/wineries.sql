/* Find all wineries which produce wines by possessing aromas of plum, cherry, rose, or hazelnut

Find all wineries which produce wines by possessing aromas of plum, cherry, rose, or hazelnut. To make it more simple, look only for
singular form of the mentioned aromas. Output unique winery values only.
 */


SELECT DISTINCT winery
FROM winemag_p1
WHERE lower(description) LIKE '%cherry%' OR lower(description) LIKE '%plum%'
    OR lower(description) LIKE '%rose%' OR lower(description) LIKE '%hazelnut%'
    

-- OR (Alternative Solution)


SELECT DISTINCT winery
FROM winemag_p1 
WHERE lower(description) SIMILAR TO '%(plum|cherry|rose|hazelnut)%'