:- use_module('_cast').
:- use_module('typeof'/'_typeof').
:- use_module('_morph').

:- ['morph'].

A cast B typeof T :-
  morph A ~> B,
  B typeof T.