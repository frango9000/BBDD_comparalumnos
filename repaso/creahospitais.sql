alter session set nls_date_format = 'dd.mm.yyyy';
DROP table hosp1_medico5 cascade constraints;
Drop table hosp1_medico2 cascade constraints;
DROP TABLE hosp2 CASCADE CONSTRAINTS;
DROP TABLE adscrito CASCADE CONSTRAINTS;
DROP TABLE area CASCADE CONSTRAINTS;
DROP TABLE hosp1 CASCADE CONSTRAINTS;
DROP TABLE medico CASCADE CONSTRAINTS;
DROP TABLE a2c CASCADE CONSTRAINTS;
DROP TABLE a1c CASCADE CONSTRAINTS;
DROP TABLE asegurado CASCADE CONSTRAINTS;
DROP TABLE poliza CASCADE CONSTRAINTS;
DROP TABLE concertado CASCADE CONSTRAINTS;
DROP TABLE propio CASCADE CONSTRAINTS;
DROP TABLE hospital CASCADE CONSTRAINTS;
purge recyclebin;
/*===========================================================*/
CREATE TABLE hospital (
    codh VARCHAR2(3) NOT NULL,
    nomh VARCHAR2(13),
    numc INTEGER,
    PRIMARY KEY (codh)
);

CREATE TABLE propio (
    codh VARCHAR2(3) NOT NULL,
    PRIMARY KEY (codh),
    FOREIGN KEY (codh) REFERENCES hospital (codh)
);

CREATE TABLE area (
    coda VARCHAR2(3) NOT NULL,
    numh INTEGER,
    superficie INTEGER,
    PRIMARY KEY (coda)
);

CREATE TABLE concertado (
    codh VARCHAR2(3) NOT NULL,
    coda VARCHAR2(3) NOT NULL,
    PRIMARY KEY (codh),
    FOREIGN KEY (codh) REFERENCES hospital (codh),
    FOREIGN KEY (coda) REFERENCES area (coda)
);

CREATE TABLE poliza (
    codp VARCHAR2(3) NOT NULL,
    datosp VARCHAR2(40),
    PRIMARY KEY (codp)
);

CREATE TABLE asegurado (
    codp VARCHAR2(3) NOT NULL,
    numas INTEGER NOT NULL,
    nomas VARCHAR2(10),
    datan DATE,
    coda VARCHAR2(3),
    PRIMARY KEY (codp, numas),
    FOREIGN KEY (codp) REFERENCES poliza (codp),
    FOREIGN KEY (coda) REFERENCES area (coda)
);

CREATE TABLE a1c (
    codp VARCHAR2(3) NOT NULL,
    numas INTEGER NOT NULL,
    PRIMARY KEY (codp, numas),
    FOREIGN KEY (codp,numas) REFERENCES asegurado (codp, numas)
);

CREATE TABLE a2c (
    codp VARCHAR2(3) NOT NULL,
    numas INTEGER NOT NULL,
    PRIMARY KEY (codp, numas),
    FOREIGN KEY (codp,numas) REFERENCES asegurado (codp, numas)
);

CREATE TABLE medico (
    codm VARCHAR2(3) NOT NULL,
    nomm VARCHAR2(10),
    telfm VARCHAR2(10),
    codm1 VARCHAR2(3),
    PRIMARY KEY (codm),
    FOREIGN KEY (codm1) REFERENCES medico (codm)
);

CREATE TABLE adscrito (
    codm VARCHAR2(3) NOT NULL,
    coda VARCHAR2(3) NOT NULL,
    PRIMARY KEY (codm, coda),
    FOREIGN KEY (codm) REFERENCES medico(codm),
    FOREIGN KEY (coda) REFERENCES area(coda)
);

CREATE TABLE hosp1 (
    codh VARCHAR2(3) NOT NULL,
    codp VARCHAR2(3) NOT NULL,
    numas INTEGER NOT NULL,
    codm VARCHAR2(3) NOT NULL,
    datai DATE NOT NULL,
    dataf DATE,
    PRIMARY KEY (codh, codp, numas, codm, datai),
    FOREIGN KEY (codh) REFERENCES hospital(codh),
    FOREIGN KEY (codp,numas) REFERENCES a1c(codp,numas),
    FOREIGN KEY (codm) REFERENCES medico(codm)
);

