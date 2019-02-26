/* trigger tfarmaceutico 
impedir que nunha mesma farmacia traballe mais dun farmaceutico, a menos que o novo farmaceutico sexa da mesma cidade na que esta a a farmacia:

insert into traballan values (6,3680) ;
'insercion rexistrada , ainda que haxa mais dun farmaceutico nesta farmacia, o novo  farmaceutico e da mesma cidade que a  farmacia'

insert into traballan values (5,3680) ;
'insercion rexeitada, o novo farmaceutico non da mesma cidade que a farmacia'

insert into traballan values (8,3680) ;
'insercion rexistrada , e o primeiro farmaceutico desta farmacia'
*/
create or replace trigger tfarmaceutico before insert on traballan for each row
declare

vcount number;
vcountt number;
vfarmaciacodc farmacias.codc%type;
vfarmaceutacodc farmaceuticos.codc%type;



begin
select count(*) into vcountt from farmaceuticos where dnip = :new.dnip;

if vcountt = 1 then
	select count(*) into vcount from traballan where codf = :new.codf and dnip in (select dnip from farmaceuticos);
	if vcount > 0 then
		select codc into vfarmaciacodc from farmacias where codf = :new.codf;
		select codc into vfarmaceutacodc from farmaceuticos where dnip = :new.dnip;
		if vfarmaciacodc = vfarmaceutacodc then
			dbms_output.put_line('insercion rexistrada , ainda que haxa mais dun farmaceutico nesta farmacia, o novo  farmaceutico e da mesma cidade que a  farmacia');
		else		
			raise_application_error(-20001, 'insercion rexeitada, o novo farmaceutico non da mesma cidade que a farmacia');
		end if;
	else
		dbms_output.put_line('insercion rexistrada , e o primeiro farmaceutico desta farmacia');
	end if;
end if;
	




exception
when no_data_found then
dbms_output.put_line('Err...');

end;
/
show errors;
