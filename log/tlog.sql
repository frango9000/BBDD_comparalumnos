create or replace trigger txogador before insert or delete or update on xogador for each row
declare

begin
if inserting then
	insert into log (id, taboa, tipo_inst, clave, usuario, data) values(codigoslog.nextval, 'log', 'insert', :new.codx, user, sysdate);
elsif deleting then
	insert into log (id, taboa, tipo_inst, clave, usuario, data) values(codigoslog.nextval, 'log', 'delete', :old.codx, user, sysdate);
elsif updating then
	if updating ('salario') then
		insert into log (id, taboa, tipo_inst, clave, usuario, data) 
			values(codigoslog.nextval, 'log', 'update.salario', :old.codx||'-'||:old.salario||' -> ' || :new.salario, user, sysdate);
	else
		insert into log (id, taboa, tipo_inst, clave, usuario, data) 
			values(codigoslog.nextval, 'log', 'update', :old.codx||'-'||:new.codx, user, sysdate);
	end if;

end if;


end;
/
show errors;