CREATE TABLE hosp1_medico2 (
    codh VARCHAR2(3) NOT NULL,
    codp VARCHAR2(3) NOT NULL,
    numas INTEGER NOT NULL,
    dataf DATE,
    PRIMARY KEY (codh, codp, numas,dataf),
    FOREIGN KEY (codh) REFERENCES hospital(codh),
    FOREIGN KEY (codp,numas) REFERENCES a1c(codp,numas)
);

CREATE TABLE hosp1_medico5 (
    codh VARCHAR2(3) NOT NULL,
    codp VARCHAR2(3) NOT NULL,
    numas INTEGER NOT NULL,
    datai DATE NOT NULL,
    PRIMARY KEY (codh, codp, numas,datai),
    FOREIGN KEY (codh) REFERENCES hospital(codh),
    FOREIGN KEY (codp,numas) REFERENCES a1c(codp,numas)
);

CREATE TABLE hosp2 (
    codh VARCHAR2(3) NOT NULL,
    codp VARCHAR2(3) NOT NULL,
    numas INTEGER NOT NULL,
    codm VARCHAR2(3) NOT NULL,
    datai DATE NOT NULL,
    dataf DATE NOT NULL,
    PRIMARY KEY (codm, codh, codp, numas, datai),
    FOREIGN KEY (codm) REFERENCES medico(codm),
    FOREIGN KEY (codh) REFERENCES propio(codh),
    FOREIGN KEY (codp,numas) REFERENCES a2c(codp,numas)
);


insert into hospital values('h1','canalejo',200 );
insert into hospital values('h2','xeral',150 );
insert into hospital values('h3','meixoeiro',300 );
insert into hospital values('h4','paz', 500);
insert into hospital values('h5','sofia',300 );
insert into hospital values('h6','universitario',100 );
insert into hospital values('h7','sonic',130 );
insert into hospital values('h8','urzaiz',90 );
insert into hospital values('h9','cies',80 );
insert into hospital values('h10','povisa',250 );
insert into hospital values('h11','provincial',300 );
insert into hospital values('h12','nicolas',225 );


insert into propio values('h1');
insert into propio values('h2');
insert into propio values('h3');
insert into propio values('h4');

insert into area values('a1',12,4 );
insert into area values('a2',15,9 );
insert into area values('a3',12,6 );
insert into area values('a4',10,3);
insert into area values('a5',15,2 );
insert into area values('a6',11,4 );
insert into area values('a7',9,1);


insert into concertado values('h5','a1');
insert into concertado values('h6','a2');
insert into concertado values('h7','a3');
insert into concertado values('h8','a4');
insert into concertado values('h9','a5');
insert into concertado values('h10','a5');

insert into poliza  values('p1','aaa');
insert into poliza  values('p2','bbb');
insert into poliza  values('p3','ccc');
insert into poliza  values('p4','ddd');
insert into poliza  values('p5','eee');
insert into poliza  values('p6','fff');
insert into poliza  values('p7','ggg');
insert into poliza  values('p8','hhh');
insert into poliza  values('p9','iii');
insert into poliza  values('p10','jjj');
insert into poliza  values('p11','kkk');
insert into poliza  values('p12','lll');
insert into poliza  values('p13','mmm');
insert into poliza  values('p14','nnn');
insert into poliza  values('p15','ppp');

