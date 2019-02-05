create or replace function fsalario(vcodx xogador.codx%type) return number as
vsalario xogador.salario%type;

begin
select salario into vsalario from xogador where codx=vcodx;
return vsalario;


end;
/
show errors;
