:- [base].

class date(Y, M, D):- 
  integer(Y),
  integer(M),
  integer(D).

fact [
  date(2024, 1, 1),
  date(2024, 1, 2),
  date(2024, 1, 3)
].

:- initialization(frog_check).