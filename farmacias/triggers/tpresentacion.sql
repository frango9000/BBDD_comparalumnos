/*
 tpresentacion
Impedir que se poda rexistrar no stock de unha farmacia un  medicamento do que xa hai mais de tres unidades en stock (independentemente da sua presentacion) si ademais esa farmacia esta nuha cidade onde hai polo menos unha farmacia mais.


--insert into stock values(1,1,5,1);
--rexeitada insercion , habia mais de tres unidades de ese medicamento en stock e hai mais dunha farmacia nesa cidade

--insert into stock values(7,9,3,1);
-- insercion rexistrada ,hai mais de tres unidades de ese medicamento en stock pero so hai esa farmacia nesa cidade

--insert into stock values(1,2,5,1);
--mensaxe: insercion rexistrada , no habia mais de tres unidades de ese medicamento nesa farmacia
*/create or replace trigger tpresentacion before insert on stock for each row
declare
vcant stock.cantidads%type;
vcodc farmacias.codc%type;
vcount number;



begin
select sum(cantidads) into vcant from stock where codm = :new.codm and codf = :new.codf;
select codc into vcodc from farmacias where codf = :new.codf;
select count(*) into vcount from farmacias where codc = vcodc;
if vcant > 3 and vcount > 1 then
	raise_application_error(-20001, 'C: rechazada , habia mais de tres unidades de ese medicamento en stock e hai mais dunha farmacia nesa cidade');
elsif vcant > 3 and vcount = 1 then
	dbms_output.put_line('C: aceptada: hai mais de tres unidades de ese medicamento en stock pero so hai esa farmacia nesa cidade');
else
	dbms_output.put_line('C: aceptada');
end if;




exception
when no_data_found then
dbms_output.put_line('Farmacia no existe.');

end;
/
show errors;
