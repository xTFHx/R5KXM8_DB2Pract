DECLARE
    a number default 10;
    b number default 20;
    s number;
BEGIN
    s := a*b;
    dbms_output.put_line(TO_CHAR(s));
END;