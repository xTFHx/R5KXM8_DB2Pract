CREATE TABLE Zoo(
    ID int PRIMARY KEY,
    Nev varchar2(30),
    Fajta varchar2(30),
    Szuletett date,
    Suly int,
    Ertek int,
    Gondozo varchar2(30)
);

desc Zoo
INSERT INTO Zoo VALUES(2, 'Molly', 'Majom', TO_DATE('10.03.2024', 'DD-MM-YYYY'), 40, 300000, 'Kis János');
INSERT INTO Zoo VALUES(3, 'Borat', 'Zebra', TO_DATE('11.11.2025', 'DD-MM-YYYY'), 21, 500300, 'Bárdos Trafalgár');
INSERT INTO Zoo VALUES(7, 'Chad', 'Tigris', TO_DATE('07.07.2007', 'DD-MM-YYYY'), 77, 700777, 'Kis János');

SELECT * FROM Zoo;


CREATE OR REPLACE PROCEDURE Ertek Novel(szazalek IN INT) IS
BEGIN
    UPDATE Zoo SET Ertek = Ertek + (Ertek * szazalek / 100);
END;

SELECT * FROM Zoo;
BEGIN
    ErtekNovel(10);
END;

SELECT * FROM Zoo;