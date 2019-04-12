load data
infile parentes_variable.txt
into table parentes_m
append
when (sex='M')
fields terminated by ','
trailing nullcols
(
numero,
nome,
apelidos,
sex filler,
datan filler
)
