-- impedir modificar el salario de un xogador si el nuevo salario es mas que el de el que cobre mas
create or replace view vxogador as select * from xogador;
create or replace trigger tsalariotope instead of update  on vxogador for each row 

declare
salariotope number;

begin
-- instead of update of column on table
if updating ('salario') then
select max(salario) into salariotope from xogador;

if :new.salario > salariotope then
	dbms_output.put_line('No puede superar el salario maximo ('||salariotope||')');
else 
	dbms_output.put_line('Nuevo salario aceptado');
	update xogador set salario  = :new.salario where codx = :new.codx;
end if;
end if;


exception
when no_data_found then
dbms_output.put_line('Alert'||chr(10)||'Error...');




end;
/
show errors;
