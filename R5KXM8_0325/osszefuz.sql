DECLARE
    t1 VARCHAR(10) := 'Gregó'
    t2 VARCHAR(10) := 'Bence'
    t VARCHAR(20) := '';
BEGIN
    SELECT CONCAT (t1,t2) INTO t FROM dual;
    dbms_output.put_line(t);
END;