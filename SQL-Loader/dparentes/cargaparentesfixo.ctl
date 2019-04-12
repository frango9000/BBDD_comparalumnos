load data
infile parentes_fixo.txt
into table parentes
append
trailing nullcols
(
numero position(1:3),
nome position(4:11),
apelidos position(12:25),
sexo position(26:26),
datan position(27:34) "to_date(:datan,'YYYYMMDD')"
)
