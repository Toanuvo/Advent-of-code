arr =: , > cutopen 22  getin 6
f =: {{x + {. I. x (x = #@:~.)\ y}}
p1 =: 4 f arr
p2 =: 14 f arr
p1;p2
