n  =: ". ;._1 }: ',' , getin 21 7
p1 =: <./ ([: +/ |@-)"0 1~ n 
NB. simple
p2 =: <./ ([: +/ (<.@-:@(+ *:))@|@-)"0 1~ n
NB. fast
p2 =: <./ ([: +/ (<.@-:@(+ *:))@|@-&n)"0 (, <: , >: ) <. (+/ % #) n
p2;p2