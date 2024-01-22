:- ['..'/frog/frog].

morph date(Y, M, D) ~> date(Y, M):- integer(Y), integer(M), integer(D).
morph date(Y, M) ~> date(Y):- integer(Y), integer(M).

morph date(Y, M, D) <~> date(Y/M/D):- integer(Y), integer(M), integer(D).
morph date(Y, M) <~> date(Y/M):- integer(Y), integer(M).

