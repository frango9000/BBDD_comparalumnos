create or replace procedure pplanetas(z series.titulo%type) as

cursor cpla is select nompla from planetas where codpla in ( select codpla from visitas where cods in (select cods from series where titulo =z));

begin

for m in cpla loop

dbms_output.put_line(m.nompla);
end loop;


end;
/
show errors;


