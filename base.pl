:- multifile [(class)/1, (fact)/1, (implict)/1].

:- op(900, fx, class).
:- op(900, fx, fact).
:- op(900, fx, explict).
:- op(900, fx, implict).
:- op(900, fx, query).

class _ :- false.
fact [].

explict X :- fact(Z), member(X, Z).
implict X :- explict X.

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
