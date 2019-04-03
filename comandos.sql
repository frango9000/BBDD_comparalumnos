clear screen;
show user;
set autocommit on
set pagesize 1000
set linesize 80
set serveroutput on
describe <table>
commit;
exit;

conn sys/oracle as sysdba
shutdown immediate
startup
conn hr/hr


-- vver primary key
SELECT cols.column_name, cons.status FROM all_constraints cons, all_cons_columns cols WHERE cols.table_name = 'XOGA' AND cons.constraint_type = 'P' AND cons.constraint_name = cols.constraint_name AND cons.owner = cols.owner ORDER BY cols.table_name, cols.position;

SELECT cols.table_name, cols.column_name, cols.position, cons.status, cons.owner FROM all_constraints cons, all_cons_columns cols WHERE cols.table_name = 'XOGA' AND cons.constraint_type = 'P' AND cons.constraint_name = cols.constraint_name AND cons.owner = cols.owner ORDER BY cols.table_name, cols.position;

select trigger_name from all_triggers where table_name='XOGA';

select trigger_name from all_triggers where table_owner='HR';


select object_name from user_objects where object_type='PROCEDURE';






union             select nome from persoas union select nomx from xogador;
intersect         select nome from persoas intersect select nomx from xogador;


rollback;

select * from persoas where edad <29;

select * from persoas where edad <29 and edade >19;


update persoas set edade = 35 where nome = 'ana';

update persoas set edade = 35 where nome = 'ana'and edade=19;

select avg(edade) from persoas;

select count(*) from persoas;

select sum(edade) from persoas;
select sum(edade)/count(edade) from persoas;
select sum(edade)/count(*) from persoas;

? varchar varchar2


drop cursos cascade constraint;

select * from persoas, cursos where persoas.codc = cursos.codc;
select persoas.*,cursos.nomec from persoas, cursos where persoas.codc = cursos.codc;
select nif,cursos.nomec from persoas, cursos where persoas.codc = cursos.codc;
select nif,persoas.nome,cursos.nomec from persoas, cursos where persoas.codc = cursos.codc;

select nif,persoas.nome,cursos.nomec from persoas natural join cursos;
select nif,nome,nomec from persoas natural join cursos;
select nif,nome alumno,nomec curso from persoas natural join cursos;
select nif,nome alumno,nomec curso from persoas natural join cursos where codp = 10;

select nif,nome,nomec from persoas, cursos where persoas.codc = cursos.codc and codp = 10;
select nif,nome from persoas, cursos where persoas.codc = cursos.codc and cursos.nomec = 'dam2';

select codc from cursos where nomec ='dam2';
select nif,nome from persoas where codc=(select codc from cursos where nomec ='dam2');
select nif,nome from persoas where codc in (select codc from cursos where nomec ='dam2');

select codc,count(*) from persoas group by codc;
select nome,sum(edade) from persoas group by nome;
select codc,avg(edade) from persoas group by codc;
select codc,count(*),avg(edade) from persoas group by codc;

select nomec, count(*), avg(edade) from persoas, cursos where persoas.codc = cursos.codc group by nomec;



select nomx from xogador where salario is null or salario = 0;
select codx, nomx, salario from xogador where salario > 999 and salario < 2501;
select codx, nomx, salario from xogador where salario between 1000 and 2500;
select codx, nomx, salario from xogador where salario between 1000 and 2500 and codequ = 'e1';
select sum(salario) from xogador;
select avg(salario) from xogador where codequ = 'e1';
select codequ, avg(salario) from xogador group by codequ;
select xogador.codequ, nomx, nomequ from xogador, equipo where xogador.codequ = equipo.codequ;
select codx, nomx, nomequ from xogador, equipo where nomequ = 'cuspedrinos' and xogador.codequ = equipo.codequ;

select codequ from equipo where nomequ ='cuspedrinos';
select codx, nomx from xogador where codequ =
select codx, nomx from xogador where codequ =(select codequ from equipo where nomequ ='cuspedrinos');

select nomequ, avg(salario) from xogador, equipo group by xogador.codequ;
select avg(salario) from xogador, equipo where xogador.codequ = equipo.codequ group by nomequ;

select nomequ from xogador, equipo where xogador.codequ = equipo.codequ group by count(*);
select distinct codequ from xogador;

select codequ from equipo where codequ not in(select distinct codequ from xogador);
select equipo.codequ, count(codx) from xogador right join equipo on xogador.codequ = equipo.codequ group by equipo.codequ;



select count(*) from xoga where codx = 'x1';
select count(codpar) from xoga group by codpar;
select codpar, count(codpar) from xoga group by codpar;
select codpar, count(codpar) from xoga group by codpar order by codpar;
select codpar, count(*) from xoga group by codpar order by codpar;

select nompar from partido where codpar = 'x6';
select nompar from partido where codpar in (select codpar from xoga where codx='x6');    --subselect
select nompar from xoga, partido where codx='x6' and xoga.codpar = partido.codpar;	 --cruzada

select codx from xoga where codpar = 'p1';
select nomx from xogador where codx in (select codx from xoga where codpar = 'p1');
select nomx from xogador, xoga where codpar='p1' and xogador.codx = xoga.codx;

select codpar from partido where nompar='cuspedrinoscroques';
select codx from xoga where codx in (select codpar from partido where nompar='cuspedrinoscroques');
select nomx from xogador where codx in (select codx from xoga where codpar in (select codpar from partido where nompar='cuspedrinoscroques'));

