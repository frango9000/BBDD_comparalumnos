-- pplacod: dado el codigo de un planeta imprimir los codigos de las series que lo visitan
create or replace procedure pplacod( z visitas.codpla%type) as
cursor cupla is select cods from visitas where codpla =z;

begin
for v in cupla loop
	dbms_output.put_line(v.cods);
end loop;

exception
when no_data_found then
dbms_output.put_line('Alert'||chr(10)||'Error...');

end;
/
show errors;


