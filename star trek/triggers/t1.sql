create or replace trigger th before insert on humanos for each row
declare                -- obligatorio en los trigger
contav number;
contak number;
contap number;

begin
select count(*) into contap from personaxes where codper = :new.codper;
select count(*) into contav from vulcanos   where codper =:new.codper;
select count(*) into contak from klingon    where codper =:new.codper;

if contap = 0 then
	raise_application_error(-20001, 'personaje inexistente');
elsif contav > 0 then
	raise_application_error(-20001, 'ya pertenece a raza vulcano');
elsif contak > 0 then
	raise_application_error(-20001, 'ya pertenece a raza klingon');
else
	dbms_output.put_line('insertado humano');
end if;

exception
when no_data_found then
dbms_output.put_line('Alert'||chr(10)||'Error...');

end;
/
show errors;

