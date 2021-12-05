NB. iterative
b =: ([: ".;._1 ','&,);._1"1 '-',"1 -.&'>'"1 >cutopen getin 21 5
mv =: >: >./ , b
sb =: (mv,mv) $ 0
grid =: 3 : 0
'x0 y0 x1 y1' =: ,y
while. (x0 ~: x1) +. y0 ~: y1 do.
	sb =: (<y0,x0) ((>:@:{)`[`])} sb
	x0 =: x0 + x0 < x1
	y0 =: y0 + y0 < y1	
	x0 =: x0 - x0 > x1
	y0 =: y0 - y0 > y1	
end.
sb =: (<y0,x0) ((>:@:{)`[`])} sb
)
p1 =: +/ 1 < , {: grid"_1  (#~ ([: +./"1 =/)"_1) b
sb =: (mv,mv) $ 0
p2 =: +/ 1 < , {: grid"_1   b 
p1;p2

NB. array
segs =: _4 (2 2&$)\ ". ' ' (I. -. in e. '0123456789')} in =. getin 21 5
pts =: (<. + i.@(+ *)@-)/
p1 =: +/ 1 < #/.~ ; <@|:@:pts"_1 (#~ (+./ . =/)"_1) segs
p2 =: +/ 1 < #/.~ ; <@|:@:pts"_1 segs
p1;p2
