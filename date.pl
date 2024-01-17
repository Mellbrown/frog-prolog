:- [base].

class date(Y, M, D):- 
  integer(Y),
  integer(M),
  integer(D).

class date(Y, M):-
  integer(Y),
  integer(M).

implict date(Y, M) :- implict date(Y, M, _).
implict date(Y) :- implict date(Y, _).

fact [
  date(2024, 2),
  date(2024, 1)
].


:- initialization(frog_check).