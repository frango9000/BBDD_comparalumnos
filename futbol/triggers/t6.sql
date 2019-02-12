-- impedir que en un mismo partido haxa mas de un jugador jugando en el mismo puesto
create or replace trigger tpostoxoga before insert on xoga for each row
declare
contapuesto number;



begin
select count(*) into contapuesto from xoga where codpar = :new.codpar and posto = :new.posto;
if contapuesto > 0 then
	raise_application_error(-20001, 'puesto '||:new.posto||' ya esta ocupado este partido('||:new.codpar||')');
else
 	dbms_output.put_line('insertado. jugador '||:new.codx||' juega en el partido'||:new.codpar||' en el puesto '||:new.posto);
end if;

exception
when no_data_found then
dbms_output.put_line('Alert'||chr(10)||'Error...');

end;
/
show errors;
