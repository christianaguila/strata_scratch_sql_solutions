/* Count the number of movies that Abigail Breslin nominated for oscar


Count the number of movies that Abigail Breslin was nominated for an oscar.
 */

SELECT COUNT(movie) AS nomination_count
FROM oscar_nominees
WHERE nominee = 'Abigail Breslin'