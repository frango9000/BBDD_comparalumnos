load data
infile parentes_fixo.txt
into table parentes_m
append
when (sex='M')
trailing nullcols
(
numero position(1:3),
nome position(4:11),
apelidos position(12:25),
sex filler position(26:26)
)
