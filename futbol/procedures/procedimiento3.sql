-- pestadiopartidos(nombre de estadio) >codest> codigo de partidos
create or replace procedure pparcol(z interven.codpar%type) as
cursor ccodc is select codc from interven where codpar = z;
vcodc interven.codc%type;
vnomc colexiado.nomc%type;
j number:=0;
k number:=0;
begin
select count(*) into k from partido where codpar=z;
if k >0 then
	for x in ccodc loop
		j:=1;
		dbms_output.put_line(x.codc);
		vcodc := x.codc;
		select nomc into vnomc from colexiado where codc=vcodc;
		dbms_output.put_line(chr(9)||vnomc);
	end loop;
	if j = 0 then	
		dbms_output.put_line('En el partido '||z||' no intervienen colegiados');
	end if;
else
	dbms_output.put_line('El partido '||z||' no existe');
end if;

exception
when no_data_found then
dbms_output.put_line('Alert'||chr(10)||'Error...');

end;
/
show errors;

