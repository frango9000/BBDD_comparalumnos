d1-c1)
amosar nomes de personaxes que teñan unha letra 'a'  e unha letra 'n' no seu nome 

karnas 
lian 
tagana 

select nomper from personaxes where nomper like '%a%' and nomper like '%n%';


d1-c1'')
amosar nomes de actores  que teñan unha letra 'y'  ou unha letra 'j' no seu nome 


nimoy 
kelley 
yuan 
julia 
gray 
brandy 

select noma from actores where noma like '%y%' or noma like '%j%';



d1-c2)
amosar cantos actores  hai de cada nacionalidade


suiza               1 
francia             2 
irlanda             2 
escocia             1 
mexico              2 
peru                2 
gales               5 
colombia            2 
italia              2 
chile               2 
polonia             2 
espanha             4 

select nacionalidade, count(nacionalidade) from actores group by nacionalidade;



d1-c2'')
amosar cantos personaxes hai de cada graduacion


mayor               2 
oficial             7 
soldado            25 
capitan             1 
tenente             1 
alferez             2 
coronel             3 
cabo                5 

select graduacion, count(graduacion) from personaxes group by graduacion;




d1-c3)
de cantos actores non se coñece a data de nacemento?

Resultado:  5

select count(*) from actores where datan is null;



d1-c3'') 
de cantos interpretes de series  non se coñece as horas que levan traballadas?


Resultado: 8

select count(*) from interpretesser where horas is null;



d1-c4)
cantas horas de rodaxe empregou o actor de codigo 'a1' en todas as peliculas nas que interviu.


Resultado: 250

select sum(horas) from interpretespel where coda='a1';




d1-c4'')
canto cobran de media por hora os actores de nacionalidade 'espanha' ( nota o que cobra por hora un actor e o que se denomina cachehora)


resultado: 233.333333

select avg(cachehora) from actores where nacionalidade='espanha';




d1-c5) amosar os nomes  dos naves que se usan para visitar planetas na serie de codigo 's1'  


enterprise 
voyager 

select nomen from naves where codn in (select codn from visitas where cods ='s1');
ó
select distinct nomen from naves, visitas where naves.codn=visitas.codn and cods='s1';



d1- c5'')

amosar os nomes dos actores que son protagonistas en  peliculas ( nota: si un actor e protagonista ten no campo protagonista da taboa interpretespel o valor 's')


shatner 
ana 
yuan 

select noma from actores where coda in (select coda from interpretespel where protagonista='s');
ó
select distinct noma from actores, interpretespel where actores.coda = interpretespel.coda and protagonista='s';




d1-c6)
amosar os nomes dos plantas da galaxia  'via_lactea'


terra 
mart 
xupiter 
saturno 
neptuno 
vulcano 

select nompla from planetas where galaxia ='via_lactea';



d1-c6'')amosar os nomes dos personaxes que teñan de graduación 'oficial'


chekov 
ear 
prak 
tomalak 
ronin 
sissy 
kira 

select nomper from personaxes where graduacion = 'oficial';


d2-c0) amosar os nomes dos personaxes que estando na base de datos non están relacionados todavía con ninguna película 


lures
tagana
gilora
lian
solok
brunt
ducat
lag
sissy
devour
comic
kraal
letek
maccoy
nog
kor
ardor
tiron
dax
karnas
garak
rom
grilka
gull
quark
kira
morn
ronin
boogie
kamala
sovak
scott
kurn

select nomper from personaxes where codper not in (select codper from interpretespel);



d2-c0'') amosar nomes de planetas que non foron visitados:


lobar 
gork 
neptuno 
vulcano 

select nompla from planetas where codpla not in (select codpla from visitas);



 

NON FACER d2-c2)amosar un 'si'  si  as lanzaderas da nave 'n1' poden levar entre todas elas  a toda a tripulacion de dita nave


resultado: si

