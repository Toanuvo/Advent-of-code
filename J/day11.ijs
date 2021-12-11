i =: "."0;._2 getin 21 11
pad =: [ , [ ,~ [ ,. [ ,.~ ] NB. https://code.jsoftware.com/wiki/Essays/Game_of_Life
f =: {{4&{ (+ [: +/ 9&<)^:(0 ~: 4&{) 0&*^:(9 < 4&{) , y}}
aeq =: 1 = [: # ~.
stp =: [: (3 3 (f;._3)  0&pad)^:_ >:   

p1 =: +/ 0 = , stp^:(<101) i
p2 =: <: # stp^:(-.@:aeq)^:(<_) i
p1;p2
