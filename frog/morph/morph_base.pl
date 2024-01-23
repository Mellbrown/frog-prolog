:- use_module('morph.h').
:- ['..'/'prefixer'].

:- table 'morph'/1.
:- table '~>'/2.
:- table '<~'/2.
:- table '<~>'/2.

def _ mold morph V1 ~> V2 :- var(V1), var(V2), V1 = V2, !.
def _ mold morph V1 <~ V2 :- var(V1), var(V2), V1 = V2, !.
def _ mold morph V1 <~> V2 :- var(V1), var(V2), V1 = V2, !.

def _ mold morph A ~> A :- nonvar(A), \+ is_list(A), \+ compound(A).
def _ mold morph A <~ A :- nonvar(A), \+ is_list(A), \+ compound(A).
def _ mold morph A <~> A :- nonvar(A), \+ is_list(A), \+ compound(A).

def T mold morph A ~> B :- use T mold morph B <~ A.
def T mold morph A <~ B :- use T mold morph B ~> A.

def T mold morph A ~> B :- use T mold morph A <~> B.
def T mold morph A <~ B :- use T mold morph A <~> B.

def T mold morph A <~> B :- use T mold morph A ~> B, use T mold morph A <~ B.
def T mold morph A <~> B :- use T mold morph B <~> A.

% def _ mold morph (A ~> B) <~> (B <~ A).
% def _ mold morph (A ~> B) <~ (A <~> B).
% def _ mold morph (A <~ B) <~ (A <~> B).
% def _ mold morph (A <~> B) <~> (B <~> A).

def _ mold morph [] ~> [].
def T mold morph [A] ~> [B] :- 
  use T mold morph A ~> B.
def T mold morph [A | As] ~> [B | Bs] :-
  use T mold morph A ~> B,
  use T mold morph As ~> Bs.

def T mold morph A ~> B :-
  nonvar(A), compound(A), \+ is_list(A), \+ atomic(B),
  compound_name_arguments(A, N, As),
  use T mold morph As ~> Bs,
  compound_name_arguments(B, N, Bs);
  nonvar(B), compound(B), \+ is_list(B), \+ atomic(A),
  compound_name_arguments(B, N, Bs),
  use T mold morph As ~> Bs,
  compound_name_arguments(A, N, As).

