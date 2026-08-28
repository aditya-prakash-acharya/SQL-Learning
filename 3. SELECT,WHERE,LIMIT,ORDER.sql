-- used to select all data from database
SELECT * FROM classroom

-- used to select only specific rows and columns
SELECT rollno,name,house FROM classroom
SELECT rollno,name FROM classroom
SELECT DISTINCT grade,name FROM classroom


-- where is used to filter records
-- used to extract those records which fulfill condition
/*syntax : SELECT column_name FROM table_name
        WHERE conditions;*/
SELECT name,grade FROM classroom
WHERE grade='A'
-- SQL reserves a words for operators which is used with the where clause
/*Most used operators:
Arithmetic operators:
Addition (+), Subtraction (-), Multiplication (*), Division (/), Modulus (%)
Comparison operators:
Equal (=), Not Equal (!=), Greater Than (>), Greater Than Equals (>=), etc.
Logical operators:
ALL, IN, BETWEEN, LIKE, AND, OR, NOT, ANY
Bitwise operators:
Bitwise AND (&), Bitwise OR (|)*/
SELECT name FROM classroom
WHERE grade='A' AND rollno > 3;
----
SELECT * FROM classroom
WHERE grade='A' AND rollno > 3; -- we can use more AND and add conditions


-- Limit clause
--limit clause is used to set upper limit on the number of tuples returned by SQL
SELECT salary FROM customer
LIMIT 3
-- order by
-- the orderby is used to sort the ressult bu ASC and DESC
SELECT salary FROM  customer
ORDER BY salary DESC
----
SELECT * FROM  customer
ORDER BY salary ASC

-- used to delete the whole table completely
DROP TABLE classroom

-- used to create table
CREATE TABLE classroom (
rollno int8 PRIMARY KEY,
name varchar(50) NOT NULL,
house char(12) NOT NULL,
grade char(1) );

INSERT INTO classroom (rollno, name, house, grade)
VALUES
(1, 'Sam', 'Akash', 'B'),
(2, 'Ram', 'Agni', 'A'),
(3, 'Shyam', 'Jal', 'B'),
(4, 'Sundar', 'Agni', 'A'),
(5, 'Ram', 'Yayu', 'B');

CREATE TABLE customer
(
CustID int8 PRIMARY KEY,
CustName varchar(50) NOT NULL,
Age int NOT NULL,
City char(50),
Salary numeric );

INSERT INTO customer (CustID, CustName, Age, City, Salary)
VALUES
(1, 'sam', 26, 'Delhi', 9008),
(2, 'Ram', 19, 'Bangalore', 11000),
(3, 'Pam', 31, 'Mumbai', 6060),
(4, 'Sam', 42, 'Pune', 10000);