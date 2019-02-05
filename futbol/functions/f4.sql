create or replace function fcontxog return number as
vsalario xogador.salario%type;


begin
select count(*) into vsalario from xogador;
return vsalario;


end;
/
show errors;
