P5:  Using SET operators, Date/Time Functions, GROUP BY clause

Using SET Operators
Datetime Functions
Enhancements to the GROUP BY Clause

Set operators

1. Union

This set operator is used to combine the outputs of two or more queries into a single
 set of rows and columns having different records.

 2. Union All

This set operator is used to join the outputs of two or more queries 
into a single set of rows and columns without the removal of any duplicates.

3. Intersect

This set operator is availed to retrieve the information which is common in both tables.

4. Minus

This set operator is availed to retrieve the information of one table which is not available in another table.

Date Time

In Oracle, TO_CHAR function converts a datetime value (DATE, TIMESTAMP data types i.e.) 
to a string using the specified format. 

Oracle TO_CHAR 	Format Specifier
YYYY 	4-digit year
YY 	2-digit year
MON 	Abbreviated month (Jan - Dec)
MONTH 	Month name (January - December)
MM 	Month (1 - 12)
DY 	Abbreviated day (Sun - Sat)
DD 	Day (1 - 31)
HH24	Hour (0 - 23)
HH or HH12 	Hour (1 - 12)
MI 	Minutes (0 - 59)
SS 	Seconds (0 - 59) 


Group BY

SQL | GROUP BY

The GROUP BY Statement in SQL is used to arrange identical data into groups with the help of some functions. i.e if a particular column has same values in different rows then it will arrange these rows in a group.

Important Points:

    GROUP BY clause is used with the SELECT statement.
    In the query, GROUP BY clause is placed after the WHERE clause.
    In the query, GROUP BY clause is placed before ORDER BY clause if used any.

Syntax:

SELECT column1, function_name(column2)
FROM table_name
WHERE condition
GROUP BY column1, column2
ORDER BY column1, column2;

function_name: Name of the function used for example, SUM() , AVG().
table_name: Name of the table.
condition: Condition used.


SQL

CREATE TABLE emp
(
 emp_id INT,
 emp_name VARCHAR(10),
 city VARCHAR(10),
 salary INT
);

SQL> CREATE TABLE cust
  2  (
  3   cust_id INT,
  4   name VARCHAR(10),
  5   city VARCHAR(10),
  6   emp_id INT
  7  );

Table created.

INSERT INTO emp VALUES(1,'susmit','mumbai',100);
INSERT INTO emp VALUES(1,'rounak','pune',200);
INSERT INTO emp VALUES(1,'manish','satara',300);
INSERT INTO emp VALUES(1,'clint','mumbai',400);
INSERT INTO emp VALUES(1,'pranit','pune',500);

INSERT INTO cust VALUES(10,'rahul','mumbai',1);
INSERT INTO cust VALUES(11,'shounak','pune',2);
INSERT INTO cust VALUES(12,'dheeraj','satara',3);
INSERT INTO cust VALUES(13,'sahil','mumbai',4);
INSERT INTO cust VALUES(14,'omkar','delhi',5);
INSERT INTO cust VALUES(15,'victor','bhopal',6);
INSERT INTO cust VALUES(16,'parth','chennai',7);
INSERT INTO cust VALUES(17,'vineet','haryana',8);

SQL> SELECT city 
  2  FROM emp
  3  UNION
  4  SELECT city
  5  FROM cust;

CITY
----------
bhopal
chennai
delhi
haryana
mumbai
pune
satara

7 rows selected.

SQL> SELECT city
  2  FROM emp
  3  UNION ALL
  4  SELECT city
  5  FROM cust;

CITY
----------
mumbai
pune
satara
mumbai
pune
mumbai
pune
satara
mumbai
delhi
bhopal

CITY
----------
chennai
haryana

13 rows selected.

SQL> SELECT city
  2  FROM emp
  3  INTERSECT
  4  SELECT city
  5  FROM cust;

CITY
----------
mumbai
pune
satara

SQL> SELECT emp_id
  2  FROM cust
  3  MINUS
  4  SELECT emp_id
  5  FROM emp;

    EMP_ID
----------
         2
         3
         4
         5
         6
         7
         8

7 rows selected.


