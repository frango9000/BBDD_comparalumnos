clear screen;
show user;
set autocommit on
set pagesize 1000
set linesize 80
set serveroutput on
describe <table>
commit;
exit;

conn sys/oracle as sysdba
shutdown immediate
startup
conn hr/hr