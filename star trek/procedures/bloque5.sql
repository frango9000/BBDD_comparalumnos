create or replace procedure pactores as
na actores.noma%type;
cursor ca is select noma, cachehora from actores;
begin

for faca in ca loop

dbms_output.put_line(faca.noma||' '||faca.cachehora);
end loop;


end;
/
show errors;