insert into asegurado  values('p1',1,'luis','1/1/1980','a1');
insert into asegurado  values('p1',3,'agapito','11/1/1983','a1');
insert into asegurado  values('p1',2,'ana','1/1/1981','a1');
insert into asegurado  values('p2',1,'pedro','1/1/1982','a2');
insert into asegurado  values('p2',2,'juan','1/1/1983','a2');
insert into asegurado  values('p3',1,'carlos','1/1/1984','a2');
insert into asegurado  values('p3',2,'bieito','1/1/1985','a3');
insert into asegurado  values('p4',1,'xoan','1/1/1986','a4');
insert into asegurado  values('p4',2,'eva','1/1/1987','a4');
insert into asegurado  values('p5',1,'dorotea','1/1/1988','a5');
insert into asegurado  values('p5',2,'elisa','1/1/1989','a5');
insert into asegurado  values('p6',1,'amalia','1/1/1990','a5');
insert into asegurado  values('p7',1,'dolores','1/1/1991','a5');
insert into asegurado  values('p8',1,'maria','1/1/1991','a5');
insert into asegurado  values('p9',1,'xose','1/1/1992','a5');
insert into asegurado  values('p10',1,'andrea','1/1/1993','a5');
insert into asegurado  values('p11',1,'iria','1/1/1983','a5');
insert into asegurado  values('p12',1,'antia','1/1/1983','a5');
insert into asegurado  values('p13',1,'xana','1/1/1984','a5');
insert into asegurado  values('p14',1,'comba','1/1/1985','a4');
insert into asegurado  values('p15',1,'ainara','1/1/1986','a4');
insert into asegurado  values('p15',2,'jose','1/1/1997','a7');


insert into a1c  values('p1',1);
insert into a1c  values('p2',2);
insert into a1c  values('p3',1);
insert into a1c  values('p4',2);
insert into a1c  values('p5',1);
insert into a1c  values('p6',1);
insert into a1c  values('p7',1);
insert into a1c  values('p8',1);
insert into a1c  values('p9',1);
insert into a1c  values('p10',1);

insert into a2c  values('p2',1);
insert into a2c  values('p1',2);
insert into a2c  values('p3',2);
insert into a2c  values('p4',1);
insert into a2c  values('p5',2);
insert into a2c  values('p11',1);
insert into a2c  values('p12',1);
insert into a2c  values('p13',1);
insert into a2c  values('p14',1);
insert into a2c  values('p15',1);

insert into medico  values('m1','luis','986111111',null);
insert into medico  values('m2','ana','986222222',null);
insert into medico  values('m3','virginia','986333333','m1');
insert into medico  values('m4','palmira','986444444','m1');
insert into medico  values('m5','rosa','986555555','m2');

insert into adscrito  values('m1','a1');
insert into adscrito  values('m1','a2');
insert into adscrito  values('m2','a1');
insert into adscrito  values('m3','a3');
insert into adscrito  values('m4','a4');
insert into adscrito  values('m5','a5');


insert into hosp1 values('h5','p3',1,'m2','1/1/2006','1/2/2006');
insert into hosp1 values('h5','p3',1,'m2','10/2/2006','15/2/2006');
insert into hosp1 values('h5','p3',1,'m2','1/1/2007','10/2/2007');
insert into hosp1 values('h6','p3',1,'m1','10/1/2008','10/3/2008');
insert into hosp1 values('h10','p10',1,'m5','1/2/2007','6/2/2007');
insert into hosp1 values('h8','p6',1,'m4','12/3/2007','23/3/2007');
insert into hosp1 values('h8','p5',1,'m4','1/2/2008','6/2/2008');
insert into hosp1 values('h10','p5',1,'m5','2/3/2008','12/3/2008');
insert into hosp1 values('h1','p7',1,'m1','1/1/2006','1/2/2006');
insert into hosp1 values('h2','p8',1,'m2','1/1/2006','1/2/2006');
--insert into hosp1 values('h3','p9',1,'m4','1/1/2006','1/2/2006');
insert into hosp1 values('h4','p10',1,'m5','1/1/2006','1/2/2006');
insert into hosp1 values('h1','p7',1,'m2','1/1/2006','1/2/2006');

insert into hosp1_medico5 values('h1','p7',1,'4/1/2009');


insert into hosp2 values('h1','p2',1,'m1','1/3/2004','1/4/2004');
insert into hosp2 values('h2','p4',1,'m4','1/3/2004','1/4/2004');
insert into hosp2 values('h2','p11',1,'m5','1/3/2005','1/4/2005');
insert into hosp2 values('h3','p11',1,'m5','1/5/2005','1/6/2005');
insert into hosp2 values('h3','p13',1,'m5','1/5/2005','1/6/2005');
insert into hosp2 values('h3','p5',2,'m5','1/5/2002','1/6/2002');



commit;
