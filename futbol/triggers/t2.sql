create or replace trigger tsalarios before update on xogador  -- each row
declare  -- si hay q declarar algo

a integer;

begin
dbms_output.put_line('modificados');

end;
/
show errors;
