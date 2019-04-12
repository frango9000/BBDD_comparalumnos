set echo off
set heading off
set feedback off
set linesize 1000
set newpage none
set trimspool on
set termout off

spool par_variable.txt
select numero||','||nome||','||apelidos||','||sexo||','||to_char(datan,'YYYMMDD') from parentes;
spool off

set heading on
set feedback on
set termout on
