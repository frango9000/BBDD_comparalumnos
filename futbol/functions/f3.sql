create or replace function fsalariosuma return number as
vsalario xogador.salario%type;


begin
select sum(salario) into vsalario from xogador;
return vsalario;


end;
/
show errors;
