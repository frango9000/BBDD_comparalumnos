create or replace trigger tmaxog before insert on xogador for each row
declare                -- obligatorio en los trigger
contaequ number;

begin
 select count(*) into contaequ from xogador where codequ=:new.codequ;

if contaequ > 4 then
	raise_application_error(-20001, 'equipo ya tiene maximo de jugadores (5)');
else
	dbms_output.put_line('insertado jugador al equipo '|| :new.codequ);
end if;

exception
when no_data_found then
dbms_output.put_line('Alert'||chr(10)||'Error...');

end;
/
show errors;
