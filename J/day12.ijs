i =: ([:  <;._1 '-'&,);._2 getin 21 12
k =:  ~. , i
uc =: 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
sc =:  k&i. (#~ -.@([: +./"1 e.&uc)@>) k
adj =: $.^:_1 ] 1 $. (([: >: [: >./ k&i."0) ; 0 1 ; 0 ; k&i."0 ; 1 $~ #) (, |."1) i

's e' =: k i. 'start';'end'


f2 =: 4 : 0
'part cave' =: y
seen =: x

if. cave = e do. 1 return. end.
if. cave e. seen do. 
	if. cave = s do. 0 return. end.
	if. cave e. sc do.
		if. part = 1 do. 
			0 return. 
		else. 
			part =: 1 
		end.
	end.
end.

n =: (i. # k) #~ cave {adj 

+/ (seen , cave)&f2"1  part ,"1 0 n
)

p1 =: _1 f2 1 , s
p2 =: _1 f2 2 , s
p1;p2
