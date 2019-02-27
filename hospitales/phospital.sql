/*
phospital
procedimento que, pasandolle o nome dun hospital, imprima os nomes dos asegurados de 1ª categoria que foron hospitalizados nel .
 Se non ten asegurados de primeira categoria hospitalizados debe imprimirse a mensaxe 'este hospital non ten asegurados de 1º categoria hospitalizados'  
 Se o hospital non existe debe imprimirse a mensaxe adecuada (mediante tratamento de excepcions) .

execute phospital ('povisa');
andrea
dorotea

execute phospital ('sonic');
este hospital non ten asegurados de 1º categoria hospitalizados


execute phospital ('roma');
este hospital non existe
*/
create or replace procedure phospital(vnomh hospital.nomh%type) as

vcodh hospital.codh%type;
vnomas asegurado.nomas%type;

x number:=0;

cursor ccodp is select codp, numas from hosp1 where codh = vcodh;

begin


select codh into vcodh from hospital where nomh = vnomh;

for h in ccodp loop
	x:=1;
	select nomas into vnomas from asegurado where codp = h.codp and numas = h.numas;
	dbms_output.put_line(vnomas);
end loop;

if x = 0 then
	dbms_output.put_line('este hospital non ten asegurados de 1º categoria hospitalizados');
end if;


exception
when no_data_found then
dbms_output.put_line('este hospital non existe');

end;
/
show errors;
