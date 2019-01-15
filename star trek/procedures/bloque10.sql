-- Dado o codigo dun actor amosa o nome y os titulos das peliculas nas que intervino
set serveroutput on
create or replace procedure ppel(z actores.coda%type) as

cursor cpel is select codpel from interpretespel where coda=z;
vnoma actores.noma%type;
vtitulo peliculas.titulo%type;

x number:=0;

begin
select noma into vnoma from actores where coda =z;
dbms_output.put_line(vnoma);

for m in cpel loop
select titulo into vtitulo from peliculas where codpel=m.codpel;
dbms_output.put_line(vtitulo);
x:=1;
end loop;

if x = 0 then
dbms_output.put_line('El actor '||z||' no interpreto peliculas');
end if;

exception
when no_data_found then
dbms_output.put_line('Alert'||chr(10)||'Error...');
end;
/
show errors;


