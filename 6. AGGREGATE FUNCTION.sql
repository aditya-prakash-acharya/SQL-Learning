SELECT * FROM customer

-- 1. COUNT() : Counts rows or non-null values
-- Interview Use Case: Finding total customer volume or unique address counts.
SELECT 
    COUNT(*) AS total_rows,                         -- Counts every single row
    COUNT(customer_id) AS total_customers,          -- Counts non-null customer IDs
    COUNT(DISTINCT address_id) AS unique_addresses  -- Counts unique addresses only
FROM customer;


-- 2. MAX() and MIN() : Finds numerical extremes OR alphabetical bounds
-- Interview Use Case: Finding the highest ID or sorting alphabetically without ORDER BY.
SELECT 
    MAX(customer_id) AS highest_customer_id,
    MIN(customer_id) AS lowest_customer_id,
    MAX(first_name) AS alphabetically_last_name     -- Works alphabetically on text!
FROM customer;


-- 3. SUM() and AVG() : Mathematical totals and averages
-- Interview Use Case: Calculating financial metrics or averages on numeric columns.
SELECT 
    SUM(address_id) AS sum_of_address_ids,
    AVG(address_id) AS average_address_id
FROM customer;


-- 4. GROUP BY + HAVING : Grouping rows and filtering post-aggregation
-- Interview Use Case: Finding addresses that have more than 1 customer living there.
SELECT 
    address_id,
    COUNT(customer_id) AS customer_count
FROM customer
GROUP BY address_id
HAVING COUNT(customer_id) > 1;
-- I see no output because every single address_id in your table is unique—meaning every address only has 1 customer living there.

-- 5. ADVANCED : Conditional Aggregation (PostgreSQL FILTER Clause)
-- Interview Use Case: Counting different custom categories in a single row simultaneously.
SELECT 
    COUNT(customer_id) AS total_customers,
    COUNT(customer_id) FILTER (WHERE customer_id <= 5) AS customers_id_1_to_5,
    COUNT(customer_id) FILTER (WHERE customer_id > 5) AS customers_id_above_5
FROM customer;