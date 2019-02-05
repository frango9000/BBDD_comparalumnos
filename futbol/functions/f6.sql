create or replace function fsalarioxogmed(vcodx xogador.codx%type) return varchar2 as
vsalarioxog xogador.salario%type;
vsalariomed xogador.salario%type;

begin
vsalarioxog := fsalario(vcodx);
vsalariomed := fmediasalario;

if (vsalarioxog > vsalariomed) then
	return 'mas';
elsif(vsalarioxog < vsalariomed) then
	return 'menos';
elsif(vsalarioxog = vsalariomed) then
	return 'igual'; 
else return 'salario nulo';
end if;


end;
/
show errors;
