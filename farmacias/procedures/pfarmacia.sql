/*
pfarmacia
procedimento que imprima para  un nome de famacia  os nomes dos medicamentos que ten en stock e o nome da sua presentacion  
asi como os nomes dos laboratorios que elaboraron ditos medicamentos.



exemplo: execute pfarmacia('cacharro2');
resultado:

medic.: norflox    present.: 20mg   labor.: sandoz
medic.: eferalgan    present.: 20mg   labor.: upsamedica
medic.: flumil    present.: 20mg   labor.: pharmazan
medic.: omeprazollab    present.: 50gr   labor.: labesfal
medic.: omeprazollab    present.: 200mg   labor.: labesfal
medic.: omeprazolmerc    present.: 400mg   labor.: esteve
medic.: omeprazolmerc    present.: 500mg   labor.: esteve
*/
create or replace procedure pfarmacia(vnomf farmacias.nomf%type) as
vcodf farmacias.codf%type;
vcodm medicamentos.codm%type;
vnomm medicamentos.nomm%type;
vcif medicamentos.cif%type;
vcodpre presentacions.codpre%type;
vnompre presentacions.nompre%type;
vnoml laboratorios.noml%type;

cursor ccodm is select codm, codpre from stock where codf = vcodf and cantidads > 0;

begin
select codf into vcodf from farmacias where nomf=vnomf;

for x in ccodm loop
	select nomm, cif into vnomm, vcif from medicamentos where codm = x.codm;
	select nompre into vnompre from presentacions where codpre = x.codpre;
	select noml into vnoml from laboratorios where cif = vcif;
	dbms_output.put_line('medic.: ' || vnomm || ' present.: ' || vnompre || ' labor.: ' || vnoml);
end loop; 



exception
when no_data_found then
dbms_output.put_line('Alert'||chr(10)||'Error...');

end;
/
show errors;
