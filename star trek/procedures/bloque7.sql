create or replace procedure pcod(z varchar2) as

cursor cpla is select codpla,codn from visitas where cods= z;

begin

for m in cpla loop

dbms_output.put_line(m.codpla||' '||m.codn);
end loop;


end;
/
show errors;


