Procedures

Factorial

CREATE PROCEDURE Fact(n INT) AS
    ans INT := 1;
BEGIN
    FOR num IN 1..n LOOP
        ans := ans * num;
    END LOOP;
    dbms_output.put_line('Factorial: ' || ans);
END Fact;
/

EXECUTE  Fac(5);

OUTPUT:

Factorial: 120		

Fibbonacci

CREATE PROCEDURE fib(n INT) AS
    a INT := 0;
    b INT := 1;
    c INT;
    i INT := 1;
BEGIN
    DBMS_OUTPUT.PUT_LINE(a);
    DBMS_OUTPUT.PUT_LINE(b);
    WHILE i <= n-2 LOOP
        c := a + b;
        DBMS_OUTPUT.PUT_LINE(c);
        a := b;
        b := c;
        i := i + 1;
    END LOOP;
END;
/

EXECUTE fib(7);
OUTPUT:
0
1
1
2
3
5
8

Armstrong

CREATE PROCEDURE armstrong(n INT) AS
    rem INT;
    t INT;
    l INT;
    summa INT := 0;
BEGIN
    t := n;
    l := length(to_char(n));
    WHILE t > 0 LOOP
        rem := mod(t,10);
        summa := summa + rem**l;
        t := trunc(t/10);
    END LOOP;
    IF summa = n THEN
        dbms_output.put_line('Armstrong');
    ELSE
        dbms_output.put_line('Not an armstrong');
    END IF;
END;
/

EXECUTE armstrong(153);

OUTPUT:
Armstrong

Functions

Factorial

CREATE FUNCTION Fact (n INT)
RETURN INT AS
    fact INT := 1;
BEGIN
    FOR i IN 1..n LOOP
        fact := fact * i;
    END LOOP;
    RETURN fact;
END;
/

DECLARE
    n INT := 5;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Factorial: ' || Fact(n));
END;

OUTPUT:
Factorial: 120

Fibbonacci
Using arrays ?	


Armstrong

CREATE FUNCTION armstrong (n INT)
RETURN INT AS
    rem INT;
    t INT;
    l INT;
    summa INT := 0;
BEGIN
    t := n;
    l := length(to_char(n));
    WHILE t > 0 LOOP
        rem := mod(t,10);
        summa := summa + rem**l;
        t := trunc(t/10);
    END LOOP;
    IF summa = n THEN
        RETURN 1;
    ELSE
        RETURN 0;
    END IF;
END;
/

DECLARE
    n INT := 153;
BEGIN
    IF armstrong(n) = 1 THEN
        dbms_output.put_line('Armstrong');
    ELSE
        dbms_output.put_line('Not an armstrong');
    END IF;
END;

OUTPUT:
Armstrong