i =: "."0;._2 getin 21 9
pad =: ([ , [ ,~ [ ,. [ ,.~ ]) NB. https://code.jsoftware.com/wiki/Essays/Game_of_Life
eg =: (2 | i. 9)&#

b =: _ pad i
m =: (3 3) ([: *./ eg@:, > 4 { ,);._3 b
p1 =: (+/ , m) + +/ , i *  m

chk =: [: 4&{`({.@:(#~ 0&>)@:eg)@.(([: +./ 0 > eg) *. 9 ~: 4&{) ,
b =:  (i * -. m) + - (* ($ $ +/\@:,))  m
p2 =:  */ 3 {. \:~ (#/.~ #~ 0 > ~.) , ((3 3) (chk;._3)  _&pad)^:_ b
p1;p2

