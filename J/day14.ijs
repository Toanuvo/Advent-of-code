i =: cutopen  getin 21 99
s =: > {. i
'p q' =: |: ((2 {. ]) ; {: )@> }. i

NB. string
p1 =: (>./ - <./)  #/.~ ({: ,~ [: ,/ 2 ({. , [: {&q p&i. )\ ])^:10 s

NB. counts
pts_mtx =: [: $.^:_1 (1) $. (([: >: >./) ; 0  ; 0 ; ] ; 1 $~ # )
t =: q (p i. ((,~ {.) ,. (, {:)))"0 1 p
tm =: ([: pts_mtx ,.)"1 t
sm =: (# p) {. pts_mtx ,. 2 p&i.\ s

a =: ([: +/ tm&(*"1 0))^:40 sm
p2 =: (>./ - <./) >. -: +/ +/ a * (~.@:, e."1 0 ]) p
p1;p2

