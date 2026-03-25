DECLARE
    t varchar(20) := 'Gregó Bence';
BEGIN
    SELECT UPPER(t) INTO t FROM dual;
    dbms_output.put_line((t));

    SELECT LOWER(t) INTO t FROM dual;
    dbms_output.put_line((t));

    SELECT INTCAP(t) INTO t FROM dual;
    dbms_output.put_line((t));
END;