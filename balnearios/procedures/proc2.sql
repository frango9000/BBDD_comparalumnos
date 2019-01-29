-- C select codb from balnearios where costed = 100;
-- S  select codp from balnearios where codb = 'b1';
-- C  select codb from balnearios where codp = 'p1';
-- S  select nomp from poboacions where codp = 'p2';
-- C  select codp from poboacions where nomp = 'arteixo';

-- dado el cod de una poblacion devuelva los nombres de balnearios
create or replace procedure pbalpob(vnomp poboacions.codp%type) as

k number:=0;
vcodp poboacions.codp%type;
cursor cpob is select nomb from balnearios where codp=vcodp;

begin
select codp into vcodp from poboacions where nomp=vnomp;

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
