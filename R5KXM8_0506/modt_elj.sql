CREATE OR REPLACE PROCEDURE Modt (
    p_tkod IN termek3.tkod%TYPE,
    p_ar   IN termek3.ar%TYPE
) AS
BEGIN
    UPDATE termek3
    SET ar = p_ar
    WHERE tkod = p_tkod;
END
