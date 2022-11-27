load 'stats'
NB. permutations
i =:([: <;._1 '|'&,)@> cutopen getin 21 99
w =: ;: 'abcefg cf acdeg acdfg bcdf abdfg abdefg acf abcdefg abcdfg'
q =: ' ' , "1 ( perm 7) { 'abcdefg'
trans =: [: /:~&.> [: ;: {&' abcdefg'
idx =: {{I."1 *./"1  e.&w trans q i."1 _ y}}
key =: {{+/ 10 #. w i. trans y}}@:(i."1 1~ {&q)
p2 =: +/ (([: > {:) key  idx@:>@:{.)"1 i 
<p2

NB. direct
i =: ;:;._2 getin 21 8

p1 =: ([: +/ [:, 2 4 3 7 e.~ [: #@> _4 {."1 ]) i

key =: (#@] , [: +/"1  e. )&:>"_ 0/
t =: w key~ 'cf' >@; 'bcdf'
t24 =: 0 2 { >@(/: #@>) 
p2 =: +/ 10 #. (t i. _4&{.   key~  [: t24  10 {. ] )"1 i

p1;p2

NB. 89 byte golfed version to flex on the python golfers lol
+/{{".{{'4725360918'{~11|15|<.-:+/,y}}"_1]0|:(_4&{.e.&:>"_ 0/10{.])y}}"1;:;._2 getin 21 8


