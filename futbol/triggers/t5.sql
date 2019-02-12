-- impedir que en un estadio entrene mas de un equipo en el mismo año
create or replace trigger tocupaestadio before insert on adestra for each row
declare
countocupado number;



begin
select count(*) into countocupado from adestra where ano = :new.ano and codest = :new.codest;

if countocupado > 0 then
	raise_application_error(-20001, 'estadio '||:new.codest||' ya esta ocupado este año('||:new.ano||')');
else
 	dbms_output.put_line('insertado. Equipo '||:new.codequ||' entrena en el estadio'||:new.codest||' en el año '||:new.ano);
end if;

exception
when no_data_found then
dbms_output.put_line('Alert'||chr(10)||'Error...');

end;
/
show errors;


