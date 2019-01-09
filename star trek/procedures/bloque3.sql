create or replace procedure cachespais(z actores.nacionalidade%type) as
tc integer:=0;
begin
select sum(cachehora) into tc from actores where nacionalidade =z;

dbms_output.put_line(tc);
end;
/
show errors;

