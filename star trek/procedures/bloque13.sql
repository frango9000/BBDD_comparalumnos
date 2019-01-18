-- pplan: dado un nombre de planeta imprimir codigo
create or replace procedure pplan( z planetas.nompla%type) as
vcodpla planetas.codpla%type;


begin
select codpla into vcodpla from planetas where nompla = z;
dbms_output.put_line(vcodpla);

exception
when no_data_found then
dbms_output.put_line('Alert'||chr(10)||'Error...');

end;
/
show errors;


