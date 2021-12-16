fhex =: [: #: '0123456789ABCDEF'&i.

T =: 0

ps =: (@:{.) ;~ }.	
pp =: 3 : 0
s =. y
's v' =. 3 #. ps s
's t' =. 3 #. ps s
T =: T + v

if. t = 4 do. 
  n =. 0
  whilst. con ~: 0 do.
    's c' =. 5 (}. ; {.) s
    'tv con' =. (}. ; {.) c
    n =. n , tv
  end.
  s ; #. n
else.  
  's L'  =. (}. ; {.) s
  's sl' =. (L { 15 11 ) #. ps s

  vals =. 0$0

  if. L = 0 do.
    's ms' =. sl ] ps s
    while. 0 < # ms do.
      'ms vals' =.  (]`([: < vals&,@>))"0 pp ms
    end.
  else.
    for_i. i. sl do.
      's vals' =. (]`([: < vals&,@>))"0 pp s
    end.
  end.

  s ; (+`*`<.`>.`]`>`<`=)@.t/ vals
end.
)

p2 =: > {: pp ,/ fhex }: getin 21 16
p1 =: T
p1;p2
