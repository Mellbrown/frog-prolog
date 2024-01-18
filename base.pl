
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
% :- op(900,fy,\+).

:- op(890, fx, note).
:- op(890, fx, #).

:- op(891, xfy, note).
:- op(891, xfy, #).

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


