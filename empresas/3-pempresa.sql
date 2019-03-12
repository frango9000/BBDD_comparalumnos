create or replace procedure pempresa(vnom_empresa empresas.nom_empresa%type) as

vcod_empresa empresas.cod_empresa%type;
flag number := 0;

cursor ccodposto is select cod_posto from postos where cod_empresa = vcod_empresa;

begin

select cod_empresa into vcod_empresa from empresas where nom_empresa = vnom_empresa;

for h in ccodposto loop
	flag := 1;
	dbms_output.put_line(h.cod_posto);
end loop;

if flag = 0 then
	dbms_output.put_line('empresa sen postos ofertados');
end if;




exception
when no_data_found then
dbms_output.put_line('empresa inexistente');

end;
/
show errors;



/*

SQL> @'/home/oracle/Desktop/compartido/empresas/3-pempresa.sql' 

Procedure created.

No errors.
SQL> execute pempresa('arbolasa');
p2
p9
p13

PL/SQL procedure successfully completed.

SQL> execute pempresa('marmorasa');
empresa sen postos ofertados

PL/SQL procedure successfully completed.

SQL> execute pempresa('cenpes');
empresa inexistente

PL/SQL procedure successfully completed.



*/



