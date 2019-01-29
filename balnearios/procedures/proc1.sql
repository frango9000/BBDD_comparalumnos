-- C select codb from balnearios where costed = 100;
-- S  select codp from balnearios where codb = 'b1';
-- C  select codb from balnearios where codp = 'p1';
-- S  select nomp from poboacions where codp = 'p2';
-- C  select codp from poboacions where nomp = 'arteixo';

-- dado el cod de una poblacion devuelva los nombres de balnearios
create or replace procedure pbalpob(z balnearios.codp%type) as

k number:=0;
cursor cpob is select nomb from balnearios where codp=z;

begin
for x in cpob loop
	dbms_output.put_line(x.nomb);
	k:=1;
end loop;

if k = 0 then
	dbms_output.put_line('No hay balnearios.');
end if;

	

exception
when no_data_found then
dbms_output.put_line('Alert'||chr(10)||'Error...');

end;
/
show errors;
