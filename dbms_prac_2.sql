Theory

Displaying Data from multiple tables

t1: First table.
t2: Second table
mc: Matching c common to both the tables.

INNER JOIN: The INNER JOIN keyword selects all rows from both the tables as long as the condition satisfies.
 This keyword will create the result-set by combining all rows from both the tables where the condition satisfies

SELECT t1.c1,t1.c2,t2.c1,....
FROM t1 
INNER JOIN t2
ON t1.mc = t2.mc;

LEFT JOIN: This join returns all the rows of the table on the left side of the join and matching rows for the table
 on the right side of join. The rows for which there is no matching row on right side,
 the result-set will contain null. Also known as LEFT OUTER JOIN.

SELECT t1.c1,t1.c2,t2.c1,....
FROM t1 
LEFT JOIN t2
ON t1.mc = t2.mc

RIGHT JOIN: RIGHT JOIN is similar to LEFT JOIN. This join returns all the rows of the table on 
the right side of the join and matching rows for the table on the left side of join. 
Also known as RIGHT OUTER JOIN.Syntax:

SELECT t1.c1,t1.c2,t2.c1,....
FROM t1 
RIGHT JOIN t2
ON t1.mc = t2.mc;

FULL JOIN: FULL JOIN creates the result-set by combining result of both LEFT JOIN and RIGHT JOIN.

SELECT t1.c1,t1.c2,t2.c1,....
FROM t1 
FULL JOIN t2
ON t1.mc = t2.mc;

SELF JOIN

A self join is a join in which a table is joined with itself

  To join a table itself means that each row of the table is combined with itself and with every other row of the table.


SELECT a.c_name, b.c_name... 
FROM t1 a, t1 b 
WHERE a.common_filed = b.common_field;


Aggregate Data using group functions

c: column name

SUM(c)
Sums the values in c

AVG(c)
Averages the values in c

MAX(c)
Returns the maximum value in c

MIN(c)
Returns the minimum value in c

SUM(c)
Sums the values in c







Subqueries






SQL

Displaying Data from multiple tables

SQL> create table PRODUCT
  2  (
  3  p_id int,
  4  v_id varchar(10),
  5  p_name varchar(25),
  6  p_price float
  7  );

Table created.

SQL> create table VENDOR
  2  (
  3  v_id varchar(10),
  4  v_name varchar(25),
  5  v_city varchar(20)
  6  );

Table created.

SQL> insert into PRODUCT values(100,'A-101','Chair',503.75);

1 row created.

SQL> insert into PRODUCT values(101,'B-101','Table',2519.75);

1 row created.

SQL> insert into PRODUCT values(102,'C-101','Watch',700.10);

1 row created.

SQL> insert into PRODUCT values(103,'D-101','Mobile',1504.25);

1 row created.

SQL> insert into PRODUCT values(104,'E-101','Sofa',50000.00);

1 row created.

SQL> select * from PRODUCT;

      P_ID V_ID       P_NAME                       P_PRICE
---------- ---------- ------------------------- ----------
       100 A-101      Chair                         503.75
       101 B-101      Table                        2519.75
       102 C-101      Watch                          700.1
       103 D-101      Mobile                       1504.25
       104 E-101      Sofa                           50000

       SQL> insert into VENDOR values('A-101','John','Mumbai');

1 row created.

SQL> insert into VENDOR values('F-101','Seth','Kolkata');

1 row created.

SQL> insert into VENDOR values('C-101','Dean','Chennai');

1 row created.

SQL> insert into VENDOR values('G-101','Roman','New Delhi');

1 row created.

SQL> insert into VENDOR values('E-101','Albert','Hyderabad');

1 row created.

SQL> set lines 256;

SQL> select p_id, p_name, v_city from PRODUCT, VENDOR;

      P_ID P_NAME                    V_CITY
---------- ------------------------- --------------------
       100 Chair                     Mumbai
       101 Table                     Mumbai
       102 Watch                     Mumbai
       103 Mobile                    Mumbai
       104 Sofa                      Mumbai
       100 Chair                     Kolkata
       101 Table                     Kolkata
       102 Watch                     Kolkata
       103 Mobile                    Kolkata
       104 Sofa                      Kolkata
       100 Chair                     Chennai

      P_ID P_NAME                    V_CITY
---------- ------------------------- --------------------
       101 Table                     Chennai
       102 Watch                     Chennai
       103 Mobile                    Chennai
       104 Sofa                      Chennai
       100 Chair                     New Delhi
       101 Table                     New Delhi
       102 Watch                     New Delhi
       103 Mobile                    New Delhi
       104 Sofa                      New Delhi
       100 Chair                     Hyderabad
       101 Table                     Hyderabad

      P_ID P_NAME                    V_CITY
---------- ------------------------- --------------------
       102 Watch                     Hyderabad
       103 Mobile                    Hyderabad
       104 Sofa                      Hyderabad

25 rows selected.


SQL> select p_price,p_name from PRODUCT;

   P_PRICE P_NAME
---------- -------------------------
    503.75 Chair
   2519.75 Table
     700.1 Watch
   1504.25 Mobile
     50000 Sofa

SQL> select p_id,v_name,p_name from PRODUCT,VENDOR where v_city='Mumbai';

      P_ID V_NAME                    P_NAME
