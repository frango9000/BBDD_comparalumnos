create or replace trigger txogadorequ before update of codequ, datan on xogador  -- each row
declare  -- si hay q declarar algo

a integer;

begin
dbms_output.put_line('modificadoss');

end;
/
show errors;
