i =: cutopen getin 21 20
t =: '#' = > {. i
b =: '#' = > }. i
P =: 1
stp =:{{P =:  -. P
(3 3) ([: {&t #.@:,);._3 P&pad^:2  y}}
p1 =: +/ , stp^:2 b
p2 =: +/ , stp^:50 b
p1;p2