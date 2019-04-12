load data
infile parentes_variable.txt
into table parentes
append
fields terminated by ','
trailing nullcols
(
numero,
nome,
apelidos,
sexo,
datan "to_date(:datan,'YYYYMMDD')"
)
