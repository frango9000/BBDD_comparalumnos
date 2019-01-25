-- pestadiopartidos(nombre de estadio) >codest> codigo de partidos
create or replace procedure pestadiosjugadores(z estadio.nomest%type) as
vcodest estadio.codest%type;

cursor ccodpar is select codpar from partido where codest = vcodest;
vfcodpar partido.codpar%type;
cursor ccodx is select codx from xoga where codpar = vfcodpar;
j number;
k number;

begin
select codest into vcodest from estadio where nomest=z;
dbms_output.put_line('Estadio: '||vcodest);
j:=0;
for x in ccodpar loop
	j:=1;
	k:=0;
	dbms_output.put_line(chr(9)||x.codpar);
	vfcodpar:=x.codpar;
	for y in ccodx loop
		k:=1;
		dbms_output.put_line(chr(9)||chr(9)||y.codx);
	end loop;
	if k=0 then
		dbms_output.put_line(chr(9)||'Este partido no tiene jugadores');
	end if;		
end loop;

if j=0 then
	dbms_output.put_line('Este estadio no tiene partidos');
end if;

exception
when no_data_found then
dbms_output.put_line('Alert'||chr(10)||'Error...');

end;
/
show errors;

