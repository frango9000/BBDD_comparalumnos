/*
timpide
trigger que impida que un asegurado de 2» categoria poda rexistrarse tamen como asegurado de 1» categoría
 
 insert into a1c values('p15',1);
   o asegurado xa o e de 2» categoria
 insert into a1c values('p15',2);
   realizada insercion de asegurado de 1» categoria
*/create or replace trigger timpide before insert on a1c for each row
declare

vcount number :=0;

begin
select count(*) into vcount from a2c where codp = :new.codp and numas = :new.numas;
if vcount = 0 then
	dbms_output.put_line('realizada insercion de asegurado de 1» categoria');
else
	raise_application_error(-20001, 'o asegurado xa o e de 2» categoria');
end if;




exception
when no_data_found then
dbms_output.put_line('Alert'||chr(10)||'Error...');
end;
/
show errors;
