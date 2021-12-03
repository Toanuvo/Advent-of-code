n =: "."0 > cutopen getin 21 3
p1 =: (*&:#. -.) (+/ < # - +/) n
gen =: 1 : 0 
	v =. u (>: (# y) - ]) x { +/ y
	y =. (#~ v = x&{"1) y
	(>:x) (#.@:]`(u gen)@.(1 < # y)) y
)
p2 =. 0 (] gen * -. gen) n
p1;p2
