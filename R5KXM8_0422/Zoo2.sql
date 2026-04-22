CREATE OR REPLACE PACKAGE ZooPackage AS
    PROCEDURE NewPet(i IN NUMBER, nev IN CHAR, fajta IN CHAR, szul IN DATE, suly IN NUMBER, ertek IN NUMBER) IS
    BEGIN
        INSERT INTO Zoo VALUES(i, nev, fajta, szul, suly, ertek, gond);
    END;

    PROCEDURE DelPet(i IN NUMBER) IS
    BEGIN
        DELETE FROM Zoo WHERE id = i;
    END;

    PROCEDURE ModPet(i IN NUMBER) IS
    BEGIN
        UPDATE Zoo SET gondozo = gond WHERE id = i
    END;

    PROCEDURE ListPet AS
    CURSOR cur IS SELECT Nev, Gondozo FROM Zoo;

END ZooPackage;