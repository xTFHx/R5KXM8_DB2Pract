-- =================
-- ADATOK FELVÉTELE 
-- ================

BEGIN
    NewTeam(1, 'Ferrari', 'Olaszország', 1950, 1000000, 'Binotto');
END;
/

BEGIN
    NewTeam(2, 'Mercedes', 'Németország', 2010, 1200000, 'Wolff');
END;
/

BEGIN
    NewTeam(3, 'Red Bull', 'Ausztria', 2005, 1100000, 'Horner');
END;
/

-- ===========
-- LISTÁZÁS 
-- ===========
BEGIN
    ListTeam;
END;
/

-- =========================
-- KÖLTSÉG NÖVELÉS TESZT
-- =========================
BEGIN
    KoltsegNovel(10);
END;
/
--===========
-- ellenőrzés
--============
BEGIN
    ListTeam;
END;
/

-- =========================
-- KÖLTSÉG CSÖKKENTÉS TESZT
-- =========================
BEGIN
    KoltsegCsokkent(5);
END;
/

--===========
-- ellenőrzés
--============
BEGIN
    ListTeam;
END;
/

-- =========================
-- STATISZTIKA FUNKCIÓK TESZT
-- =========================
BEGIN
    Statisztika('Wolff');
END;
/


--SELECT Darab('Wolff') FROM dual;
--SELECT OsszKoltseg('Wolff') FROM dual;

-- =========================
-- UPDATE + TRIGGER TESZT
-- =========================
BEGIN
    KoltsegNovel(20);
END;
/

SELECT * FROM F1_Log;

-- =========================
-- DELETE TESZT + TRIGGER
-- =========================
BEGIN
    DelTeam(1);
END;
/

--===========
-- ellenőrzés
--============
BEGIN
    ListTeam;
END;
/

-- =========================
-- JOB LOG ELLENŐRZÉS
-- =========================
SELECT * FROM F1_JobLog;

-- =========================
-- VÉGSŐ LISTA
-- =========================
BEGIN
    ListTeam;
END;
/