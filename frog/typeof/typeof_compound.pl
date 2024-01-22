:- use_module('typeof.h').

O typeof T :-
  (compound(O); var(O)), compound_name_arguments(O, T0, Os),
  full:(Os typeof Ts),
  (
    (compound(T); var(T)), compound_name_arguments(T, T0, Ts);
    T = T0
  ).