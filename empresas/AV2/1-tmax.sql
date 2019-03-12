create or replace trigger tmax before insert on entrevista for each row
declare

vcount number;



begin
select count(*) into vcount from entrevista where num_persoa = :new.num_persoa;

if vcount > 2 then
	raise_application_error(-20001, 'non podes entrevistar a esta persoa, xa fois entrevistada tres veces');
else
	dbms_output.put_line('entrevista aceptada');
end if;





exception
when no_data_found then
dbms_output.put_line('Alert No Data Error...');

end;
/
show errors;

/*


SQL> @'/home/oracle/Desktop/compartido/empresas/1-tmax.sql' 

Trigger created.

No errors.
SQL> insert into entrevista values('p14', 5, 'f', 'f');
insert into entrevista values('p14', 5, 'f', 'f')
            *
ERROR at line 1:
ORA-20001: non podes entrevistar a esta persoa, xa fois entrevistada tres veces
ORA-06512: at "HR.TMAX", line 11
ORA-04088: error during execution of trigger 'HR.TMAX'


SQL> insert into entrevista values('p9', 4, 'f', 'f');
entrevista aceptada

1 row created.


*/

