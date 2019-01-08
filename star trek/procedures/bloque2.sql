create or replace procedure totalcaches as -- sustituye declare
tc integer;
begin
select sum(cachehora) into tc from actores;

dbms_output.put_line(tc);
end;
/
show errors;

