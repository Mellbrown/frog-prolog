:- use_module('_typeof').


O typeof T :-
  \+ is_list(O),
  O =.. [T0 | Os],
  full:(Os typeof Ts),
  T =.. [T0 | Ts].