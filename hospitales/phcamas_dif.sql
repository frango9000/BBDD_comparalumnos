/*
phcamas:
 
procedimento que, pasandolle o numero de camas como parametro, devolte os nomes dos hospitais propios  que as superan asi como os nomes dos hospitalizados de 1º categoria que estiveron neles, e o seu total. Se ningun hospital propio supera o numero de camas a mensaxe debe ser: 'ningun hospital propio supera ese numero de camas'
Si agun dos hospitais non ten hospitalizados de 1ª categoria a mensaxe debe ser : 'hospital sen hospitalizados'.




Ex: 
execute phcamas(150);
  hospital: canalejo
      dolores
      dolores
    o numero de hospitalizados e : 2

  hospital: meixoeiro
    hospital sen hospitalizados

  hospital: paz
    andrea
    o numero de hospitalizados e : 1
Ex: 
execute phcamas(3000);
     ningun hospital propio supera ese numero de camas
*/
create or replace procedure phcamas(ncamas number) as

vcodh hospital.codh%type;
vnomas asegurado.nomas%type;
vcounthosp number;
flagx number := 0;

cursor cvalidh is select codh, nomh from hospital where numc >= ncamas;
cursor cnomas is select codp, numas from hosp1 where codh = vcodh;


begin

for h in cvalidh loop
	vcodh := h.codh;
	dbms_output.put_line('Hospital: ' || h.nomh);
	select count(*) into vcounthosp from hosp1 where codh = h.codh;
	for i in cnomas loop
		select nomas into vnomas from asegurado where codp = i.codp and numas = i.numas;
		dbms_output.put_line(vnomas);
	end loop;	
	if vcounthosp > 0 then
		dbms_output.put_line('Numero de Hospitalizados: ' || vcounthosp);
	else
		dbms_output.put_line('hospital sen hospitalizados');
	end if;
	flagx := 1;
end loop;
if flagx = 0 then
	dbms_output.put_line('ningun hospital propio supera ese numero de camas');
end if;



exception
when no_data_found then
dbms_output.put_line('Alert'||chr(10)||'Error...');

end;
/
show errors;

