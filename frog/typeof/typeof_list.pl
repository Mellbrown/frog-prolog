:- use_module('_typeof').

[] typeof [].
[O | Os] typeof [T | Ts] :-
  O typeof T,
  Os typeof Ts.