select nomx from partido, xoga, xogador where partido.nompar='cuspedrinoscroques' and partido.codpar = xoga.codpar and xoga.codx = xogador.codx;

select codest from estadio where nomest = 'playero';
select codequ from adestra where codest in (select codest from estadio where nomest = 'playero');
select nomequ from equipo where codequ in (select codequ from adestra where codest in (select codest from estadio where nomest = 'playero'));

select nomequ, ano from equipo, adestra, estadio where nomest = 'playero' and equipo.codequ = adestra.codequ and adestra.codest = estadio.codest;

select distinct codx from xoga;
select codx from xogador where codx not in (select distinct codx from xoga);



select codx, nomx, nomequ, salario from xogador full join equipo on xogador.codequ = equipo.codequ where salario > 1000 and nomx like '%a%'
select codequ, count(*) from xogador group by codequ;
select codequ, count(*) from xogador group by codequ having count(*) >3;


substr(string, firstindex, lastindex)
to_number(string)

select * from ten order by to_number(substr(codb,2));


 ************************* triggers ************************* 

no se puede hacer un trigger before update table al trabajar dentro del trigger con la misma table


 ************************* secuencias ************************* 

create sequence codigoslog start with 1 increment by 1;

select codigoslog.nextval from dual;


 ************************* gestion ************************* 

create user romani identified by r quota 20m on users;
create user romani identified by r quota 20m on users password expired;

grant create session, create table to romani;

create profile perfila limit failed_login_attempts 2;
alter user romani account unlock;
alter user romani password expire;

create profile perfila limit failed_login_attempts 2
 sessions_per_user 3 -- sesiones simultaneas
 connect_time 5 -- tiempo maximo de sesion (min)
 idle_time 2 -- tiempo hasta cierre de sesion por inactividad (min)
 password_life_time 1 -- tiempo de vida de la clave
 password_grace_time 1/24; 

-- unlimited (sessions_per_user unlimited)
-- default (valor del perfil default)

create profile perfila limit failed_login_attempts 2 sessions_per_user 3 connect_time 5 idle_time 2 password_life_time 1 password_grace_time 1/24;


-- solo se activan los recursos que involucren el password
-- para activar todos los recursos de un perfil:
-- memory ( durante el tiempo de actividad del servidor, se desactiva reiniciar
-- spfile (archivo de configuraciones del servidor, se activa al arrancar
-- both ^^^^
alter system set resource_limit = true scope = both;

describe dba_users; -- tabla de datos de la base solo sysdba
select username from dba_users;
select profile from dba_users where username = 'ROMANI';  -- ver el perfil del usuario


 ************************* privilegios sesion  ************************* 
revokes NO se retrian en cascada

grant <priv> to <usuario>;
revoke <priv> from <usuario>;
grant <priv1>, <priv2> to <usuario> | public [with admin option];


select privilege, admin_option from user_sys_privs; -- muestra los privilegios de sistema y admin option del usuario actual;
select * from  dba_sys_privs where grantee = 'ROMANI'; -- desde sysdba ver privs de cualquier usuario
select * from session_privs; -- permisos de la sesion actual

DBA Database Admin

Listas (vistas)

DBA_USERS
DBA_PROFILES
DBA_SYS_PRIVS
USER_SYS_PRIVS
USER_TAB_PRIVS
USER_COL_PRIVS
SESSION_PRIVS


alterar estructura de tabla

alter table proba add primary key (codigo);   //establecer clave primaria
alter table proba add nome varchar2(15);
alter table proba modify nome varchar2(20);

alter table proba drop primary key;


 ************************* privilegios de objeto  ************************* 
revokes SI se retrian en cascada

grant select on proba to hr;
revoke insert on proba from hr;

grant select on proba to hr with grant option;

 -- en insert y updates
grant insert (codx, nomx), update(salario) on xogador to xoan with grant option;

-- lista de permisos de objeto de un usuario
select * from user_tab_privs;

-- permisos de usuario vistos desde admin
select * from dba_col_privs where grantee = 'ROMANI';

 ************************* roles  ************************* 
 -- un usuario puede tener varios roles;
 -- los privilegios de objeto no pueden ser dados con grant option a un rol
 -- los privilegios de sistema si pueden ser dados con admin option a un rol

create role rola;
grant create session to rola;
grant create view to rola;
grant select on hr.xogador to rola;
grant rola to romani;


select * from dba_role_privs;
select * from dba_role_privs where grantee = 'xoan'; -- ver los roles de un usuario
select * from dba_role_privs where granted_role = 'rola'; -- ver los usuarios que tiene un rol

select * from dba_sys_privs where grantee='ROLA'; -- ver los privilegios de sistema un rol
select * from dba_tab_privs where grantee='ROLA'; -- ver los privilegios de objeto de un rol
select * from dba_col_privs where grantee='ROLA'; -- ver los privilegios de columnas de un rol


 -- romani podra dar el rola a otros
grant create view to rola with admin option;


 -- romani podra dar permisos de session a otros
grant rola to romani with admin options;


 -- privilegios via roles de un unico usuario
select * from dba_sys_privs where grantee in (select granted_role from dba_role_privs where grantee = 'ROMANI');
select * from dba_tab_privs where grantee in (select granted_role from dba_role_privs where grantee = 'ROMANI');
select * from dba_col_privs where grantee in (select granted_role from dba_role_privs where grantee = 'ROMANI');

 -- todos los permisios concedidos por roles, por public o directos
select * from dba_sys_privs where grantee in (select granted_role from dba_role_privs where grantee = 'ROMANI') or grantee = 'PUBLIC' or grantee = 'ROMANI';


