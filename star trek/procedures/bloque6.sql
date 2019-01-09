create or replace procedure pklingon as

cursor ca is select nomper from personaxes, klingon where personaxes.codper = klingon.codper;

begin

for faca in ca loop

dbms_output.put_line(faca.nomper);
end loop;


end;
/
show errors;

