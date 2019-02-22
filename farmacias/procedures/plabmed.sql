-- procedimiento que imprima los nombres de los laboratorios y en cada uno, los medicamentos que fabrican

create or replace procedure plabmed as
vcif laboratorios.cif%type;
vnoma accions.noma%type;

cursor clab is select noml, cif from laboratorios;
cursor cmed is select nomm, coda  from medicamentos where cif = vcif;
begin

for vlab in clab loop
	vcif := vlab.cif;
	dbms_output.put_line(vcif|| ' ' || vlab.noml);
	for vmed in cmed loop
		select noma into vnoma from accions where coda = vmed.coda;
		dbms_output.put_line(chr(9)||vmed.nomm || ' ' || vnoma);
		
	end loop;

end loop;



exception
when no_data_found then
dbms_output.put_line('Farmacia no existe.');

end;
/
show errors;
