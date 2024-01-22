:- use_module(h/'cast.h').

:- ['typeof'/'typeof', 'morph', 'implict'].

A cast B typeof T :-
  morph A ~> B,
  B typeof T.

implict A cast B typeof T :-
  implict morph A ~> B,
  B typeof T.