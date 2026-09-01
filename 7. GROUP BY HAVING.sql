-- The GROUP BY statement group rows that have same values in the summary row
-- if is often used with aggregate functions (COUNT(), MAX(), MIN()
-- SUM(), AVG()) to group the reult set by one or more columns

SELECT mode, SUM(amount) AS Total
FROM payment
GROUP BY mode --group by clause is essential to to group multiple values of same source
Order BY total ASC  -- used to arrange the order ASC is ascendingDSC is decending

SELECT * FROM payment

-- HAVING CLAUSE is used to apply filter on the results of GROUP BY based on soecific condition
-- the WHERE  clause places the condition on the selected columns, whereas the HAVING clause places
-- conditions on groups created by the GROUP BY clause

SELECT mode, SUM(amount) AS Total
FROM payment
GROUP BY mode
HAVING COUNT(amount) >= 3
Order BY total DESC

SELECT mode, COUNT(amount) AS Total
FROM payment
GROUP BY mode
HAVING COUNT(amount) >= 2 AND COUNT(amount) < 4
Order BY total DESC