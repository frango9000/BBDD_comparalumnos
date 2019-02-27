/*
parea
procedemento chamada parea que pasandolle como parametro o codigo dunha  area devolte os nomes dos asegurados que proceden de dita area asi como si son de 1º ou 2ª categoria. si o asegurado ainda non se lle asignou categoria a mensaxe debe ser ' e un asegurado sen categoria asignada' . Se a area non ten asegurados ou non existe debe imprimirese 'area sen asegurados ou  inexistente'.


 execute parea('a1');
luis  e un asegurado de  categoria 1
agapito  e un asegurado sen categoria asignada 
ana categoria 2
 execute parea('a6');
area sen asegurados ou non existente

 execute parea('a17');
area sen asegurados ou non existente
*/
create or replace procedure parea2(vcoda area.coda%type) as

vcountcat1 number;
vcountcat2 number;
flagx number := 0;
vasegurado varchar2(100);

cursor ccodp is select codp, numas, nomas from asegurado where coda = vcoda;

begin
for h in ccodp loop
	
	select count(*) into vcountcat1 from a1c where codp = h.codp and numas = h.numas;
	select count(*) into vcountcat2 from a2c where codp = h.codp and numas = h.numas;
	if vcountcat1 > 0 then
		dbms_output.put_line(h.nomas || ' es un asegurado de categoria 1');
	elsif vcountcat2 > 0 then 
		dbms_output.put_line(h.nomas || ' es un asegurado de categoria 2');
	else 
		dbms_output.put_line(h.nomas || ' es un asegurado sin categoria asignada');
	end if;
	flagx:=1;
end loop;
if flagx = 0 then
	dbms_output.put_line('area sen asegurados ou non existente');
end if;
	

exception
when no_data_found then
dbms_output.put_line('Alert'||chr(10)||'Error...');

end;
/
show errors;

