CREATE TABLE Termek (
    TKOD varchar(4),
    NEV varchar(20),
    AR int,
    KATEGORIA varchar(3)
);


DESC Termek;


INSERT INTO Termek VALUES(
    ('t01', 'sör', 200, 'világos', 'k02'),
    ('t02', 'bor',200, 'vörös', 'k02')
);