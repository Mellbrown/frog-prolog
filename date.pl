:- [base].

class date(Y, M, D):- 
  integer(Y),
  integer(M),
  integer(D).

class date(Y, M):-
  integer(Y),
  integer(M).

class date(Y):-
  integer(Y).

class exact_date(Y, M, D):-
  integer(Y),
  integer(M),
  integer(D).

implict date(Y, M) :- implict date(Y, M, _).
implict date(Y) :- implict date(Y, _).
implict exact_date(Y, M, D) :- implict date(Y, M, D).
implict exact_date(Y, M, 1) :- implict date(Y, M).
implict exact_date(Y, 1, 1) :- implict date(Y).

fact [
  date(2024, 2),
  date(2024, 1),
  exact_date(2024, 1, 1)
].


:- initialization(frog_check).