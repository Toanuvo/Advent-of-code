arr =: 0 _1 _1 +"1 1 ".@> (1 3 5)&{"1 (<  spo ' ')@> 9 }. cutopen 22 getin 5
S =: |.@:(-.&' ')&.> <"1 }."1 (#~ [: e.&'123456789' {."1) |."1 |: > 9 {. cutopen  22 getin 5 

g =: 1 : 0
  'n a b' =: x
  'A B' =: (a,b) { y
   B =: (u n {. A) , B
   A =: n }. A
   (A;B) (a,b)} y
)

p1 =: {.@> S [F..(|.g) arr
p2 =: {.@> S [F..( [g) arr
p1;p2
