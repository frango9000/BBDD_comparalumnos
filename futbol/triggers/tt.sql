-- impedir modificar el salario de un xogador si el nuevo salario es mas que el de el que cobre mas
create or replace view vxogador as select * from xogador;
create or replace trigger tsalariotope before update of salario on xogador for each row
declare
salariotope number;

begin
select max(salario) into salariotope from vxogador;

if :new.salario > salariotope then
	raise_application_error(-20001, 'No puede superar el salario maximo ('||salariotope||')');
else 
	dbms_output.put_line('Nuevo salario aceptado');
	
end if;



exception
when no_data_found then
dbms_output.put_line('Alert'||chr(10)||'Error...');
end;
/
show errors;
