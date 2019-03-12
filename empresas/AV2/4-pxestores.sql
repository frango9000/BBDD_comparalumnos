create or replace procedure pxestores as

vcod_xestor xestores.cod_xestor%type;

vcount number := 0;


cursor ccodx is select cod_xestor from xestores;
cursor cposto is select cod_posto, des_posto from postos where cod_xestor = vcod_xestor;


begin


for h in ccodx loop
	vcod_xestor := h.cod_xestor;
	dbms_output.put_line('xestor:' || h.cod_xestor);
	for i in cposto loop
		vcount := vcount + 1;
		dbms_output.put_line(chr(9)||i.cod_posto||'---'||i.des_posto);
	end loop;
	if vcount > 0 then
		dbms_output.put_line(chr(9)||'total: '|| vcount);
	else
		dbms_output.put_line(chr(9)||'este xestor non xestionou ningun posto');
	end if;
	
	vcount :=0;

end loop;



exception
when no_data_found then
dbms_output.put_line('Alert No Data Error...');

end;
/
show errors;



/*


SQL> @'/home/oracle/Desktop/compartido/empresas/4-pxestores.sql' 

Procedure created.

No errors.
SQL> execute pxestores;
xestor:x1
	p1---direc. dep. informatica
	p8---vendedor senora
	p11---disenador aplicacions
	p14---vendedor caballero
	p15---vendedor neno
	p16---vendedor viaxes
	p17---vendedor plantas
total: 7
xestor:x10
este xestor non xestionou ningun posto
xestor:x2
	p2---barrendeiro
	p7---xefe iluminacion
	p9---xefe xardineiros
	p10---instalador software
	p12---revisor ascensores
total: 5
xestor:x3
	p3---limpador colexios
	p6---perforador pozos
	p13---coidador parques
total: 3
xestor:x4
	p4---instalador ordenadores
total: 1
xestor:x5
	p342---empregado biblioteca
total: 1
xestor:x6
	p5---limpador instalaciones
total: 1
xestor:x7
este xestor non xestionou ningun posto
xestor:x8
este xestor non xestionou ningun posto
xestor:x9
	p18---vendedor plantas
total: 1

PL/SQL procedure successfully completed.


*/


