:- use_module(h/'cast.h').

:- ['typeof'/'typeof', 'morph', 'def_use'].

:- table 'cast'/2.

A cast B typeof T :-
  use morph A ~> B,
  B typeof T.

% implict A cast B typeof T :-
%   implict morph A ~> B,
%   B typeof T.