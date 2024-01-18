:- multifile [(class)/1, (fact)/1, (implict)/1].

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
:- op(950, xfy, then).
:- op(900, fx, class).
:- op(900, fx, fact).
:- op(900, fx, explict).
:- op(900, fx, implict).
:- op(900, fx, query).
:- op(900, fx, run).
:- op(960, fx, if).
% :- op(900,fy,\+).

:- op(900, yfx, bind).
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

class _ :- false.
fact [].

explict X :- fact(Z), member(X, Z).
implict X :- 
  explict Z,
  Z =.. [Predic | Partial],
  partial_implict(Partial, ImplictPartial),
  X =.. [Predic | ImplictPartial].

partial_implict([], []).
partial_implict([Part | List], [Part | ImplictList]) :-
  implict Part,
  partial_implict(List, ImplictList).


:- dynamic result_list/1.
result_list([]).

query Query :- 
  implict Query,
  result_list(OldList),
  \+ member(Query, OldList),
  retract(result_list(OldList)),
  assertz(result_list([Query | OldList]));
  retract(result_list(_)),
  assertz(result_list([])).


Condition bind Binder :- 
  % print(Condition bind Binder), nl,
  (Condition, Binder = true; Binder = false), !, true.
run [].
run [Head | Tail] :- Head, run Tail bind Condition, !, Condition.
run NoList :- \+ is_list(NoList), NoList bind Condition, !, Condition.
if Condition then Run :- 
  % print(if Condition then Run), nl,
  (Condition, (run Run; true); true), !.

checking([]) :- true.
checking([ Inst | Fact ]) :-
  % write_ln("checking([ Inst | Fact ]) :-"),
  class(Inst) bind A,
  % write_ln("class(Inst) bind A,"),
  checking(Fact) bind B,
  % write_ln("checking(Fact) bind B,"),
  if \+ A then (
    write("Fail:" ),
    print(Inst),
    nl
  ), 
  % write_ln("if A then ("),
  % print(A),
  % write(','),
  % print(B),
  % nl,
  A, B.
  
frog_check :- 
  findall(A, (fact(Fact), checking(Fact) bind A), Result),
  run Result.


  