select 'si' from naves where tripul<( select sum(capacidade) from lanzaderas where codn = 'n1') and codn = 'n1';



d2-c3) 
amosar nomes de actores que participan  polo menos unha vez nunha serie e polo menos unha vez  nunha pelicula (as duas cousas a vez)


shatner 
nimoy 
kelley 
doohan 
luis 
pedro 
yuan 

select noma from actores where coda in (select coda from interpretespel) and coda in (select coda from interpretesser);

select distinct noma from actores, interpretespel, interpretesser where actores.coda = interpretespel.coda and actores.coda = interpretesser.coda;


d2-c3'') amosar nomes de personaxes que non  participan  en series nen en peliculas 


feline
bieito
rosa
bikel
farrow
brandy

select noma from actores where coda not in (select coda from interpretespel) and coda not in (select coda from interpretesser);

select noma from actores,interpretesser,interpretespel where actores.coda=interpretespel.coda and actores.coda=interpretesser.coda;


d2-c4)
amosar os nomes dos personaxes que son soldados e non dependen de ningun outro personaxe.

vekor 
lag 
kamala 
garak 

select nomper from personaxes where graduacion = 'soldado' and codper2 is null;


d2-c4'') amosar os nomes dos actores que cobren 200 de cachehora dos que non se sepa a data de nacemento:


koenig 
ana 

select noma from actores where cachehora = 200 and datan is null;



 d2-c5)
amosa o numero de  personaxes que interpreta o actor de codigo 'a18'  na serie de nome 'deep_space_nine';


resultado : 2

select count(codper) from interpretesser where coda ='a18' and cods in (select cods from series where titulo = 'deep_space_nine');

select count(codper) from interpretesser, series where coda ='a18' and interpretesser.cods=series.cods and titulo = 'deep_space_nine';

 d2-c6) 
amosar nomes de naves que non  teñen lanzaderas 


resultado:  speedo

select nomen from naves where codn not in (select distinct codn from lanzaderas);




d3-c7)
 cantos klingon proceden de planetas visitados na serie que ten por titulo 'enterprise'

resultado: 14

select count(codper) from klingon where codpla in (select codpla from visitas where cods in (select cods from series where titulo='enterprise'));
select count(distinct codper) from klingon, visitas, series where titulo='enterprise' and visitas.codpla=klingon.codpla and series.cods=visitas.cods;


d3-c8)
canto cobran de media por hora os actores tendo en conta os nulos:


192.592593

select sum(cachehora)/count(*) from actores;

d3-c9)
amosar codigos  de todolos actores e cantas veces interveñen facendo os mesmos ou distintos personaxes personaxes en peliculas ( conta unha vez por cada intervencion facendo un personaxe nunha pelicula ainda que repitan personaxes ou fagan mais dun personaxe na mesma pelicula , e decir se interven na mesma ou en distintas  peliculas  facendo os mesmos ou distintos  personaxes contan como distintas intervencions)

Muestre los códigos para todos los actores y cuántas veces participan haciendo personajes iguales o diferentes en los personajes de la película (cuenta una vez y para cada intervención, hacer un personaje en una película aunque repitan personajes o hagan más de un personaje en la misma película, y dicen si intervienen en la misma o En diferentes películas, los mismos personajes o diferentes cuentan como diferentes intervenciones.


a1		3
a10		1
a21		0
a13		0
a22		0
a14		0
a19		0
a25		0
a3		1
a4		1
a8		2
a16		0
a26		0
a2		4
a27		0
a12		0
a11		2
a9		4
a20		0
a23		0
a5		1
a15		0
a17		2
a6		2
a7		1
a18		0
a24		0

select actores.coda, count(interpretespel.coda) from actores left join interpretespel on interpretespel.coda = actores.coda group by actores.coda;

 
d3- c10 ) amosar codigos de lanzaderas que se usaron para visitar o planeta 'mart' na serie 'next_generation'.

