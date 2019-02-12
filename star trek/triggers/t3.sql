-- impedir que una pelicula insertada tenga un titulo igual al titulo de alguna serie
create or replace trigger tmesmotitulo before insert on peliculas for each row
declare
cont number;


begin
select count(*) into cont from series where titulo = :new.titulo;
if cont > 0 then
	raise_application_error(-20001, 'ya hay una serie con este titulo)');
else
 	dbms_output.put_line('insertado.');
end if;

exception
when no_data_found then
dbms_output.put_line('Alert'||chr(10)||'Error...');

end;
/
show errors;
