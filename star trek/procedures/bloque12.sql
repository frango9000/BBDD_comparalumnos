create or replace procedure ppelklingon as
vcodpel peliculas.codpel%type;
vnomper personaxes.nomper%type;
cursor cpel is select codpel, titulo from peliculas;
cursor cper is select codper from interpretespel where codper in(select codper from klingon) and codpel = vcodpel;
x number;
c number;

begin
for v in cpel loop
	dbms_output.put_line(v.titulo);
	vcodpel:=v.codpel;
	x:=0;
	for z in cper loop
		-- dbms_output.put_line(z.codper);
		select nomper into vnomper from personaxes where codper = z.codper;
		dbms_output.put_line(chr(9)||vnomper);
		x:=x+1;
	end loop;
	dbms_output.put_line(c);
	if x = 0 then
		dbms_output.put_line(chr(9)||chr(9)||'En esta pelicula no participan klingon');
	elsif x = 1 then
		dbms_output.put_line(chr(9)||chr(9)||'En esta pelicula participa '|| x ||' klingon');
	else
		dbms_output.put_line(chr(9)||chr(9)||'En esta pelicula participan '|| x ||' klingon');
	end if;
end loop;

exception
when no_data_found then
dbms_output.put_line('Alert'||chr(10)||'Error...');

end;
/
show errors;


