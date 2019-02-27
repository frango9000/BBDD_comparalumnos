/*
tlimitepoliza
trigger que impida que unha mesma poliza teña mais de 2 asegurados

insert into asegurado values ('p15',3,'agapito','2/3/2000','a1');
    a poliza xa ten dos asegurados, rexeitado o terceiro
insert into asegurado values ('p14',3,'agapito','2/3/2000','a1');
    realizada insercion de novo asegurado
*/
create or replace trigger tlimitepoliza before insert on asegurado for each row
declare

vcount number;


begin
select count(*) into vcount from asegurado where codp = :new.codp;
if vcount > 1 then
	raise_application_error(-20001, 'a poliza xa ten dos asegurados, rexeitado o terceiro');
else
	dbms_output.put_line('realizada insercion de novo asegurado');
end if;





exception
when no_data_found then
dbms_output.put_line('Alert'||chr(10)||'Error...');
end;
/
show errors;
