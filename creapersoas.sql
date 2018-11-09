drop table persoas;
drop table cursos;

create table cursos(
codc number,
nomec varchar2(4), 
primary key (codc)
);

insert into cursos values(1,'dam1');
insert into cursos values(2,'dam2');

select * from cursos;

create table persoas(
codp number,
nif varchar2(9) unique,
nome varchar2(15), 
edade number, 
codc number,
primary key (codp),
foreign key(codc) references cursos(codc)
);

insert into persoas values (1,'361h', 'luis', 20, null);
insert into persoas values (2,'362b', 'ana', null, 1);
insert into persoas values (10,'3620c', 'ana', 19, 2);
insert into persoas values (4,'3619p', 'luis', 30, 2);
insert into persoas values (5,'3618r', 'antonio', 25, 2);
insert into persoas values (6,'361z', 'eduardo', 0, 1);
--commit;
select * from persoas;

