DECLARE
    a number := 10;
    b number := 20;
BEGIN
    IF a>b THEN
        dbms_output.put_line('Az "a" szám a nagyobb');
    ELSE
        dbms_output.put_line('A "B" szám a nagyobb');
    END IF;
END;