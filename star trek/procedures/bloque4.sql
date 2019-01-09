create or replace procedure nombreactor(z actores.coda%type) as
na actores.noma%type;
ch actores.cachehora%type;
begin

select noma, cachehora into na,ch from actores where coda =z;

dbms_output.put_line(na||' '||ch);
end;
/
show errors;

