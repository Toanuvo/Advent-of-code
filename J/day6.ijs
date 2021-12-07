NB. array based 
i  =: ".;._1  }: ',' , getin 21 6
v  =: 3 : ' 6 (I. _1 = arr)}  arr =.  (, 8 $~ [: +/ _1&= ) <: y' 
p1 =: # v^:80 i
p1

NB. count based
i  =: <: #/.~ (i.9) , ".;._1  }: ',' , getin 21 6
v2 =: [: (6} ~ ({: + 6&({ ))) 1 |. ]
p1 =: +/ v2^:80 i
p2 =: +/ v2^:256 i
p1;p2

