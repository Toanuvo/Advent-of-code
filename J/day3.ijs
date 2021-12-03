n =: "."0 > cutopen getin 21 3
p1 =: (*&:#. -.) (+/ < # - +/) n
oxy =: 3 : 0''
for_i. i. # {. n do.  NB. loop nloops times
	v =: i { +/ n
	n =. (#~ (v >: (# n) - v) = i&{"1) n
	if. 1 = # n do. break. end.
end.
#.n
)
co2 =: 3 : 0''
for_i. i. # {. n do.  NB. loop nloops times
	v =: i { +/ n
	n =. (#~ (v < (# n) - v) = i&{"1) n
	if. 1 = # n do. break. end.
end.
#.n
)
p2 =: oxy * co2
p1;p2
