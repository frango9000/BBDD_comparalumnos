-- pperser: dado el codigo de una serie imprimir los codigos de los personajes
create or replace procedure pperser( z interpretesser.codper%type) as
-- vcods visitas.cods%type;


cursor cups is select codper from interpretesser where cods=z;

begin
for v in cups loop
	
	dbms_output.put_line(v.codper);
end loop;
exception
when no_data_found then
dbms_output.put_line('Alert'||chr(10)||'Error...');

end;
/
show errors;


