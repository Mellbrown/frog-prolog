:- use_module('_morph').

:- multifile (morph)/1.
:- table (morph)/1.
:- table (~>)/2.


morph V1 ~> V2 :- var(V1), var(V2), V1 = V2, !.

morph A ~> A :- nonvar(A), \+ is_list(A), \+ compound(A).

morph A ~> C :-
  nonvar(A),
  morph A ~> B, A \= B,
  morph B ~> C, B \= C,
  A \= C;
  nonvar(C),
  morph B ~> C, B \= C,
  morph A ~> B, A \= B,
  A \= C.

morph [] ~> [].
morph [A] ~> [B] :- 
  morph A ~> B.
morph [A | As] ~> [B | Bs] :-
  morph A ~> B,
  morph As ~> Bs.

morph A ~> B :-
  nonvar(A), compound(A), \+ is_list(A), \+ atomic(B),
  compound_name_arguments(A, N, As),
  morph As ~> Bs,
  compound_name_arguments(B, N, Bs);
  nonvar(B), compound(B), \+ is_list(B), \+ atomic(A),
  compound_name_arguments(B, N, Bs),
  morph As ~> Bs,
  compound_name_arguments(A, N, As).

