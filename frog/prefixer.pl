:- use_module(h/'prefixer.h').

:- multifile 'def'/1.
:- table 'explict'/1.
:- table 'implict'/1.
:- table 'over'/2.
:- table 'mold'/2.
:- table 'def'/1.
:- table 'use'/1.
:- table overs/2.

overs(X, Os):- 
  findall(O, (clause(def O over X, _), integer(O), O > 0), Os0),
  sort(Os0, Os1),
  reverse(Os1, Os).
  
use X :-
  \+ X =.. ['over' |  _ ],
  overs(X, Os),
  use Os over X.

use [] over X :-
  def X.

use [Top | Bottoms] over X :-
  \+ integer(Top), !, writeln('error!');
  \+ Top > 0, !, writeln('error!');
  def Top over X;
  use Bottoms over X.

use Top over X :-
  integer(Top), 
  Top > 0,
  overs(X, Os0),
  include(>=(Top), Os0, Os),
  use Os over X.
  