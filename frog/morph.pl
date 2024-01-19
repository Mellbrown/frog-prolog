:- module('morph', [
  op(960, fx, morph),
  op(950, xfy, ~>),
  op(950, xfy, <~>),
  op(950, xfy, <~),
  'morph'/1
]).

:- multifile (morph)/1.
:- table (morph)/1.
:- table (~>)/2.
:- table (<~)/2.
:- table (<~>)/2.

morph A ~> A.
morph A <~ A.
morph A <~> A.

morph A ~> B :- morph B <~ A.
morph A <~ B :- morph A ~> B.

morph A ~> B :- morph A <~> B.
morph A ~> B :- morph B <~> A.

morph A <~ B :- morph A <~> B.
morph A <~ B :- morph B <~> A.

morph A <~> B :- morph B <~> A.