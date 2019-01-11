create or replace procedure pplanetasb(z series.titulo%type) as

vcods series.cods%type;
vnompla planetas.nompla%type;
cursor cp is select codpla from visitas where cods=vcods;

x number:=0;

begin

select cods into vcods from series where titulo=z;

for m in cp loop
select nompla into vnompla from planetas where codpla=m.codpla;
dbms_output.put_line(vnompla);
x:=1;
end loop;

if x = 0 then
dbms_output.put_line('No hay visitas a planetas');
end if;

exception
when no_data_found then
dbms_output.put_line('Alert'||chr(10)||'Error...');

end;
/
show errors;


