1) amosar nomes de balnearios cuxo coste diario supere os 45 euros


banos_de_molgas
mondariz
toxa

 select nomb from balnearios where costed >45;


2) amosar nomes de pacientes que vivan na poboacion denominada brea


pedro
bieito
mario
select nomp from pacientes where codp in (select codp from poboacions where nomp='brea');
select pacientes.nomp from pacientes, poboacions where pacientes.codp = poboacions.codp and poboacions.nomp='brea';


3) indicar os tipos de augas que estarian indicadas para os pacientes que sufren de ril


bicarbonatadas
oligometalicas
sulfatadas
select tipo from augas, indicadas, zonas_corporais zc where zc.nomz='ril' and zc.codz=indicadas.codz and indicadas.coda = augas.coda;


4) amosar codigos de poboacions onde viven os pacientes  e o numero de pacientes que ten cada unha desas poboacions


	     2
p10	     2
p7	     3
p21	     1
p4	     2
p2	     1
p8	     2
p9	     4
p5	     1

9 rows selected.
select pacientes.codp, count(*) from pacientes left join poboacions on pacientes.codp = poboacions.codp group by pacientes.codp;


5) amosar de cantos minerais se compon cada tipo de auga


sulfatadas		      1
ferruginosas		      1
bicarbonatadas		      2
sulfuradas		      4
cloradas		      1
select tipo, count(*) from minerais, augas, compon where augas.coda=compon.coda and compon.codm = minerais.codm group by tipo;


6) amosar sen repeticion os codigos de medicos que cumplan que asignaron polo menos un balneario a un paciente	cronico e prescribiron polo menos un balneario a un enfermo agudo (e dicir, que si asignaron un balneario a un paciente cronico pero non prescribiron ningun a un paciente agudo, ou viceversa,  non deben aparecer no listado


m4
m1
m5
select * from (select distinct codme from prescriben) intersect (select distinct codme from asignan);


7) amosar  nif e nome de todos e cada un dos pacientes e ademais a poboacion onde viven


362	  ana		  arteixo
3612	  elisa 	  mondariz
363	  carlos	  mondariz
3618	  iria		  lugo
3613	  mario 	  brea
3610	  bieito	  brea
364	  pedro 	  brea
369	  xoan		  davila
365	  bea		  davila
3617	  antia 	  carballo
3614	  palmira	  carballo
368	  carlos	  carballo
366	  eva		  carballo
3616	  xose		  carballino
3615	  lucia 	  carballino
361	  luis		  moimenta
3611	  carmen
367	  bea

18 rows selected.
select nif, pa.nomp, po.nomp from pacientes pa left join poboacions po on pa.codp=po.codp;

8) amosar o nome do balneario  onde supostamente se atopaba  o paciente de nif 3615 o 8/7/2013


arteixo
select nomb from balnearios where codb in (select codb from asignan where dec<'08/07/2013' and dsc >'08/07/2013' and nif='3615') or codb in (select codb from prescriben where dea<'08/07/2013' and dsa>'08/07/2013' and nif='3615');


 9) amosar os nif de todos os pacientes se o numero de pacientes cronicos e igual  ao numero de pacientes agudos


361
3610
3611
3612
3613
3614
3615
3616
3617
3618
362
363
364
365
366
367
368
369

18 rows selected.
select nif from pacientes having (select count(*) from agudos)=(select count(*) from cronicos);


10) amosar os nomes das poboacions que non posuan balnearios


lugo
moimenta
carballo
santiago
carballino
coruna
guitiriz
ourense
cangas
vigo
bueu

11 rows selected.
select nomp from poboacions where codp not in (select codp from balnearios);


11) amosar nomes de balnearios que se chamen exactamente igual que nomes de poboacions


arnoia
arteixo
mondariz
toxa
select nomb from balnearios, poboacions where nomb=nomp;

12) amosar nomes de pacientes distintos aos nomes de calquera medico


ana
antia
bea
bieito
carlos
carmen
elisa
eva
iria
lucia
luis
palmira
pedro
xoan
xose

15 rows selected.
select distinct nomp from pacientes where nomp not in (select nomme from medicos);


13) amosar os nomes de pacientes sen que se repitan


carlos
bieito
elisa
xoan
iria
antia
mario
palmira
ana
bea
carmen
xose
lucia
luis
pedro
eva

16 rows selected.
select distinct nomp from pacientes;

14) amosar os nomes de pacientes que posuan polo menos unha letra -a- e polo menos unha letra -o- no seu  nome


carlos
carlos
xoan
mario
select nomp from pacientes where nomp like '%a%' and nomp like '%o%';

15) amosar os nomes de todos e cada un dos medicos e os  nomes dos seus xefes


francisco	federico
rosa		federico
manuel		anabel
elena		anabel
mario		elena
anabel
federico

7 rows selected.
select m1.nomme, m2.nomme from medicos m1 left join medicos m2 on m1.xef=m2.codme;


16) amosar os nomes dos hoteis que posuan  algunha habitacion con interede


mexico
andurina
solpor
melia
select nomh from hoteis where codh in (select codh from habitacions where interede='s');


17) amosar cales son os ingresos mensuais  dos pacientes cronicos


      1000
      1200
      1300
       900
       850
      1400
      1600
      1250
      1100

9 rows selected.

select ingm from pacientes where nif in (select nif from cronicos);

18) amosar os nomes dos balnearios que posuan  fisioterapeuta


banos_de_molgas
termas_de_cuntis
caldas_de_partovia

select nomb from balnearios where codb in (select codb from cat1 where fisioterapeuta='s');

19) amosar o tipo de auga en que o mineral sodio existe en maior cantidade


sulfatadas

select tipo from augas where coda in (select coda from compon where mg=(select max(mg) from compon where codm in (select codm from minerais where nomm='sodio')) and codm in (select codm from minerais where nomm='sodio'));

20)amosar os nomes dos pacientes cuxa estancia no hotel 'melia' trancurriu en parte ou totalmente entres os dias  15/7/2013   e   20/7/2013 . 
E dicir que si un paciente aloxouse no hotel 'melia' o dia 10/7/2013  e  deixou o hotel o dia 15/7/2013 , deber’a aparecer neste listado (pois transcurriu parte da sua estancia entres as datsas referidas , ainda que so fose so un dia ) . Pasaria o mesmo para un paciente que entrase neste hotel o dia 17/7/2013 e marchase o 24/7/2013. Ou o mesmo para un paciente que entrase o 11/7/2013 e saise o 15/7/2013

ana
elisa
select nomp from pacientes where nif in(select nif from aloxan where de<='20/07/2013' and ds>='15/07/2013' and codh in (select codh from hoteis where nomh = 'melia'));
