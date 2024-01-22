:- use_module('typeof.h').

O typeof T :-
  (
    var(O), T = var;
    O = true, T = boolean;
    O = false, T = boolean;
    integer(O), T = integer;
    float(O), T = float;
    atom(O), T = atom;
    string(O), T = string
  ), 
  !.
