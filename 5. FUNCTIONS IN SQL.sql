SELECT * FROM customer

-- 1. CONCAT() / || : Combines two or more strings together
-- Interview Use Case: Creating a full name column from separate first and last names.
SELECT 
    customer_id,
    CONCAT(first_name, ' ', last_name) AS full_name
FROM customer;


-- 2. UPPER() and LOWER() : Changes the case of strings
-- Interview Use Case: Standardizing email addresses or names for uniform filtering/searching.
SELECT 
    customer_id,
    UPPER(first_name) AS upper_first_name,
    LOWER(email) AS standardized_email
FROM customer;


-- 3. LENGTH() / LEN() : Returns the character count of a string
-- Interview Use Case: Data validation checks (e.g., finding names or emails that are unusually short).
SELECT 
    customer_id,
    first_name,
    LENGTH(first_name) AS name_length
FROM customer
WHERE LENGTH(first_name) > 4;


-- 4. SUBSTRING() / SUBSTR() : Extracts a portion of a string based on position and length
-- Interview Use Case: Extracting initials or pulling the domain name out of an email string.
SELECT 
    customer_id,
    first_name,
    SUBSTRING(first_name, 1, 1) AS first_initial,                    -- Extracts the 1st character
	    SUBSTRING(first_name, 1, 4) AS four_initial,                    -- Extracts the first four
    SUBSTRING(email, POSITION('@' IN email) + 1) AS email_domain,     -- Extracts everything after '@'
	    SUBSTRING(email, 1, POSITION('@' IN email) - 1) AS email_main     -- Extracts from 1st only email not after @
FROM customer;


-- 5. TRIM(), LTRIM(), RTRIM() : Removes leading and/or trailing spaces
-- Interview Use Case: Cleaning "dirty" data imported from messy external CSV spreadsheets.
SELECT 
    customer_id,
    -- 1. TRIM(): Removes spaces from BOTH the left and right sides
    TRIM(first_name) AS clean_first_name,
    -- 2. LTRIM(): Removes spaces ONLY from the left (leading) side
    LTRIM(last_name) AS left_trimmed_last_name, 
    -- 3. RTRIM(): Removes spaces ONLY from the right (trailing) side
    RTRIM(email) AS right_trimmed_email
FROM customer;


-- 6. REPLACE() : Replaces occurrences of a specified substring with a new string
-- Interview Use Case: Masking sensitive data (like replacing parts of an email) or bulk updating domains.
SELECT 
    customer_id,
    email,
    REPLACE(email, '@mailid.com', '@MODI.com') AS updated_email
FROM customer;

-- 7. POSITION(): Finds the numerical index of a substring
-- Interview Use Case: Finding exactly where a specific character (like '@') is located within a string.
SELECT 
    customer_id,
    email,
    POSITION('@' IN email) AS at_symbol_position
FROM customer;


-- 8. AGGREGATE FUNCTION: COUNT()
-- Interview Use Case: Counting total records or non-null fields in a table.
SELECT 
    COUNT(customer_id) AS total_customers,
    COUNT(email) AS active_emails_count
FROM customer;


-- 9 POSTGRESQL STRING_AGG() FUNCTION
-- Interview Use Case: Grouping rows (by address_id) and concatenating 
-- multiple rows of text into a single comma-separated list per group.

SELECT 
    address_id,
    STRING_AGG(CONCAT(first_name, ' ', last_name), ', ' ORDER BY first_name ASC) AS customers_at_address
FROM customer
GROUP BY address_id;

-- 10. LEFT() and RIGHT() : Extracts characters from the start or end of a string
-- Interview Use Case: Quick alternative to SUBSTRING for grabbing fixed-length prefixes/suffixes (e.g., first 3 letters).
SELECT 
    customer_id,
    LEFT(first_name, 3) AS first_three_letters,
    RIGHT(email, 3) AS email_extension          -- e.g., 'com'
FROM customer;

-- 11. AGGREGATE FUNCTIONS ON STRINGS: MAX() and MIN()
-- Interview Use Case: Finding the alphabetically first or last name in a table.
SELECT 
    MAX(first_name) AS alphabetically_last,
    MIN(first_name) AS alphabetically_first
FROM customer;

-- 12. USING YOUR CUSTOM FUNCTION IN A QUERY
SELECT 
    customer_id,
    email,
    format_customer_name(first_name, last_name) AS custom_formatted_name
FROM customer;