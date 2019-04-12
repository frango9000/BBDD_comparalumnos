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

into table parentes_h
append
when (sex='H')
fields terminated by ','
trailing nullcols
(
numero position(1),
nome,
apelidos,
sex filler,
datan "to_date(:datan,'YYYYMMDD')"
)
