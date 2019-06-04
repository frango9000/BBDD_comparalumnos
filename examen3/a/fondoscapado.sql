
set linesize 250
set serveroutput on
set pagesize 50
alter session set nls_date_format = 'dd/mm/yyyy';
drop table librosplaneta;
drop table libroscatedra;
drop table socio cascade constraints;
drop table libro cascade constraints;
drop table autor cascade constraints;

purge recyclebin;


create table autor (
codautor varchar(3),
nomea varchar(20) ,
primary key(codautor)
);
--
--
create table libro (
clibro varchar(6),
titulo varchar(30) ,
editorial varchar(20) ,
dedicion date,
nexemplares integer,
codautor varchar(3),
primary key (clibro),
foreign key (codautor) references autor(codautor)
);

create table libroscatedra (
clibro varchar(6),
titulo varchar(30) ,
dedicion date,
nexemplares integer,
primary key (clibro)
);

create table librosplaneta (
clibro varchar(6),
titulo varchar(30) ,
dedicion date,
codautor varchar(3),
primary key (clibro),
foreign key (codautor) references autor(codautor)
);

--
--
create table socio (
nsocio integer,
dniu integer,
nomeu varchar(20) ,
tipo varchar(1) ,
primary key (nsocio)
);
--autor
--codautor | nomea
insert into autor values('a1','cervantes');
insert into autor values('a2','carpentier');
insert into autor values('a3','brook');
insert into autor values('a4','malinowski');
insert into autor values('a5','bunhuel');
insert into autor values('a6','aristoteles');
insert into autor values('a7','einstein');
insert into autor values('a8','lorca');
insert into autor values('a9','rosalia');
insert into autor values('a10','leonardo');
insert into autor values('a11','pitagoras');
insert into autor values('a12','arquimedes');
insert into autor values('a13','leonardo');
insert into autor values('a14','apuleyo');
insert into autor values('a15','vian');
insert into autor values('a16','puskinov');


insert into librosplaneta values('c0','os cen mil','10/1/2005','a14' );




insert into socio values(1,36000000,'luis','a' );
insert into socio values(2,36222222,'ana','a' );
insert into socio values(3,36333333,'pedro','p' );
insert into socio values(4,36444444,'eva','a' );
insert into socio values(5,36444444,'juan','a' );
insert into socio values(6,36555555,'maria','p' );
insert into socio values(7,36666666,'luisa','a' );
insert into socio values(8,36777777,'isabel','a' );
insert into socio values(9,36888888,'brais','a' );
insert into socio values(10,36999999,'ariadna','p' );
insert into socio values(11,36101010,'natalia','a' );
insert into socio values(12,36121212,'nicolas','p' );
insert into socio values(13,36131313,'camilo','a' );
insert into socio values(14,36141414,'santi','a' );
insert into socio values(15,36151515,'fernando','a' );
insert into socio values(16,36161616,'luis','a' );
insert into socio values(17,36171717,'gerardo','a' );
insert into socio values(18,36181818,'eduardo','p' );
insert into socio values(19,36191919,'jesus','a' );
insert into socio values(20,36202020,'daniel','a' );


commit;






