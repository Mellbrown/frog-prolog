:- use_module(frog/'_frog').
:- [frog/frog].


morph date(Y, M, _) ~> date(Y, M).
morph date(Y, _) ~> date(Y).
