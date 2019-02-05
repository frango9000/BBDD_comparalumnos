create or replace function fnombresxog return varchar2 as

ret varchar(1000);
vnomx xogador.nomx%type;

cursor cnomx is select nomx from xogador;

begin
for v in cnomx loop
	ret := ret || chr(10) || v.nomx;
end loop;
return ret;

end;
/
show errors;
