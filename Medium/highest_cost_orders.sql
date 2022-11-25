/* Highest Cost Orders

Find the customer with the highest daily total order cost between 2019-02-01 to 2019-05-01. If customer had more than one order on 
a certain day, sum the order costs on daily basis. Output customer's first name, total cost of their items, and the date.

For simplicity, you can assume that every first name in the dataset is unique.

 */


with cte1 AS (
    SELECT cust_id, order_date, SUM(total_order_cost) AS total_order_cost
    FROM orders 
    GROUP BY cust_id, order_date
)

SELECT TOP(1) c.first_name, cte1.order_date, cte1.total_order_cost
FROM cte1 JOIN 
    customers c ON 
    c.id = cte1.cust_id
WHERE cte1.order_date BETWEEN '2019-02-01' AND '2019-05-01'
ORDER BY 3 DESC

-- OR (Alternative Solution)

with cte1 AS (
    SELECT cust_id, order_date, SUM(total_order_cost) AS total_order_cost
    FROM orders 
    GROUP BY cust_id, order_date
)

SELECT c.first_name, cte1.order_date, cte1.total_order_cost
FROM cte1 JOIN 
    customers c ON 
    c.id = cte1.cust_id
WHERE cte1.order_date BETWEEN '2019-02-01' AND '2019-05-01'
ORDER BY 3 DESC
LIMIT 1