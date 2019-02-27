/*
th1 
impedir que se poida hospitalizar a un asegurado de 1ª categoría nun hospital concertado si o médico non está adscrito a mesma area que ten asignada dito hospital concertado. En caso contrario debe levarse a cabo a hospitalizacion.
Se o asegurado ( sempre nos referimos ao de 1ª categoria) se hospitaliza nun hospital propio non se ten en conta a restriccion anterir, e decir a hospitalizacion e immediata). 

insert into hosp1 values('h8','p4',2,'m1','1/1/1970','1/2/1970');
 o medico non está adscrito a mesma area que ten asignada dito hospital concertado
insert into hosp1 values('h5','p4',2,'m1','1/1/1980','1/2/1980');
inserción levada a cabo
insert into hosp1 values('h1','p4',2,'m1','1/1/1970','1/2/1970');
realizada insercion en hospital propio
*/

create or replace trigger th1 before insert on hosp1 for each row
declare

vcat1 number;
vhconcert number;
vcountarea number;


vcodah area.coda%type;
vcodam area.coda%type;



begin
select count(*) into vcat1 from a1c where codp = :new.codp and numas = :new.numas;
select count(*) into vhconcert from concertado where codh = :new.codh;

if vcat1 = 1 and vhconcert = 1 then
	select coda into vcodah from concertado where codh = :new.codh;
	select count(*) into vcountarea from adscrito where codm = :new.codm and coda = vcodah;
		if vcountarea = 0 then
			raise_application_error(-20001, 'o medico non está adscrito a mesma area que ten asignada dito hospital concertado');
		else 
			dbms_output.put_line('inserción levada a cabo');
		end if;
elsif vcat1 = 1 and vhconcert = 0 then
	dbms_output.put_line('realizada insercion en hospital propio');
else dbms_output.put_line('asegurado de 2da cat');
end if;


exception
when no_data_found then
dbms_output.put_line('Alert'||chr(10)||'Error...');
end;
/
show errors;
