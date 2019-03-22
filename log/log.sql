drop sequence codigoslog;
create sequence codigoslog start with 1 increment by 1;

drop table log;

create table log(
id number, 
taboa varchar2(20) not null, 
tipo_inst varchar2(20), 
clave varchar2(20), 
data date, 
usuario varchar2(20), 
primary key (ID)
);
commit;

