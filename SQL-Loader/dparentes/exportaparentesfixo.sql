set echo off
set heading off
set feedback off
set linesize 1000
set newpage none
set trimspool on
set termout off

spool par_fixo.txt
select rpad(numero,3,' ')||rpad(nome,8,' ')||rpad(nvl(apelidos,' '),14,' ')||rpad(sexo,1,' ')||to_char(datan,'YYYYMMDD') from parentes;
spool off

set heading on
set feedback on
set termout on


select data_type, data_length from user_tab_columns where table_name = 'PARENTES' and column_name='APELIDOS';

