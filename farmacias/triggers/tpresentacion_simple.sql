/*
-- insert into stock values(1,1,5,1);
-- rexeitada insercion , habia mais de tres unidades de ese medicamento en stock 

-- insert into stock values(7,9,3,1);
-- insercion rexeitada ,habiai mais de tres unidades de ese medicamento en stock 

-- insert into stock values(1,2,5,1);
-- mensaxe: insercion rexistrada , non habia mais de tres unidades de ese medicamento en stock

 tpresentacion_simple
Impedir que se poda rexistrar no stock de unha farmacia un  medicamento do que xa hai mais de tres unidades do mesmo en stock independentemente da sua presentacion
*/
create or replace trigger tpresentacionsimple before insert on stock for each row
declare
vcant stock.cantidads%type;




begin
select sum(cantidads) into vcant from stock where codm = :new.codm and codf = :new.codf;

if vcant > 3 then
	raise_application_error(-20001, 'S: ya tenemos mas de 3 uds de ese medicamento');
else
	dbms_output.put_line('S: aceptada');
end if;




exception
when no_data_found then
dbms_output.put_line('Farmacia no existe.');

end;
/
show errors;
