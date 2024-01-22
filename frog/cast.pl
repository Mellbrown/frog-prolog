:- use_module(h/'cast.h').

:- ['typeof'/'typeof', 'morph'].

A cast B typeof T :-
  morph A ~> B,
  B typeof T.