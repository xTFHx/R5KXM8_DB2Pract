-- =========================
-- TÁBLA
-- =========================
CREATE TABLE F1_Csapat (
    ID NUMBER PRIMARY KEY,
    Nev VARCHAR2(100),
    Orszag VARCHAR2(100),
    AlapitasEv NUMBER,
    Koltsegvetes NUMBER,
    Csapatfonok VARCHAR2(100)
);

-- =========================
-- ÁR (KÖLTSÉGVETÉS) KEZELÉS
-- =========================
CREATE OR REPLACE PROCEDURE KoltsegNovel(sz IN NUMBER) AS
BEGIN
    UPDATE F1_Csapat
    SET Koltsegvetes = Koltsegvetes + Koltsegvetes * sz / 100;
END;
/

CREATE OR REPLACE PROCEDURE KoltsegCsokkent(sz IN NUMBER) AS
BEGIN
    UPDATE F1_Csapat
    SET Koltsegvetes = Koltsegvetes / (1 + sz / 100);
END;
/

-- =========================
-- STATISZTIKA
-- =========================
CREATE OR REPLACE FUNCTION OsszKoltseg(fonok IN VARCHAR2)
RETURN NUMBER AS
    ossz NUMBER;
BEGIN
    SELECT SUM(Koltsegvetes)
    INTO ossz
    FROM F1_Csapat
    WHERE Csapatfonok = fonok;

    RETURN ossz;
END;
/

CREATE OR REPLACE FUNCTION Darab(fonok IN VARCHAR2)
RETURN NUMBER AS
    db NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO db
    FROM F1_Csapat
    WHERE Csapatfonok = fonok;

    RETURN db;
END;
/

CREATE OR REPLACE PROCEDURE Statisztika(fonok IN VARCHAR2) AS
    db NUMBER;
    ossz NUMBER;
BEGIN
    db := Darab(fonok);
    ossz := OsszKoltseg(fonok);

    DBMS_OUTPUT.PUT_LINE('Csapatfőnök: ' || fonok);
    DBMS_OUTPUT.PUT_LINE('Csapatok száma: ' || db);
    DBMS_OUTPUT.PUT_LINE('Összköltség: ' || ossz);
END;
/

-- =========================
-- CRUD
-- =========================
CREATE OR REPLACE PROCEDURE NewTeam(
    p_id NUMBER, n VARCHAR2, o VARCHAR2,
    ev NUMBER, k NUMBER, f VARCHAR2
) AS
    db NUMBER;
BEGIN
    SELECT COUNT(*) INTO db FROM F1_Csapat WHERE ID = p_id;

    IF db > 0 THEN
        DBMS_OUTPUT.PUT_LINE('Már létezik ID!');
    ELSE
        INSERT INTO F1_Csapat VALUES (p_id, n, o, ev, k, f);
        DBMS_OUTPUT.PUT_LINE('Sikeres beszúrás!');
    END IF;
END;
/

CREATE OR REPLACE PROCEDURE DelTeam(p_id NUMBER) AS
BEGIN
    DELETE FROM F1_Csapat WHERE ID = p_id;
END;
/

CREATE OR REPLACE PROCEDURE ListTeam AS
BEGIN
    FOR rec IN (SELECT Nev, Csapatfonok FROM F1_Csapat) LOOP
        DBMS_OUTPUT.PUT_LINE(rec.Nev || ', ' || rec.Csapatfonok);
    END LOOP;
END;
/

-- =========================
-- NAPLÓ TÁBLA
-- =========================
CREATE TABLE F1_Log (
    ID NUMBER,
    Nev VARCHAR2(100),
    Orszag VARCHAR2(100),
    AlapitasEv NUMBER,
    Koltsegvetes NUMBER,
    Csapatfonok VARCHAR2(100),
    Muvelet VARCHAR2(10),
    Datum DATE
);

-- =========================
-- TRIGGEREK
-- =========================
CREATE OR REPLACE TRIGGER trg_ins_f1
AFTER INSERT ON F1_Csapat
FOR EACH ROW
BEGIN
    INSERT INTO F1_Log VALUES (:NEW.ID, :NEW.Nev, :NEW.Orszag,
                              :NEW.AlapitasEv, :NEW.Koltsegvetes,
                              :NEW.Csapatfonok, 'INSERT', SYSDATE);
END;
/

CREATE OR REPLACE TRIGGER trg_upd_f1
AFTER UPDATE ON F1_Csapat
FOR EACH ROW
BEGIN
    INSERT INTO F1_Log VALUES (:OLD.ID, :OLD.Nev, :OLD.Orszag,
                              :OLD.AlapitasEv, :OLD.Koltsegvetes,
                              :OLD.Csapatfonok, 'UPDATE', SYSDATE);
END;
/

CREATE OR REPLACE TRIGGER trg_del_f1
AFTER DELETE ON F1_Csapat
FOR EACH ROW
BEGIN
    INSERT INTO F1_Log VALUES (:OLD.ID, :OLD.Nev, :OLD.Orszag,
                              :OLD.AlapitasEv, :OLD.Koltsegvetes,
                              :OLD.Csapatfonok, 'DELETE', SYSDATE);
END;
/

-- =========================
-- JOB
-- =========================
CREATE TABLE F1_JobLog (
    Datum DATE,
    Szoveg VARCHAR2(100)
);

CREATE OR REPLACE PROCEDURE F1Logger AS
BEGIN
    INSERT INTO F1_JobLog VALUES (SYSDATE, 'F1 job lefutott');
    COMMIT;
END;
/

BEGIN
    DBMS_SCHEDULER.CREATE_JOB (
        job_name        => 'F1_JOB',
        job_type        => 'PLSQL_BLOCK',
        job_action      => 'BEGIN F1Logger; END;',
        start_date      => SYSTIMESTAMP,
        repeat_interval => 'FREQ=MINUTELY;INTERVAL=1',
        end_date        => SYSTIMESTAMP + INTERVAL '6' MINUTE,
        enabled         => TRUE
    );
END;
/