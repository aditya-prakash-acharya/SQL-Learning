-- TIMESTAMP data type is used for values that contain both date and time parts
-- TIME: HH:MI:SS
-- DATE: YYYY-MM-DD
-- YEAR: YYYY or YY
-- TIMESTAMP: YYYY-MM-DD and HH:MI:SS
-- TIMESTAMPTZ: contains date,time and time zone

-- TIMESTAMP functions/operators
--below are the timestamps functions and operators in SQL:
-- SHOW TIMEZONE
-- SELECT NOW()
-- SELECT TIMEOFDAY()
-- SELECT CURRENT_TIME
-- SELECT CURRENT_DATE

SHOW TIMEZONE
SELECT NOW()
SELECT TIMEOFDAY()
SELECT CURRENT_TIME
SELECT CURRENT_DATE

-- The EXTRACT() functionextract a part from given date value.
SELECT EXTRACT(MONTH FROM date_feild) FROM Table 
YEAR
QUARTER
MONTH
WEEK
DAY
HOUR
MINUTE
DOW - day a week
DOY - day of year

SELECT EXTRACT(YEAR FROM payment_date) AS pay_time,payment_date
FROM payment 