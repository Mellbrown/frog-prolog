:- ['frog'/'frog'].

morph date(Y, M, D) <~> date(Y, M) :- nonvar(D).
morph date(Y, M) <~> date(Y) :- nonvar(M).

morph date(Y, M, D) ~> exact_date(Y, M, D).
morph date(Y, M) ~> exact_date(Y, M, 1).
morph date(Y) ~> exact_date(Y, 1, 1).
