/*
fmedico_area
Funcion tal que pasandolle o codigo dun medico , liste os nomes dos codigos de area aos que esta adscrito asi como o numero de  habitantes de dita area.
Se o codigo do medico non existe imprimir a mensaxe: 'codigo de medico inexistente'


execute dbms_output. put_line(fmedicoarea('m1'));
a1 : 12
a2 : 15

execute dbms_output. put_line(fmedicoarea('m2'));
a1 : 12

execute dbms_output. put_line(fmedicoarea('m8'));
codigo de medico inexistente
*/
create or replace function fmedicoarea(vcodm medico.codm%type) return varchar2 as

vcount number;
x number :=0;

ret varchar2(500);

cursor ccoda is select coda from adscrito where codm = vcodm;

begin

for h in ccoda loop
	x:=1;
	select numh into vcount from area where coda = h.coda;
	ret :=ret || h.coda || ' : ' || vcount || chr(10);
end loop;

if x = 0 then
	 ret := 'codigo de medico inexistente';
end if;


return ret;

exception
when no_data_found then

dbms_output.put_line('err');
end;
/
show errors;

