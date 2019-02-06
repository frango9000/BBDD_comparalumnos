create or replace trigger tsalario before update of salario on xogador  -- each row
declare  -- si hay q declarar algo

a integer;

begin
dbms_output.put_line('modificado');

end;
/
show errors;
