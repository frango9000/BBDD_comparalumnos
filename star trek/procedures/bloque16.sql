-- pplan: dado un nombre de planeta imprimir codigo
-- pplacod: dado el codigo de un planeta imprimir los codigos de las series que lo visitan
-- pperser: dado el codigo de una serie imprimir los codigos de los personajes
create or replace procedure pplanper( z planetas.nompla%type) as
vcodpla planetas.codpla%type;
cursor ccods is select cods from visitas where codpla =vcodpla;
vfcods series.cods%type;
cursor ccodper is select codper from interpretesser where cods=vfcods;

begin

select codpla into vcodpla from planetas where nompla = z;

for f in ccods loop

	 dbms_output.put_line(f.cods);
	 vfcods:=f.cods;
	 for m in ccodper loop	
		dbms_output.put_line(chr(9)||m.codper);
	 end loop;
end loop;

exception
when no_data_found then
dbms_output.put_line('Alert'||chr(10)||'Error...');

end;
/
show errors;


