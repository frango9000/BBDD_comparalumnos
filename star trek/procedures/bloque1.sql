-- anonima
set serveroutput on
declare
a integer;
b integer;
c integer;
begin
a:=&z;  -- entrada de teclado
b:=&v;
c:=a+b;




dbms_output.put_line(c);
end;
/

