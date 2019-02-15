/*
pcidade
procedimento que imprima para  un nome de cidade  os nomes das farm‡cias que se atopan nela e para cada farmacia os nomes dos farmaceuticos que traballan nela

*/
create or replace procedure pcidade(vnomc cidades.nomc%type) as

vcodc cidades.codc%type;
vcodf farmacias.codf%type;
vdnip persoas.dnip%type;
vnomp persoas.nomp%type;

cursor ccodf is select codf, nomf from farmacias where codc = vcodc;
cursor cdnip is select dnip from traballan where codf = vcodf and dnip in (select dnip from farmaceuticos);

begin
select codc into vcodc from cidades where nomc = vnomc;

for x in ccodf loop
	dbms_output.put_line('Farmacia '|| x.codf ||' '|| x.nomf);
	vcodf := x.codf;
	for y in cdnip loop
		select nomp into vnomp from persoas where dnip = y.dnip;
		dbms_output.put_line(chr(9)||'Persona ' || y.dnip || ' ' || vnomp);
	end loop;
end loop;

exception
when no_data_found then
dbms_output.put_line('Alert'||chr(10)||'Error...');

end;
/
show errors;