n4          11 
n4          10 
n4           9 
n4           8 
n4           7 
n4           6 
n4           5 
n4           4 
n2           3 
n2           2 
n2           1

select codn, numero from lanzaderas where codn in (select codn from visitas where cods in (select cods from series where titulo ='next_generation') and codpla in (select codpla from planetas where nompla = 'mart'));

select lanzaderas.codn, numero from lanzaderas,planetas,visitas,series where lanzaderas.codn =visitas.codn and visitas.cods=series.cods and titulo ='next_generation' and visitas.codpla =planetas.codpla and planetas.nompla = 'mart';


d3-c11) 
amosar os nomes dos actores que interpretan mais dun personaxe nunha mesma serie:


teresa 
leis 
veronica 

select noma from actores where coda in(select coda from interpretesser group by coda,cods having count(codper)>1);



d3-c11) amosar os nomes dos personaxes   que foron interpretados por un un actor  de peliculas mais dunha vez:
kirk 
spoke 

select nomper from personaxes where codper in(select codper from interpretespel group by coda,codper having count(codper)>1);



d3-c11’’) amosar os nomes dos personaxes   que foron interpretados por mais dun actor  de peliculas:



NOMPER
---------------
kirk
jono
spoke
vekor
select nomper from personaxes where codper in(select codper from interpretespel group by codper having count(coda)>1);



d3-c12)
amosar nomes de actores de series que interpreten personaxes que teñen una letra 'y' no seu nome de personaxe:

beatriz 
kelley 
luis 

select noma from actores where coda in (select coda from interpretesser where codper in (select codper from personaxes where nomper like '%y%'));

select distinct noma from actores, interpretesser, personaxes where actores.coda=interpretesser.coda and interpretesser.codper = personaxes.codper and nomper like '%y%';


d3-c13)amosar nomes de actores que teñan polo menos unha letra ' a' ,  de series  interpretadas por  personaxes que teñen una letra 'a' no seu nome de personaxe

yuan 
beatriz 
veronica 
gray 


select noma from actores, interpretesser, personaxes where actores.coda=interpretesser.coda and personaxes.codper = interpretesser.codper and noma like '%a%' and nomper like '%a%';



d3-c14)
amosar os nomes dos personaxes dos que dependen directamente soldados

word 
letek 
ardor 
solok 

select nomper from personaxes where codper in (select codper2 from personaxes where graduacion ='soldado');

select distinct p2.nomper from personaxes p, personaxes p2 where p2.codper=p.codper2 and p.graduacion ='soldado';












a) operacions:

a1) insercions:
realizar as insercions  necesarias para dar de alta a un novo klingon sabendo os seguintes datos:

nome : 'hular'
graduacion : 'soldado'
codigo do personaxe do cal depende: 'p9'
planeta de procedencia: 'cancerbero' 
data de combate  e   '7/5/1998'

nota: o codigo deste personaxe o inventades vos, todos os demais datos necesarios para as insercions os tedes no listado anterior ou podes buscalos  a partires dos datos dados en  dito listado


a2) modificación: 

modificar o nome do director da pelicula  'undiscovered'  pois non e 'george' senon  'georgous';


a3) eliminación

eliminar o planeta neptuno 



b) operacions:

b1) insercions:
realizar as insercions  necesarias para dar de alta a unha nova lanzadera :

capacidade : 3
nome da nave a que pertence:  'voyager'

nota: o número de lanzadra inventadelo vos , todos os demais datos necesarios para as insercions os tedes no listado anterior ou podes buscalos  a partires dos datos dados en  dito listado


b2) modificación:
modificar o problema polo que se visitou o planeta 'bog' na serie 'star_trek' ca nave 'enterprise' , pois non e que o 'oxixeno disminue' senon que o 'oxixeno aumenta'. Os codigos correspondentes a  fila que debedes modificar debedes buscalos vos a partir dos nomes dados 


b3) eliminación
eliminar ao humano de codigo 'p27'
