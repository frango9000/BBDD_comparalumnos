create or replace procedure ppal(palabra varchar2) as
x varchar2(2);

begin
for z in reverse 1 .. length(palabra) loop
x:=substr(palabra,z, 2);
DBMS_output.put_line(x);

end loop;

exception
when no_data_found then
dbms_output.put_line('Alert'||chr(10)||'Error...');

end;
/
show errors;


