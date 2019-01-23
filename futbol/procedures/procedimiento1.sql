-- pestadiopartidos(nombre de estadio) >codest> codigo de partidos
create or replace procedure pestadiospartidos(z estadio.nomest%type) as
vcodest estadio.codest%type;

cursor ccpartido is select codpar from partido where codest = vcodest;


begin
select codest into vcodest from estadio where nomest=z;
dbms_output.put_line(vcodest);

for x in ccpartido loop
dbms_output.put_line(x.codpar);
end loop;

exception
when no_data_found then
dbms_output.put_line('Alert'||chr(10)||'Error...');

end;
/
show errors;

