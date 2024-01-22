:- use_module(frog/'_frog').
:- [frog/frog].

morph date(Y, M, _) ~> date(Y, M).
% morph date(Y, M) ~> date(Y, M, _).
% morph date(Y, _) ~> date(Y).

% morph date(Y, M, D) ~> exact_date(Y, M, D).
% morph date(Y, M) ~> exact_date(Y, M, 1).lga