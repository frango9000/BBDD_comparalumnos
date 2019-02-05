create or replace function fsalariomedio return number as
vsalario xogador.salario%type;


begin
select avg(salario) into vsalario from xogador;
return vsalario;


end;
/
show errors;
