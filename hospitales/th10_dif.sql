/*
-- set serveroutput on
-- th10 
--impedir que se poida hospitalizar a un asegurado de 2ª categoría si o médico que realiza a hospitalización non esta adscrito a mesma area da que procede o paciente
--insert into hosp2 values('h1','p11',1,'m1','1/1/1970','1/2/1970');
-- o médico  non esta adscrito a mesma area da que procede o paciente
--insert into hosp2 values('h1','p1',1,'m1','1/1/1970','1/2/1970');
--asegurado non existente ou non de 2ª categoria
--insert into hosp2 values('h1','p1',2,'m1','1/1/1970','1/2/1970');
-- inserci—n levada a cabo
*/
create or replace trigger th10 before insert on hosp2 for each row
declare

vcount number;
vcat2 number;

vcodap area.coda%type;


begin
select count(*) into vcat2 from a2c where codp = :new.codp and numas = :new.numas;
select coda into vcodap from asegurado where codp = :new.codp and numas = :new.numas;
select count (*) into vcount from adscrito where codm = :new.codm and coda = vcodap;

if vcat2 = 1 then
	if vcount = 0 then
		raise_application_error(-20001, 'o médico  non esta adscrito a mesma area da que procede o paciente');
	else 
		dbms_output.put_line('inserci—n levada a cabo');
	end if;	
else 
	raise_application_error(-20001, 'asegurado non existente ou non de 2ª categoria');
end if;

exception
when no_data_found then
dbms_output.put_line('Alert'||chr(10)||'Error...');
end;
/
show errors;


