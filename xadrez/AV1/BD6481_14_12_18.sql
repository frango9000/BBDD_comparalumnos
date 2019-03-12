1
select nomh from hotel where nomh like '%i%' and nomh like '%o%';

2
select count(*) from sala where nomh ='mexico';

3
select codp, nomp from participante where np=(select np from pais where nome='espanha');
select codp, nomp from participante, pais where participante.np=pais.np and nome='espanha';

4
select codp, count(*) from  xoga where codp in (select codp from participante where nomp='felipe') group by codp;
select participante.codp, count(*) from participante, xoga where participante.codp=xoga.codp and nomp='felipe' group by participante.codp;

5
select codp, nomp from participante where nomp in (select nomp from participante where codp in (select codp from arbitro)) and nomp in (select nomp from participante where codp in (select codp from xogador));

7
select nomh from hotel where nomh not in (select nomh from aloxa);

8
select nomm from dispon where cods in(select cods from sala where nomh ='vento');
select nomm from dispon, sala where sala.cods=dispon.cods and nomh='vento';

9
select participante.codp, nomp from participante, xoga, partida where dia='08' and mes ='06' and ano='2017' and xoga.codpa=partida.codpa and xoga.codp=participante.codp;

12
select sala.cods, count(partida.cods) from partida right join sala on partida.cods=sala.cods group by sala.cods;

13
select count(*) from participante where telfp is null;

