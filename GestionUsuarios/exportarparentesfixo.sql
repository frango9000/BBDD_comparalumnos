set heading off
set echo off
set feedback off
set linesize 1000
set newpage none
set trimspool on
set termout off
spool '/home/oracle/Desktop/ParenteFixo/par_fixo.txt'
 select rpad (numero,3,' ')||rpad(nvl(nome,' '),8,' ')||rpad(nvl(apelidos,' '),15,' ')||nvl(sexo,' ')||to_char(datan,'YYYYMMDD') from parentes;

spool off
set heading on
set feedback
set newpage 1
set termout on
