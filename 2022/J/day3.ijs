arr =: cutopen 22 getin 3
a =: ' ' , , a. {~ 97 65 +/ i. 26
p1 =: +/ a i.   (~.@(e. # [)/@$~ 2 , -:@#)@> arr
p2 =: +/,a i. _3 ~.@(e. # [)/\&:> arr
p1;p2
