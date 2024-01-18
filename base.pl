
% :- op(1,fx,$).
% :- op(100,yfx,'.').
% :- op(200,fy,+).
% :- op(200,fy,-).
% :- op(200,fy,\).
% :- op(200,xfx,**).
% :- op(200,xfy,^).
% :- op(400,yfx,*).
% :- op(400,yfx,/).
% :- op(400,yfx,//).
% :- op(400,yfx,<<).
% :- op(400,yfx,>>).
% :- op(400,yfx,div).
% :- op(400,yfx,mod).
% :- op(400,yfx,rdiv).
% :- op(400,yfx,rem).
% :- op(400,yfx,xor).
% :- op(500,yfx,+).
% :- op(500,yfx,-).
% :- op(500,yfx,/\).
% :- op(500,yfx,\/).
% :- op(600,xfy,:).
:- op(690, fx, note).
:- op(690, fx, #).
:- op(691, xfy, note).
:- op(691, xfy, #).
% :- op(700,xfx,:<).
% :- op(700,xfx,<).
% :- op(700,xfx,=).
% :- op(700,xfx,=..).
% :- op(700,xfx,=:=).
% :- op(700,xfx,=<).
% :- op(700,xfx,==).
% :- op(700,xfx,=@=).
% :- op(700,xfx,=\=).
% :- op(700,xfx,>).
% :- op(700,xfx,>:<).
% :- op(700,xfx,>=).
% :- op(700,xfx,@<).
% :- op(700,xfx,@=<).
% :- op(700,xfx,@>).
% :- op(700,xfx,@>=).
% :- op(700,xfx,\=).
% :- op(700,xfx,\==).
% :- op(700,xfx,\=@=).
% :- op(700,xfx,as).
% :- op(700,xfx,is).
% :- op(800,xfx,:=).
:- op(850, yfx, typeof).
:- op(850, yfx, typeof_).
:- op(860, yfx, cast).

% :- op(900,fy,\+).


:- op(900, fx, query).
:- op(900, fx, run).
:- op(900, yfx, bind).
:- op(900, fx, book).


:- op(950, xfy, then).
:- op(950, xfy, ~>).
:- op(950, xfy, <~>).
:- op(950, xfy, <~).

:- op(960, fx, if).
:- op(960, fx, morph).

% :- op(1000,xfy,',').
% :- op(1050,xfy,*->).
% :- op(1050,xfy,->).
% :- op(1100,xfy,;).
% :- op(1105,xfy,'|').
% :- op(1150,fx,discontiguous).
% :- op(1150,fx,dynamic).
% :- op(1150,fx,initialization).
% :- op(1150,fx,meta_predicate).
% :- op(1150,fx,module_transparent).
% :- op(1150,fx,multifile).
% :- op(1150,fx,public).
% :- op(1150,fx,table).
% :- op(1150,fx,thread_initialization).
% :- op(1150,fx,thread_local).
% :- op(1150,fx,volatile).
% :- op(1200,fx,:-).
% :- op(1200,fx,?-).
% :- op(1200,xfx,-->).
% :- op(1200,xfx,:-).
% :- op(1200,xfx,=>).

:- multifile [
  (book)/1,
  (morph)/1
].

run [].
run [Head | Tail] :- Head, run Tail bind Condition, !, Condition.
run NoList :- \+ is_list(NoList), NoList bind Condition, !, Condition.

Condition bind Binder :- (Condition, Binder = true; Binder = false), !, true.

if Condition then Run :- (Condition, (run Run; true); true), !.

% book [].

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

morph #Note <~> note Note.

% % [note]

:- table (shorten_list_type)/2.

shorten_list_type([], []).
shorten_list_type([T], [T]).
shorten_list_type([T0 | Ts0], Ts) :-
  shorten_list_type(Ts0, [T1]),
  T0 = T1,
  Ts = [T0].

:- table (typeof)/2.

O typeof T :-
  (
    var(O), T = var;
    O = true, T = boolean;
    O = false, T = boolean;
    integer(O), T = integer;
    float(O), T = float;
    % rational(O), T = rational;
    % number(O), T = number;
    atom(O), T = atom;
    string(O), T = string
    % atomic(O), T = atomic;
  ), !.

Os typeof Ts :-
  Os typeof_ Ts0,
  (
    shorten_list_type(Ts0, Ts), length(Ts, 1);
    Ts = Ts0
  ), !.

[] typeof_ [].
[O | Os] typeof_ [T | Ts] :-
  O typeof T,
  Os typeof_ Ts.

  % shorten_list_type(Ts0, Ts), 
  % length(Ts, 1), 
  % !.


  

  
  
  

morph #Note0 #Note1 <~> [#Note0, #Note1].
% morph Notes0 #Note1 <~> Notes :-
%   maplist(\X^(type # X), Notes0).
  % append_item(Notes0, Note1, Notes).


:- table (query)/1.

query Query :-
  book Notes0,
  flatten(Notes0, Notes),
  member(Note0, Notes),
  morph Note0 ~> # Note,
  Query = # Note.