:- use_module('morph.h').
:- ['..'/'prefixer'].

def implict morph X :- 
  use implict mold morph X.

def implict mold morph X :- use 50 over morph X.

def implict mold morph A ~> C :-
  nonvar(A),
  use implict mold morph A ~> B, A \= B,
  use implict mold morph B ~> C, B \= C,
  A \= C;
  nonvar(C),
  use implict mold morph B ~> C, B \= C,
  use implict mold morph A ~> B, A \= B,
  A \= C.

% implict A cast B typeof T :-
%   implict morph A ~> B,
%   B typeof T.