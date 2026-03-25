DECLARE
    d DATE;
BEGIN
    SELECT sysdate INTO d FROM dual;
    dbms_output.put_line(d);
END;