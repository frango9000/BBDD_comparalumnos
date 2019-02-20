/*
pfarmacias
procedemento tal que pasándolle como parámetro o nome duna farmacia devolte o nomes dos seus farmaceuticos que naceran na mesma cidade na que se atopa a farmacia.

parámetro pasado e mensaxe de asida:

cacharro1  —  luis
cacharro6  —  roberto
cacharro7   — azucean,soledad
cacharro8  — non ten asignado persoal farmaceutico
cacharro9 — non ten asignado nengun personal
cacharro10 — ten farmacéuticos pero non nacidos na mesa cidade da farmacia
cacharrox  farmacia non existente
*/

create or replace procedure pfarmacias(vnomf farmacias.nomf%type) as
vcodf farmacias.codf%type;
vcodc farmacias.codc%type;
vnomp persoas.nomp%type;
vfarmaceutasnombres varchar2(500);
vcounttrabajadores number;
vcountfarmaceutas number;
f number;

cursor cdnip is select dnip from farmaceuticos where dnip in ( select dnip from traballan where codf = vcodf) and codc = vcodc;

begin
f:=0;
select codf, codc into vcodf, vcodc from farmacias where nomf=vnomf;
select count(*) into vcounttrabajadores from traballan where codf = vcodf;
select count(*) into vcountfarmaceutas from traballan where codf = vcodf and dnip in ( select dnip from farmaceuticos );


for x in cdnip loop
	select nomp into vnomp from persoas where dnip = x.dnip;
	vfarmaceutasnombres := vfarmaceutasnombres || ' ' || vnomp;
	f := f + 1;
end loop;

if f > 0 then
	dbms_output.put_line(vnomf || ' ' || vfarmaceutasnombres);
elsif vcountfarmaceutas > 0 then 
	dbms_output.put_line('ten farmacéuticos pero non nacidos na mesa cidade da farmacia');
elsif vcounttrabajadores > 0 then
	dbms_output.put_line('non ten asignado persoal farmaceutico');
elsif vcounttrabajadores = 0 then
	dbms_output.put_line('non ten asignado nengun personal');
end if;
	
exception
when no_data_found then
dbms_output.put_line('Farmacia no existe.');

end;
/
show errors;
