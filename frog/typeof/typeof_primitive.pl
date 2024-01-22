:- use_module('typeof.h').

O typeof T :-
  (
    var(O), T = var;
    O = true, T = bol;
    O = false, T = bol;
    integer(O), T = int;
    float(O), T = flt;
    atom(O), T = atm;
    string(O), T = str
  ), 
  !.
