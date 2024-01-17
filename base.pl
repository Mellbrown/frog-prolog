:-op(900, fx, query).
:-op(900, fx, class).
:-op(900, fx, fact).
  
query(Query):-
  fact(Fact),
  member(Query, Fact).

:- discontiguous('/'(class ,1)).
class _ :- false.

:- discontiguous('/'(fact, 1)).
fact [].

checking([]) :- true.
checking([ Inst | Fact ]) :-
  A = checking(Fact),
  B = class(Inst), 
  (
    B; 
      write("Fail:" ),
      print(Inst),
      nl
  ), !, A, B.
  
frog_check :- 
  false;
  fact(Fact), 
  checking(Fact).


