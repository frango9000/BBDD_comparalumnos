-- dado el cod de una poblacion devuelva los nombres de balnearios
-- en cada balneario, cada tipo de agua
create or replace procedure pbalaug(vnomp poboacions.codp%type) as

k number:=0;
l number;
vcodp poboacions.codp%type;
cursor cpob is select nomb, codb from balnearios where codp=vcodp;

vcodb ten.codb%type;
cursor caug is select coda from ten where codb=vcodb;

vtipo augas.tipo%type;
vcoda augas.coda%type;
cursor ccodz is select codz from indicadas where coda=vcoda;

vnomz zonas_corporais.nomz%type;
vcodz zonas_corporais.codz%type;
cursor cnif is select nif from pacientes where nif in (select nif from padecen where codz=vcodz) and codp = vcodp;
-- cursor cnif is select nif from padecen where codz=vcodz and nif in (select nif from pacientes where codp = vcodp);

vnompa pacientes.nomp%type;


begin
select codp into vcodp from poboacions where nomp=vnomp;

for x in cpob loop
	dbms_output.put_line(x.nomb);
	vcodb := x.codb;
	l:=0;
	for y in caug loop
		l:=1;
		select tipo into vtipo from augas where coda = y.coda;
		vcoda:=y.coda;
		dbms_output.put_line(chr(9)||y.coda||':'||vtipo);
		for z in ccodz loop
			select nomz into vnomz from zonas_corporais where codz=z.codz;
			dbms_output.put_line(chr(9)||chr(9)||z.codz||':'||vnomz);
			vcodz := z.codz;
			for w in cnif loop
				select nomp into vnompa from pacientes where nif = w.nif;
				dbms_output.put_line(chr(9)||chr(9)||chr(9)||w.nif||':'||vnompa);
			end loop;
		end loop;
	end loop;

	if l = 0 then
		dbms_output.put_line(chr(9)||'Este balneario no tiene aguas.');
	end if;
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
