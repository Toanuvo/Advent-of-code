xm =: 81
xx =: 129
ym =: _150
yx =: _108

pu =: ({. + {:) ,: ((+ [: - *)@[ , <:@])/@:{:
inb =: ((xm&<: *. <:&xx)@{. *.(ym&<: *. <:&yx)@{:)
pts =: ([: inb@:{. [: pu^:((-.@inb *. xx&>@{. *. ym&<@{:)@:{.)^:(_) 0 0 ,: ])

xs =: >. >./  1 {:: p. |. 1 1 , - +: xm
xv =: xs ([ + [: i.@>: -~) xx
yv =: i: ym

p1 =: -: (+ *:) <: | ym 
p2 =: +/  pts"1   ,/ xv ,"0 0/ yv

p1;p2
