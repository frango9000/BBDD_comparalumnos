create or replace trigger tsospeita before insert on entrevista for each row
declare

vap1_persoa persoas.ap1_persoa%type;
vap2_persoa persoas.ap2_persoa%type;

vap1_xestor xestores.ap1_xestor%type;
vap2_xestor xestores.ap2_xestor%type;



begin
select ap1_persoa, ap2_persoa into vap1_persoa, vap2_persoa from persoas where num_persoa = :new.num_persoa;
select ap1_xestor, ap2_xestor into vap1_xestor, vap2_xestor from xestores where cod_xestor = (select cod_xestor from postos where cod_posto = :new.cod_posto);

if vap1_persoa = vap1_xestor and vap2_persoa = vap2_xestor then
	raise_application_error(-20001, 'non podes entrevistar a esta persoa para dito posto pois o xestor do posto ten os seus apelidos');
else
	dbms_output.put_line('entrevista aceptada pois a persona non ten os apelidos do xestor do posto');
end if;






exception
when no_data_found then
dbms_output.put_line('Alert No Data Error...');

end;
/
show errors;



/*

SQL> @'/home/oracle/Desktop/compartido/empresas/2-tsospeita.sql' 

Trigger created.

No errors.
SQL> insert into entrevista values('p18', 8, 'f', 'f');
insert into entrevista values('p18', 8, 'f', 'f')
            *
ERROR at line 1:
ORA-20001: non podes entrevistar a esta persoa para dito posto pois o xestor do
posto ten os seus apelidos
ORA-06512: at "HR.TSOSPEITA", line 16
ORA-04088: error during execution of trigger 'HR.TSOSPEITA'


SQL> insert into entrevista values('p9', 23, 'f', 'f');
entrevista aceptada pois a persona non ten os apelidos do xestor do posto

1 row created.



*/




