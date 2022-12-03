arr =: | (0 -.~ _3 + 'ZYX ABC' i. ])@>  cutopen 22 getin 2
cs =: (] + 3 * (3&|@-~ >:))
p1 =: +/ cs/"1 arr
p2 =: +/ ([ cs&:>: (3&|@+ {&(_1 0 1)))/"1 <: arr
p1;p2