---------- ------------------------- -------------------------
       100 John                      Chair
       101 John                      Table
       102 John                      Watch
       103 John                      Mobile
       104 John                      Sofa

SQL> select p_id,p_name,v_name from PRODUCT,VENDOR where v_city='Mumbai';

      P_ID P_NAME                    V_NAME
---------- ------------------------- -------------------------
       100 Chair                     John
       101 Table                     John
       102 Watch                     John
       103 Mobile                    John
       104 Sofa                      John


SQL> select p.v_id,p_name,v_name from PRODUCT p,VENDOR where v_city='Mumbai';

V_ID       P_NAME                    V_NAME
---------- ------------------------- -------------------------
A-101      Chair                     John
B-101      Table                     John
C-101      Watch                     John
D-101      Mobile                    John
E-101      Sofa                      John


SQL> CREATE TABLE customers
  2  (
  3   id INT PRIMARY KEY,
  4   name VARCHAR(20),
  5   age INT,
  6   salary INT
  7  );

Table created.

SQL> CREATE TABLE orders
  2  (
  3   o_id INT UNIQUE,
  4   cust_id INT REFERENCES customers(id),
  5   amount INT
  6  );

Table created.

SQL> INSERT INTO customers VALUES(1,'Ramesh',32,20000);

1 row created.

SQL> INSERT INTO customers VALUES(2,'Rehman',25,15000);

1 row created.-

SQL> INSERT INTO customers VALUES(3,'Kaushik',23,27000);

1 row created.

SQL> INSERT INTO customers VALUES(4,'Chaitali',25,65000);

1 row created.

SQL> INSERT INTO customers VALUES(5,'Hardik',27,50000);

1 row created.

SQL> INSERT INTO customers VALUES(6,'Komal',22,33000);

1 row created.

SQL> INSERT INTO customers VALUES(7,'Jatin',24,23000);

1 row created.

SQL> INSERT INTO orders VALUES(102,3,3000);

1 row created.

SQL> INSERT INTO orders VALUES(100,3,1500);

1 row created.

SQL> INSERT INTO orders VALUES(101,2,1560);

1 row created.

SQL> INSERT INTO orders VALUES(103,4,2060);

1 row created.

SQL> SELECT id,name,amount
  2  FROM customers
  3  INNER JOIN orders
  4  ON customers.id=orders.cust_id;

        ID NAME                     AMOUNT
---------- -------------------- ----------
         3 Kaushik                    3000
         3 Kaushik                    1500
         2 Rehman                     1560
         4 Chaitali                   2060

SELECT id,name,amount
FROM customers
LEFT JOIN orders
ON customers.id = orders.cust_id;

   ID NAME                     AMOUNT
----- -------------------- ----------
    3 Kaushik                    3000
    3 Kaushik                    1500
    2 Rehman                     1560
    4 Chaitali                   2060
    5 Hardik
    1 Ramesh
    6 Komal
    7 Jatin

SQL> SELECT id,name,amount
  2  FROM customers
  3  RIGHT JOIN orders
  4  ON customers.id = orders.cust_id;

        ID NAME                     AMOUNT
---------- -------------------- ----------
         2 Rehman                     1560
         3 Kaushik                    1500
         3 Kaushik                    3000
         4 Chaitali                   2060

SQL> SELECT id,name,amount
  2  FROM customers
  3  FULL JOIN orders
  4  ON customers.id = orders.cust_id;

        ID NAME                     AMOUNT
---------- -------------------- ----------
         3 Kaushik                    3000
         3 Kaushik                    1500
         2 Rehman                     1560
         4 Chaitali                   2060
         5 Hardik
         1 Ramesh
         6 Komal
         7 Jatin

8 rows selected.

SQL> SELECT a.o_id,b.cust_id,a.amount
  2  FROM orders a, orders b
  3  WHERE a.amount < b.amount;

      O_ID    CUST_ID     AMOUNT
---------- ---------- ----------
       100          3       1500
       101          3       1560
       103          3       2060
       100          2       1500
       100          4       1500
       101          4       1560

6 rows selected.


Aggregate Data using group functions

CREATE TABLE Emp_Info(
emp_id INT,
emp_name VARCHAR(10),
dept_id INT,
emp_salary int
);

INSERT INTO Emp_Info VALUES(10,'susmit',90,2000);
INSERT INTO Emp_Info VALUES(11,'manish',91,3000);
INSERT INTO Emp_Info VALUES(12,'rounak',92,4000);
INSERT INTO Emp_Info VALUES(13,'shounak',93,5000);
INSERT INTO Emp_Info VALUES(14,'kanak',94,6000);
INSERT INTO Emp_Info VALUES(15,'aditya',95,7000);
INSERT INTO Emp_Info VALUES(16,'clint',91,8000);
INSERT INTO Emp_Info VALUES(17,'victor',92,9000);
INSERT INTO Emp_Info VALUES(18,'manish',93,8500);
INSERT INTO Emp_Info VALUES(19,'rounak',94,7500);

SELECT * FROM Emp_Info ORDER BY emp_salary;

SELECT SUM(emp_salary) FROM Emp_Info;
SELECT AVG(emp_salary) FROM Emp_Info;
SELECT MAX(emp_salary) FROM Emp_Info;
SELECT MIN(emp_salary) FROM Emp_Info;
SELECT COUNT(emp_salary) FROM Emp_Info;




Subqueries