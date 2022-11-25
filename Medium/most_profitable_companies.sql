/* Most Profitable Companies

Find the 3 most profitable companies in the entire world.
Output the result along with the corresponding company name.
Sort the result based on profits in descending order.
 */

 
SELECT TOP(3) company, profits
FROM forbes_global_2010_2014
ORDER BY profits DESC 


-- OR (Alternative Solution)


SELECT company, profits
FROM forbes_global_2010_2014
ORDER BY profits DESC 
LIMIT 3