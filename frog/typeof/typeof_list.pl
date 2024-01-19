:- use_module('_typeof').


shorten_list_type([], []).
shorten_list_type([T], [T]).
shorten_list_type([T | Ts], Ts0) :-
  shorten_list_type(Ts, Ts0),
  [T] = Ts0.

Os typeof Ts :- 
  full:(Os typeof Ts0), 
  (
    shorten_list_type(Ts0, Ts), length(Ts, 1), !;
    Ts0 = Ts  
  ).

full:([] typeof []).
full:([O | Os] typeof [T | Ts]) :-
  O typeof T,
  full:(Os typeof Ts).
