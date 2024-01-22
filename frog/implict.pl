:- use_module(h/'implict.h').

:- ['morph', 'cast'].

:- table 'implict'/1.

implict morph X :- morph X.
implict morph A ~> C :-
  nonvar(A),
  implict morph A ~> B, A \= B,
  implict morph B ~> C, B \= C,
  A \= C;
  nonvar(C),
  implict morph B ~> C, B \= C,
  implict morph A ~> B, A \= B,
  A \= C.

implict A cast B typeof T :-
  implict morph A ~> B,
  B typeof T.