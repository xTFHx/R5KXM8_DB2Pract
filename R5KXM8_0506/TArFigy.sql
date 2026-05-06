CREATE OR REPLACE TRIGGER TArFigy
BEFORE UPDATE OF ar ON termek3
FOR EACH ROW
DECLARE
    valtozas_szazalek NUMBER;
BEGIN
    IF :OLD.ar IS NULL OR :NEW.ar IS NULL THEN
        RAISE_APPLICATION_ERROR(-20001, 'Az ár nem lehet NULL.');
    END IF;

    valtozas_szazalek := ((:NEW.ar - :OLD.ar) / :OLD.ar) * 100;

    IF ABS(valtozas_szazalek) > 20 THEN
        RAISE_APPLICATION_ERROR(
            -20002,
            'Nem megengedett mértékű módosítás: ' ||
            ROUND(valtozas_szazalek, 2) || '%.'
        );
    END IF;
END;
/