DROP TABLE customer

CREATE TABLE customer
(
customer_id int8 PRIMARY KEY,
first_name varchar(50),
last_name varchar(50),
email varchar(100),
address_id int8
)

SELECT * FROM customer

-- importing through code 
COPY customer(customer_id, first_name, last_name, email, address_id)
FROM 'C:\temp\customer.csv' ---importanmt to make sure a proper source
DELIMITER ','
CSV HEADER;

CREATE TABLE payment
(
customer_id int8 PRIMARY KEY,
amount int8 NOT NULL,
mode varchar(50),
payment_date date
)

-- importing directly 
-- imported by servers-->database name -->schemas ==>tables -->database right click import
SELECT * FROM payment