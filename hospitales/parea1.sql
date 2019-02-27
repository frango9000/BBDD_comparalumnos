-- sobre 8
/*
parea
procedemento que liste os codigos de todas as areas e para cada codigo de area os nomes dos asegurados de dita area xunto co numero total deles.
Se un area non ten asegurados debe imprimirse a mensaxe: area sen asegurados:

puntuacion:
amosar codigos de area: .5
amosar nomes de asegurados: 1
amosar numero total de asegurados: .25
amosar 'area sen asegurados' : .25 



execute parea;

codigo de area: a1
luis
agapito
ana
numero de asegurados: 4
codigo de area: a2
pedro
juan
carlos
numero de asegurados: 3
codigo de area: a3
bieito
numero de asegurados: 1
codigo de area: a4
xoan
eva
comba
ainara
numero de asegurados: 4
codigo de area: a5
dorotea
elisa
amalia
dolores
maria
xose
andrea
iria
antia
xana
numero de asegurados: 10
codigo de area: a6
area  sen asegurados
codigo de area: a7
jose
numero de asegurados: 1

*/

create or replace procedure parea as

vascount number;
vcoda area.coda%type;

cursor carea is select coda from area;
cursor cnomas is select nomas from asegurado where coda = vcoda;

begin

for h in carea loop
	dbms_output.put_line('codigo de area ' || h.coda );
	vcoda := h.coda;
	select count(*) into vascount from asegurado where coda = vcoda;
	for i in cnomas loop
		dbms_output.put_line(i.nomas);
	end loop;	
	if vascount = 0 then
		dbms_output.put_line('area sin asegurados');
	else
		dbms_output.put_line('numero de asegurados ' || vascount);
	end if;
end loop;


exception
when no_data_found then
dbms_output.put_line('Alert'||chr(10)||'Error...');

end;
/
show errors;



