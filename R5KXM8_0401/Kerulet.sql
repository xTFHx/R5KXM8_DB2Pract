CREATE Table Circles (
    Radius number(4) PRIMARY KEY,
    Circumference number,
    Area number
);

desc Circles

SELECT 1 Radius, 2*1*3.14 Circumference from dual;

CREATE OR REPLACE Function PI RETURN number AS
BEGIN
    RETURN 3.14;
END;

SELECT 1 Radius, 2*1*PI() Circumference from dual;

DECLARE
    Radius number = 1;
    Circumferene number;
BEGIN
    Circumference := 2*Radius*PI();
    DBMS_PUTPUT.PUT_LINE('Radius: ' || Radius || ' Circumference' || Circumference);
END;

DECLARE
    Circumference number;
    x number := 1;
    y number := 5;
BEGIN
    FOR i IN x..y LOOP
        Circumference := 2*i*PI();
        DBMS_OUTPUT.PUT_LINE('Radius: ' || i || 'Cirumference: ' || Circumference);
    END LOOP;
 END;

CREATE OR REPLACE Procedure Circler (x in number, y in number) IS
    Circumference number;
BEGIN
    FOR i IN x..y LOOP
        Circumference := 2*i*PI();
        DBMS_OUTPUT.PUT_LINE('Radius: ' ||i|| ' Circumference ' || Circumference);
    END LOOP;
END

BEGIN
    Circler(1,5);
END;

CREATE OR REPLACE Procedure Circler (x in number, y in number) IS
    Circumference number;
    Area number;
BEGIN
    FOR i IN x..y LOOP
        Circumference := 2*i*PI();
        Area := POWER(i,2) * PI();
        DBMS_OUTPUT.PUT_LINE('Radius: ' ||i|| ' Circumference ' || Circumference || ' Area: ' || Area);
    END LOOP;
END

BEGIN
    Circler(1,5);
END;

CREATE OR REPLACE Procedure Circler (x in number, y in number) IS
    Circumference number;
    Area number;
BEGIN
    FOR i IN x..y LOOP
        Circumference := 2*i*PI();
        Area := POWER(i,2) * PI();
        INSERT INTO Circles VALUES(i, Circumference, Area);
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('A Circles táblába bekerültek az adatok.');
END