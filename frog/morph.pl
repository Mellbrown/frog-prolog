:- use_module('_morph').

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
