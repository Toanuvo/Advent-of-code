digits =: "."0@":"0 :. (10&#.)
spo =: {{[: u;._1 v , ]}}
g =: [ $ [: (#&1 0 _1 0) 4&$ 

arr =: digits {. ] spo LF 19 getin 16 
p1 =: 10 #. 8 {. {{10 | | (+/@:* (g (#y) >:@- ])@#)\. y}}^:100 arr
p2 =: 10 #. 8 {. (10 | +/\.)^:100  (}.~ 10 #. 7 {. ]) , 10000 # ,: arr
p1;p2