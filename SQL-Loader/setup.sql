/*
NOTA IMPORTANTE:  na carga de datos que usa xenerador de secuencias o xenerador incrementase igual ainda que descarte filas por non cumplir condicion ou non estar os datos ben formados
*/

drop sequence s_parentes;
drop table parentes;
drop table parentes_h;
drop table parentes_m;

CREATE TABLE parentes(
numero NUMBER(6),
nome VARCHAR2(8),
apelidos VARCHAR2(15),
sexo CHAR(1),
datan DATE);

CREATE TABLE parentes_h
(
numero NUMBER(6),
nome VARCHAR2(8),
apelidos VARCHAR2(15),
datan DATE
) ;

CREATE TABLE parentes_m
(
numero NUMBER(6),
nome VARCHAR2(8),
apelidos VARCHAR2(15)
) ;

CREATE SEQUENCE s_parentes minvalue 0 start with 0 increment by 1;

commit;
