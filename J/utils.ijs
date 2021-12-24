getin =: fread ('inputs/20'&,@:{.  ,  '/input'&,@:{:)@:>@:(8!:0)
pad =: [ , [ ,~ [ ,. [ ,.~ ] NB. https://code.jsoftware.com/wiki/Essays/Game_of_Life
spo =: {{[: u;._1 v , ]}}