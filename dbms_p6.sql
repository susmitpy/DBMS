Practical 6: Creating and managing other database objects

A: Creating Views
B: Other Database objects

SQL Views
Views in SQL are kind of virtual tables.
A view also has rows and columns as they are in a real table in the database.
We can create a view by selecting fields from one or more tables present in the database.
A View can either have all the rows of a table or specific rows based on certain condition.

 We can create View using CREATE VIEW statement. A View can be created from a single table or multiple tables.

 We can use the CREATE OR REPLACE VIEW statement to add or remove fields from a view.
Syntax:

CREATE OR REPLACE VIEW view_name AS
SELECT column1,coulmn2,..
FROM table_name
WHERE condition;


SQL | SEQUENCES

Sequence is a set of integers 1, 2, 3, … that are generated and supported by some database systems to produce unique values on demand.

    A sequence is a user defined schema bound object that generates a sequence of numeric values.
    Sequences are frequently used in many databases because many applications require each row in a table to contain a unique value and sequences provides an easy way to generate them.
    The sequence of numeric values is generated in an ascending or descending order at defined intervals and can be configured to restart when exceeds max_value.

Syntax:

CREATE SEQUENCE sequence_name
START WITH initial_value
INCREMENT BY increment_value
MINVALUE minimum value
MAXVALUE maximum value
CYCLE|NOCYCLE ;

sequence_name: Name of the sequence.

initial_value: starting value from where the sequence starts. 
Initial_value should be greater than or equal 
to minimum value and less than equal to maximum value.

increment_value: Value by which sequence will increment itself. 
Increment_value can be positive or negative.

minimum_value: Minimum value of the sequence.
maximum_value: Maximum value of the sequence.

cycle: When sequence reaches its set_limit 
it starts from beginning.

nocycle: An exception will be thrown 
if sequence exceeds its max_value.





SQL> create sequence seq1
  2  increment by 2
  3  start with 10
  4  minvalue 1
  5  maxvalue 999
  6  cycle
  7  cache 20
  8  order;

Sequence created.

SQL> CREATE TABLE Locations(loc_id int, country_id int);

Table created.

// seq1.currval

SQL> INSERT INTO Locations VALUES(seq1.nextval,100);

1 row created.

SQL> INSERT INTO Locations VALUES(seq1.nextval,101);

1 row created.

SQL> SELECT * FROM Locations;

    LOC_ID COUNTRY_ID
---------- ----------
        10        100
        12        101

SQL> SELECT * FROM Locations;

    LOC_ID COUNTRY_ID
---------- ----------
        10        100
        12        101

SQL> CREATE VIEW v1 AS
  2  SELECT loc_id
  3  FROM Locations;

View created.

SQL> SELECT * FROM v1;

    LOC_ID
----------
        10
        12

SQL> UPDATE v1
  2  SET loc_id = 6
  3  where loc_id = 10;

1 row updated.

SQL> SELECT * FROM v1;

    LOC_ID
----------
         6
        12

SQL> DROP view v1;

View dropped.






