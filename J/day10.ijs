R =: ')]}>'
scr =: [: {&(3 57 1197 25137) R&i.
scr2 =: ([: (+ 5&*)/@:|. 0 , ' )]}>'&i.)
flip =: {{|. {&'})>]' '{(<['&i. -.&' ' y}}
typ =: {{{. I. e."1&(4 2$'()[]{}<>') y}}
stp =: 4 : 0
x (1&Z:@:(~:&:typ {:))^:(e.&R@[)  y
y ,`((}:@[)`]@.((~:&:typ {:)~))@.(e.&R@]) x  
)
 
p1 =: +/ ([: 0:`scr@.(1 = #) [: [F..stp -.&' ');._2 getin 21 10
p2 =: ({~ <.@-:@#) /:~ -.&0 ([:  ([: scr2 flip)`0:@.(1 = #) [:  [F..stp -.&' ');._2 getin 21 10
p1;p2
