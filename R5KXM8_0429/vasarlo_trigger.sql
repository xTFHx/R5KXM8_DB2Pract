/*CREATE TABLE Naplo(
    ID int,
    Nev varchar(20)
);*/

create or replace trigger TB after insert on Vasarlo for each row
begin
    insert into Naplo values('Beszúrás', :new.VID||'_'|:new.Nev|'_'|:new.Cim, sysdate);
end;

SELECT * FROM Vasarlo;

SELECT * FROM Naplo;


DROP trigger TB;

DECLARE
    s varchar(100);
begin
    if :old.vid != :new.vid then
    s := s || old.vid|'_'|:new.vid||','|;
    end if

    if :old.nev != :new.nev then
    s := s || old.nev|'_'|:new.nev||','|;
    end if

    if :old.dim != :new.cim then
    s := s || old.cim|'_'|:new.cim||','|;
    end if

    if :old.fizmod != :new.fizmod then
    s := s || old.fizmod|'_'|:new.fizmod||','|;
    end if

    s := substr(s,1length(s)-1);
    insert into Naplo values('Módosítás', s, sysdate);
end


begin
    update vasarlo2 set vid='vll', nev='Víz Jenő' where vid('v20');
end;

select * from vasarlo;


DROP TRIGGER TM;


create or replace trigger TT after delete on Vasarlo for each row
begin
    insert into Naplo values('Törlés', :old.VID||'_'| user, sysdate);
end;

delete from Vasarlo where vid in ('v01', 'v03');