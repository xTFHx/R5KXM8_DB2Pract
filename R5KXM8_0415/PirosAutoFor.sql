BEGIN

    FOR rekord IN (SELECT * FROM Piros_Auto WHERE szin = 'piros') LOOP
        
        INSERT INTO MasikPiros_Auto (rsz, tipus, szin, kor, ar)
        VALUES (rekord.rsz, rekord.tipus, rekord.szin, rekord.kor, rekord.ar);
        
    END LOOP;


    COMMIT;
END;