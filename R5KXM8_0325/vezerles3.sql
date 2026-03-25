DECLARE
    n1 number := 10;
    n2 number := 100;
    ertek number := 99;
BEGIN
    IF ertek < n1 THEN
        dbms_output.put_line('Túl kicsi');
    ELSIF ertek > n2 THEN
         dbms_output.put_line('Túl nagy');
    ELSE
        dbms_output.put_line('Beleesik a tartományba');
    END IF;
END;