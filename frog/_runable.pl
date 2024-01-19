:- module('runable', [
  op(900, fx, run),
  op(900, yfx, bind),
  op(950, xfy, then),
  op(960, fx, if),
  'run'/1,
  'bind'/2,
  'if'/1
]).

run [].
run [Head | Tail] :- Head, run Tail bind Condition, !, Condition.
run NoList :- \+ is_list(NoList), NoList bind Condition, !, Condition.

Condition bind Binder :- (Condition, Binder = true; Binder = false), !, true.

if Condition then Run :- (Condition, (run Run; true); true), !.